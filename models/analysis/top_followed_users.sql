{{ config(materialized='view') }}

select
  u.user_id,
  u.name,
  count(f.follower_user_id) as followers_count
from {{ ref('dim_user') }} u
left join {{ ref('fct_follow_events') }} f on f.followee_user_id = u.user_id
group by u.user_id, u.name
order by followers_count desc, u.name