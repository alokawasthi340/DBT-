{{
    config(
        materialized='incremental',
        on_schema_change='fail',
        unique_key='listing_id')
}}
with src_reviews as (
    select * from {{ ref('src_reviews') }}
)
select
    LISTING_ID,
    REVIEW_DATE,
    REVIEWER_NAME,
    REVIEW_TEXT,
    REVIEW_SENTIMENT
    from src_reviews
    {% if is_incremental() %}
    where REVIEW_DATE > (select max(REVIEW_DATE) from {{ this }})
    {% endif %}

-- incremental load 