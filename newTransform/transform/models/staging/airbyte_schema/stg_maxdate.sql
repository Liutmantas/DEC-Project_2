select
    max(date) as maxdate
from {{ ref('stg_raw_data')}}