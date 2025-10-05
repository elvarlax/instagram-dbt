select
  post_id,
  user_id,
  caption,
  created_at
from {{ ref('stg_posts') }}