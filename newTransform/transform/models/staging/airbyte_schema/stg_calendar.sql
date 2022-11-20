
with spine as (
    {{ dbt_utils.date_spine(
        datepart="days",
        start_date="cast('1980-01-01' as date)",
        end_date="cast('2100-01-01' as date)"
    )
    }}
)
select
    date_days as date,
    date_part(year, date_days) as year,
    date_part(month, date_days) as month,
    date_part(day, date_days) as day,
    date_part(quarter,date_days) as quarter,
    dayname(date_days) as weekday_name
from spine
