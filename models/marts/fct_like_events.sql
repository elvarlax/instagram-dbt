select
  l.like_id,                         -- event key
  l.user_id  as liker_user_id,       -- who liked
  l.post_id,
  d.date_id
from {{ ref('stg_likes') }} l
join {{ ref('dim_date') }} d on d.date_day = cast(date_trunc('day', l.created_at) as date)