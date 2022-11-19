{{
    config(
        materialized='table',
        database='airbyte_database',
        schema='airbyte_schema'
    )

}}

select 
    * 
from {{ source('airbyte_schema', 'raw_data')}}
limit 25