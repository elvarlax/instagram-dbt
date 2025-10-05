with ranked as (
  select
    user_id              as followee_user_id,
    follower_user_id,
    created_at,
    row_number() over (
      partition by user_id, follower_user_id
      order by created_at desc nulls last
    ) as rn
  from {{ ref('stg_followers') }}
)
select
  followee_user_id,
  follower_user_id,
  created_at as edge_created_at
from ranked
where rn = 1