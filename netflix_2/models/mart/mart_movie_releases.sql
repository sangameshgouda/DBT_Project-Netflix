{{
    config(
        materialized='table'
    )
}}

WITH  fct_ratings as (
    SELECT * FROM {{ ref('fct_ratings') }}
),
seed_dates as (
    SELECT * FROM MOVIELENS.DEV.SEED_MOVIE_RELEASE_DATES
)
SELECT 
    f.*,
    CASE 
        WHEN d.release_date IS  NULL THEN 'unkbown'
        ELSE 'known'
    end as release_info_availabile
FROM fct_ratings as f
LEFT JOIN seed_dates as d
ON f.movie_id = d.movie_id

