select
    ticker,
    low,
    high,
    open,
    close,
    volume,
    a.date as date,
    _airbyte_emitted_at,
    _airbyte_ab_id,
    ticker,
    year, 
    month,
    day,
    quarter,
    weekday_name
from {{ ref('stg_raw_data') }} a
left join {{ ref('stg_calendar') }} b
on a.date = b.date