<p align="center"> 
  <img src="src/images/gears.jpeg" alt="stock logo" width="360px" height="180px">
</p>
<h1 align="center"> <b> Single Stock Analytics ELT </b> </h1>
<h3 align="center"> Data Engineer Camp - Group Project #2 - Nov 2022 </h3>  

---


## Objective (INCOMPLETE)

This is a data engineering pipeline that extracts, loads and transforms a single set of stock data from the [Alpha Vantage API](https://www.alphavantage.co/documentation/). 

The output of the pipeline could be used by data/business analysts, investment managers and other finance professionals, data and finance journalists alike, depending on the specific use case.

## Source dataset (INCOMPLETE)

The pipeline currently contains the following dataset:

- [Foreign Exchange (FX) daily exchange rates](https://www.alphavantage.co/documentation/#currency-exchange) for a single company (IBM)

## Architecture (INCOMPLETE)

<p align="center"> 
  <img src="src/images/ELT.png" alt="arch" width="720px" height="576px">
</p>

### EXTRACT (ML)

- Data extraction form the API https://www.alphavantage.co/
- Sign up to receive API Key: https://www.alphavantage.co/support/#api-key
- API parameters can be found: https://www.alphavantage.co/documentation/


### LOAD (ML)

- Load to Postgres:
<p align="center"> 
  <img src="src/images/postgres_output.PNG" alt="arch" width="720px" height="576px">
</p>

- Use Airbyte to connect Postgres to Snowflake:
<p align="center"> 
  <img src="src/images/Airbyte_connect.PNG" alt="arch" width="720px" height="576px">
</p>

- Push data into the Snowflake RAW table:
<p align="center"> 
  <img src="src/images/Snowflake_Raw.PNG" alt="arch" width="720px" height="576px">
</p>

- Create in Snowflake user, roles, database and warehouse. Grand user access to the loaded data:
<p align="center"> 
  <img src="src/images/Snowflake_users_roles.PNG" alt="arch" width="720px" height="576px">
</p>




### TRANSFORM (Arthur)

- dbt
- 

### FUTURE WORK (All)

- Custom API Connection ... details
- Orchestration ... details
- Cloud ... details

