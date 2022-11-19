{{
    config(
        materialized='table',
        database='airbyte_database',
        schema='airbyte_schema'
    )

}}

select 
    * 
from {{ ref('newscript2')}}
limit 15