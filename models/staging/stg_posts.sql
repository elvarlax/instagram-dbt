with src as (
  select * from {{ source('seed', 'posts') }}
)
select
  cast(src.post_id as bigint)       as post_id,
  cast(src.user_id as bigint)       as user_id,
  src.caption,
  src.image_url,
  cast(src.created_at as timestamp) as created_at
from src