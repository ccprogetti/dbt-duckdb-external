
-- Use the `ref` function to select from other models

{{ config(materialized='external', location='~/my_second_dbt_model.parquet') }}

select *
from {{ ref('my_first_dbt_model') }}
--where id = 1
