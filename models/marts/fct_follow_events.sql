{{ config(materialized='view') }}

select
  f.followee_user_id,
  f.follower_user_id,
  d.date_id
from {{ ref('int_followers_current') }} f
join {{ ref('dim_date') }} d on d.date_day = cast(f.edge_created_at as date)