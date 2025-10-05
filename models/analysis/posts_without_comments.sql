select p.post_id, p.caption, p.user_id
from {{ ref('dim_post') }} p
left join {{ ref('fct_comment_events') }} c on p.post_id = c.post_id
where c.post_id is null