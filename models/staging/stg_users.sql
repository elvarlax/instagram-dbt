with src as (
  select * from {{ source('seed', 'users') }}
)
select
  cast(src.user_id as bigint)       as user_id,
  cast(src.name as varchar)         as name,
  cast(src.email as varchar)        as email,
  cast(src.phone_number as varchar) as phone_number
from src