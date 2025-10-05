{{ config(materialized='view') }}

with bounds as (
  select
    min(d) as min_d,
    max(d) as max_d
  from (
    select date_trunc('day', created_at) as d from {{ ref('stg_posts') }}
    union all select date_trunc('day', created_at) from {{ ref('stg_comments') }}
    union all select date_trunc('day', created_at) from {{ ref('stg_likes') }}
    union all select date_trunc('day', created_at) from {{ ref('stg_followers') }}
  )
),
days as (
  select (min_d + (i || ' days')::interval)::date as date_day
  from bounds, range(date_diff('day', min_d, max_d) + 1) t(i)
)
select
  cast(strftime(date_day, '%Y%m%d') as int) as date_id,
  date_day
from days