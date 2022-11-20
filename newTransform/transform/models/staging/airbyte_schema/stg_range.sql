select
    date,
    ticker,
    high - low as range,
    {{ range_highlow('high', 'low')}} as newrangemacro
from {{ ref('stg_raw_data')}}