
with  __dbt__cte__src_reviews as (
with RAW_REVIEWS as (
select * from AIRBNB.RAW.RAW_REVIEWS
)
select
LISTING_ID
,DATE as REVIEW_DATE
,REVIEWER_NAME
,COMMENTS as REVIEW_TEXT
,SENTIMENT as REVIEW_SENTIMENT
from RAW_REVIEWS
), src_reviews as (
    select * from __dbt__cte__src_reviews
)
select
    LISTING_ID,
    REVIEW_DATE,
    REVIEWER_NAME,
    REVIEW_TEXT,
    REVIEW_SENTIMENT
    from src_reviews
    
    where REVIEW_DATE > (select max(REVIEW_DATE) from AIRBNB.DEV.fct_reviews)
    

-- incremental load