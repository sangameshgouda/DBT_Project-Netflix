WITH src_tags as (
    SELECT * FROM {{ ref('src_genome_tags') }}

)

SELECT
    tag_id,
    INITCAP(TRIM(tag)) AS tag_name
FROM
    src_tags