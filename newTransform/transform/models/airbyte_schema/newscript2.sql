{{
    config(
        materialized='table',
        database='airbyte_database',
        schema='airbyte_schema'
    )

}}

select 
    * 
from {{ source('airbyte', 'raw_data')}}
limit 25