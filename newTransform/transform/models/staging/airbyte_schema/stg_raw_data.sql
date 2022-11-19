select 
    round(low,2) as low, 
    round(high,2) as high,
    round(open,2) as open,
    round(close,2) as close, 
    volume, 
    timestamp::date as timestamp_date, 
    _airbyte_emitted_at,
    _airbyte_ab_id
from {{ source('airbyte_schema', 'raw_data')}}
order by timestamp asc