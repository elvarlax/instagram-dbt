{{ config(materialized='view') }}

select
  d.date_day,
  sum(pe.likes)                          as likes,
  sum(pe.comments)                       as comments,
  sum(pe.likes + pe.comments)            as engagement
from {{ ref('fct_post_engagement_daily') }} pe
join {{ ref('dim_date') }} d on d.date_id = pe.date_id
group by d.date_day
order by d.date_day