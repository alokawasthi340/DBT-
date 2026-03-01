
  create or replace   view AIRBNB.DEV.dim_hosts_cleansed
  
  
  
  
  as (
    

with  __dbt__cte__src_hosts as (
with raw_hosts as (
select * from AIRBNB.RAW.raw_hosts
)
select
ID as host_id
,NAME as host_name
,IS_SUPERHOST
,CREATED_AT
,UPDATED_AT
from raw_hosts
), src_hosts as (
    select * from __dbt__cte__src_hosts
)
SELECT
HOST_ID,
NVL(host_name,'Unknown') AS HOST_NAME,
	IS_SUPERHOST,
	CREATED_AT,
	UPDATED_AT
from src_hosts
  );

