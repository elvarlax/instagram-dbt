select
  u.user_id,
  u.name,
  sum(pe.likes + pe.comments) as total_engagement,
  count(distinct pe.post_id)  as posts_touched
from {{ ref('fct_post_engagement_daily') }} pe
join {{ ref('dim_post') }} p on p.post_id = pe.post_id
join {{ ref('dim_user') }} u on u.user_id = p.user_id
group by u.user_id, u.name
order by total_engagement desc, u.name