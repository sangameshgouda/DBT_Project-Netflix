{{
    config(
            materialized = 'incremental',
            on_schema_change = 'fail'
        )
}}

WITH src_ratings AS (
    SELECT *
    FROM {{ ref('src_ratings') }}
)
SELECT 
    user_id,
    movie_id,
    ratings,
    rating_timestamp
FROM src_ratings
Where ratings is not null

{% if is_incremental() %}
    AND  rating_timestamp > (SELECT max(rating_timestamp) FROM {{ this }})
{% endif %}

--  here this means fct rating table ,src_ratings means staging table and fct_ratings means fact table 