{{ config(materialized='table') }}

with covid_data as (
    select * from {{ ref('stg_staging__covid_data_all') }}
)
    select distinct
        geoid,
        iso_code,
        continent,
        location
    from covid_data
