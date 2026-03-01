-- ...existing code...
WITH
  l AS (SELECT * FROM {{ ref('dim_listings_cleansed') }}),
  h AS (SELECT * FROM {{ ref('dim_hosts_cleansed') }})
SELECT
  l.listing_id,
  l.LISTING_NAME,
  l.ROOM_TYPE,
  l.MINIMUM_NIGHTS,
  l.price,
  l.host_id,
  h.host_name,
  h.IS_SUPERHOST AS host_is_superhost,
  l.CREATED_AT,
  GREATEST(l.UPDATED_AT, h.UPDATED_AT) AS updated_at
FROM l
JOIN h ON l.host_id = h.host_id
