select
    date,
    ticker,
    close,
    ROUND(AVG(close::numeric) OVER (ORDER BY date ROWS BETWEEN 89 PRECEDING AND CURRENT ROW),2) AS trail90,
    case
        when (close - ROUND(AVG(close::numeric) OVER (ORDER BY date ROWS BETWEEN 89 PRECEDING AND CURRENT ROW),2)) > 0 then 'up'
        else 'down'
    end as trend_comment
from {{ ref('stg_raw_data')}}