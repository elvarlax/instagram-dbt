select
  p.post_id,
  u.name as author,
  count(distinct l.liker_user_id)     as total_likes,
  count(distinct c.commenter_user_id) as total_comments,
  count(distinct l.liker_user_id) + count(distinct c.commenter_user_id) as engagement
from {{ ref('dim_post') }} p
join {{ ref('dim_user') }} u on p.user_id = u.user_id
left join {{ ref('fct_like_events') }}    l on p.post_id = l.post_id
left join {{ ref('fct_comment_events') }} c on p.post_id = c.post_id
group by p.post_id, u.name
order by engagement desc, p.post_id