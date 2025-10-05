with src as (
  select * from {{ source('seed', 'comments') }}
)
select
  cast(src.comment_id as bigint)    as comment_id,
  cast(src.post_id as bigint)       as post_id,
  cast(src.user_id as bigint)       as user_id,
  src.comment_text,
  cast(src.created_at as timestamp) as created_at
from src