select
    date,
    ticker,
    high - low as range
from {{ ref('stg_raw_data')}}