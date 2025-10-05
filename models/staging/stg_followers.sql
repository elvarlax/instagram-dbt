with src as (
  select * from {{ source('seed', 'followers') }}
)
select
  cast(src.follower_id as bigint)        as follower_event_id,
  cast(src.user_id as bigint)            as user_id,          -- the followee
  cast(src.follower_user_id as bigint)   as follower_user_id, -- the follower
  cast(src.created_at as timestamp)      as created_at
from src