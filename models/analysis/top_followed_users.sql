select
  u.user_id,
  u.name,
  count(*) as followers_count
from {{ ref('fct_follow_events') }} f
join {{ ref('dim_user') }} u on u.user_id = f.followee_user_id
group by u.user_id, u.name
order by followers_count desc, u.user_id