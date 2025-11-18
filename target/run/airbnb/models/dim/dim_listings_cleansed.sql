
  create or replace   view AIRBNB.DEV.dim_listings_cleansed
  
  
  
  
  as (
    with src_listings as (
    select * from AIRBNB.DEV.src_listings
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
  );

