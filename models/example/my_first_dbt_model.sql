
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

--{{ config(materialized='table') }}

{{ config(materialized='external', location='~/my_first_dbt_model.csv', format='csv') }}

with source_data as (

    select 	'Duck' || 'DB' as name, a._index as id from read_parquet('./cemex-duckdb.parquet') a inner join read_parquet('./cemex-duckdb.parquet') b
    on a._index = b._index limit 10

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
