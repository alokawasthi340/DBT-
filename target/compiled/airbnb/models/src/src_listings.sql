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