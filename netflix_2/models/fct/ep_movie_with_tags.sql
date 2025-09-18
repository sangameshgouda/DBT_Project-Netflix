WITH fct_movies_w_tags as (
    SELECT * FROM {{ ref('dim_movies_with_tags') }}
)

SELECT *
FROM fct_movies_w_tags

--  here we used the ephemeral table which is dim_movies_with_tags to create a view ep_movie_with_tags which will have all the columns of dim_movies_with_tags