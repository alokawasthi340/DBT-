with src_hosts as (
    select * from AIRBNB.DEV.src_hosts
)
SELECT
HOST_ID,
NVL(host_name,'Unknown') AS HOST_NAME,
	IS_SUPERHOST,
	CREATED_AT,
	UPDATED_AT
from src_hosts