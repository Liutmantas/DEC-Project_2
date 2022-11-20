select
    range,
    newrangemacro
from {{ ref('stg_range')}}
where range <> newrangemacro