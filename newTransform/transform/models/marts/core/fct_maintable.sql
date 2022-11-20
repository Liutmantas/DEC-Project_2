{{
    config(
        materialized='table',
        database='airbyte_database',
        schema='airbyte_schema'
    )
}}

select
    low,
    high,
    open,
    exp.close,
    volume,
    exp.date,
    _airbyte_emitted_at,
    _airbyte_ab_id,
    exp.ticker,
    year,
    month,
    day,
    quarter,
    weekday_name,
    avg30,
    max30,
    min30,
    range,
    trail90,
    trend_comment
from {{ ref('stg_expanded_date') }} exp
left join {{ ref('stg_agg_window_percent')}} agg
    on exp.ticker = agg.ticker
left join {{ ref('stg_range') }} rng
    on exp.date = rng.date and rng.ticker = exp.ticker
left join {{ ref('stg_trailingavg') }} trl
    on exp.date = trl.date and exp.ticker = trl.ticker