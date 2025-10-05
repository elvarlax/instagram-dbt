with likes as (
  select
    post_id,
    cast(date_trunc('day', created_at) as date) as date_day,
    count(*) as likes
  from {{ ref('stg_likes') }}
  group by 1,2
),
comments as (
  select
    post_id,
    cast(date_trunc('day', created_at) as date) as date_day,
    count(*) as comments
  from {{ ref('stg_comments') }}
  group by 1,2
)
select
  coalesce(l.post_id, c.post_id)   as post_id,
  coalesce(l.date_day, c.date_day) as date_day,
  coalesce(l.likes, 0)             as likes,
  coalesce(c.comments, 0)          as comments
from likes l
full outer join comments c on l.post_id = c.post_id and l.date_day = c.date_day