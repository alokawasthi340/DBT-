with  __dbt__cte__src_listings as (
with raw_listings as (
select * from airbnb.raw.raw_listings
)
select
ID as LISTING_ID
,NAME as LISTING_NAME
,LISTING_URL
,ROOM_TYPE
,MINIMUM_NIGHTS
,HOST_ID
,REPLACE(price, '$', '') AS price
,CREATED_AT
,UPDATED_AT
from raw_listings
), src_listings as (
    select * from __dbt__cte__src_listings
)
select
    LISTING_ID,
    LISTING_NAME,
    LISTING_URL,
    ROOM_TYPE,
    case
    when MINIMUM_NIGHTS=0 then 1
    else MINIMUM_NIGHTS
    end as MINIMUM_NIGHTS,
    HOST_ID,
    price::number(10,2) AS price,
    CREATED_AT,
    UPDATED_AT
    from src_listings