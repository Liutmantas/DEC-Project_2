select 
    *
from {{ source('airbyte_schema', 'raw_data')}}
limit 9