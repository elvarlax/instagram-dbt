select
  u.user_id,
  u.name,
  count(distinct p.post_id) as posts_count
from {{ ref('dim_user') }} u
left join {{ ref('dim_post') }} p on p.user_id = u.user_id
group by u.user_id, u.name
order by posts_count desc, u.user_id