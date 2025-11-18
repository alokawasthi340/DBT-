with src_listings as (
    select * from {{ ref('src_listings') }}
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