select
  d.date_day,
  count(distinct l.liker_user_id)     as active_likers,
  count(distinct c.commenter_user_id) as active_commenters
from {{ ref('dim_date') }} d
left join {{ ref('fct_like_events') }}    l on d.date_id = l.date_id
left join {{ ref('fct_comment_events') }} c on d.date_id = c.date_id
group by d.date_day
order by d.date_day