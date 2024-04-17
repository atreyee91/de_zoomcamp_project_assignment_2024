{{ config(materialized='table') }}

with covid_data as (
    select * from {{ ref('stg_staging__covid_data_all') }}
),
geo_loc as (
    select * from {{ ref('dim_geo') }}
)
    select 
        geo_loc.continent as continent,
        geo_loc.location as location,
        extract(YEAR from datetime) || 
            CASE 
            WHEN EXTRACT(MONTH FROM datetime) < 10 THEN '0' || CAST(EXTRACT(MONTH FROM datetime) AS STRING) 
            ELSE CAST(EXTRACT(MONTH FROM datetime) AS STRING) 
            END AS mon_year,
        coalesce(avg(population_density)) as population_density,
        coalesce(avg(median_age)) as median_age,
        coalesce(sum(male_smokers),0) as total_male_smokers,
        coalesce(sum(female_smokers),0) as total_female_smokers,
        coalesce(sum(new_cases),0) as total_new_cases,
        coalesce(sum(total_cases),0) as total_cases,
        coalesce(sum(new_deaths),0) as total_new_deaths,
        coalesce(sum(total_deaths),0) as total_deaths,
        coalesce(sum(icu_patients),0) as total_icu_patients,
        coalesce(sum(hosp_patients),0) as total_hosp_patients,
        coalesce(sum(weekly_hosp_admissions),0) as total_weekly_hosp_admissions,
        coalesce(sum(weekly_icu_admissions),0) as total_weekly_icu_admissions,
        coalesce(sum(new_tests),0) as total_new_tests,
        coalesce(sum(total_tests),0) as total_tests,
        coalesce(sum(new_vaccinations),0) as total_new_vaccinations,
        coalesce(sum(total_vaccinations),0) as total_vaccinations,
        coalesce(sum(people_fully_vaccinated),0) as people_fully_vaccinated,
        coalesce(sum(people_vaccinated),0) as people_vaccinated,
        coalesce(sum(total_boosters),0) as total_boosters,
        coalesce(avg(stringency_index)) as stringency_index
    from covid_data
    inner join geo_loc
    on covid_data.geoid = geo_loc.geoid
    group by 1,2,3
