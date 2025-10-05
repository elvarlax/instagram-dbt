{{ config(materialized='view') }}

select
  i.post_id,
  d.date_id,
  i.likes,
  i.comments
from {{ ref('int_post_engagement_daily') }} i
join {{ ref('dim_date') }} d on d.date_day = i.date_day