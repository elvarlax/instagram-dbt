{{ config(materialized='view') }}

select
  user_id,
  name,
  email,
  phone_number
from {{ ref('stg_users') }}