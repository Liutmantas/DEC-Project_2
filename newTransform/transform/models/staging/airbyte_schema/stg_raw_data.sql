select 
    round(low,2) as low, 
    round(high,2) as high,
    round(open,2) as open,
    round(close,2) as close, 
    volume, 
    timestamp::date as date, 
    _airbyte_emitted_at,
    _airbyte_ab_id,
    ticker
from {{ source('airbyte_schema', 'raw_data')}}
join {{ ref('picklist')}}
order by timestamp asc