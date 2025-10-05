{{ config(materialized='view') }}

select
  p.post_id,
  u.name  as author,
  p.caption,
  sum(pe.likes)                      as likes,
  sum(pe.comments)                   as comments,
  sum(pe.likes + pe.comments)        as engagement
from {{ ref('fct_post_engagement_daily') }} pe
join {{ ref('dim_post') }} p on p.post_id = pe.post_id
join {{ ref('dim_user') }} u on u.user_id = p.user_id
group by p.post_id, u.name, p.caption
order by engagement desc, p.post_id