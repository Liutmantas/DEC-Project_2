# import all the libraries:
import requests
import pandas as pd
import logging
from sqlalchemy import create_engine, Table, Column, Integer, String, MetaData, Float, JSON
from sqlalchemy.engine import URL
from sqlalchemy.dialects import postgresql
from secrets_config import db_user, db_password, db_server_name, db_database_name

# replace the "demo" apikey below with your own key from https://www.alphavantage.co/support/#api-key
# documentation - https://www.alphavantage.co/documentation/
# outputsize = compact will return just previous day trade, full - over 20 yrs of data

params = {
    "function": "TIME_SERIES_DAILY_ADJUSTED",
    "symbol": "IBM",
    "outputsize": "full",
    "datatype": "json"
}

url = 'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=QB4Z8IGGKJNRB5Q1'
response = requests.get(url, params=params)
response_data = response.json()


# normalizing dataftrame
df_norm = pd.json_normalize(data=response_data)

# formating data
my_list=[]

for timestamp in response_data["Time Series (Daily)"].keys():
    record={
    
        "timestamp": timestamp,
        "open": response_data["Time Series (Daily)"][timestamp]["1. open"],
        "high": response_data["Time Series (Daily)"][timestamp]["2. high"],
        "low": response_data["Time Series (Daily)"][timestamp]["3. low"],
        "close": response_data["Time Series (Daily)"][timestamp]["4. close"],
        "adjusted_close": response_data["Time Series (Daily)"][timestamp]["5. adjusted close"],
        "volume": response_data["Time Series (Daily)"][timestamp]["6. volume"],
        "dividend_amount": response_data["Time Series (Daily)"][timestamp]["7. dividend amount"],
        "split_coefficient": response_data["Time Series (Daily)"][timestamp]["8. split coefficient"]
   

    }
    my_list.append(record)


# show norm:
df_norm.columns

# dataframe to csv file
df_norm.to_csv('output.csv')


# create connection to database 
connection_url = URL.create(
    drivername = "postgresql+pg8000", 
    username = db_user,
    password = db_password,
    host = db_server_name, 
    port = 5432,
    database = db_database_name, 
)

engine = create_engine(connection_url)
print(engine)


# specify target table schema 
meta = MetaData()
Raw = Table(
    "raw_data", meta,
    Column("timestamp", String, primary_key=True),
    Column("open", Float),
    Column("high", Float),
    Column("low", Float),
    Column("close", Float),
    Column("adjusted_close", Float),
    Column("volume", Integer),
    Column("dividend_amount", Float),
    Column("split_coefficient", Float)
   )
meta.create_all(engine) # creates table if it does not exist


# insert the data into the table
insert_statement = postgresql.insert(Raw).values(my_list[0:1000])
upsert_statement = insert_statement.on_conflict_do_update(
    index_elements=['timestamp'],
    set_={c.key: c for c in insert_statement.excluded if c.key not in ['timestamp']})
with engine.connect() as connection: 
    connection.execute(upsert_statement)

