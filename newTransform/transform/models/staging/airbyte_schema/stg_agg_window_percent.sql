select
    ticker,
    round(AVG(close),2) as avg30,
    round(MIN(close),2) as max30,
    round(MAX(close),2) as min30

    --close - lag(close)
    -- percent chagne and case when for labels
    -- window functions
    -- max over
    -- min over,
    -- agg and group by
    -- then join with stge ate expaneded and send to mart
    -- actuallly make 3 files agg wf and case with percent then join all with exapnced and dump as mart
from {{ ref('stg_raw_data') }}
join {{ ref('stg_maxdate')}}
where date > maxdate - interval '30 days'
group by 1