{{ config(materialized='view') }}

select
  c.comment_id,                      -- event key
  c.user_id  as commenter_user_id,   -- who commented
  c.post_id,
  d.date_id
from {{ ref('stg_comments') }} c
join {{ ref('dim_date') }} d on d.date_day = cast(date_trunc('day', c.created_at) as date)