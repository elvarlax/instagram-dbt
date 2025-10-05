with src as (
  select * from {{ source('seed', 'likes') }}
)
select
  cast(src.like_id as bigint)       as like_id,
  cast(src.post_id as bigint)       as post_id,
  cast(src.user_id as bigint)       as user_id,
  cast(src.created_at as timestamp) as created_at
from src