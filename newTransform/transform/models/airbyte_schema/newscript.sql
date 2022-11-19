{{
    config(
        materialized='table',
        database='airbyte_database',
        schema='airbyte_schema'
    )

}}

select 
    * 
from airbyte_database.public.raw_data 
limit 10