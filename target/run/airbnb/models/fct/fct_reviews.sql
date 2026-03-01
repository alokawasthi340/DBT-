-- back compat for old kwarg name
  
  begin;
    
        
            
	    
	    
            
        
    

    

    merge into AIRBNB.DEV.fct_reviews as DBT_INTERNAL_DEST
        using AIRBNB.DEV.fct_reviews__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.listing_id = DBT_INTERNAL_DEST.listing_id))

    
    when matched then update set
        "LISTING_ID" = DBT_INTERNAL_SOURCE."LISTING_ID","REVIEW_DATE" = DBT_INTERNAL_SOURCE."REVIEW_DATE","REVIEWER_NAME" = DBT_INTERNAL_SOURCE."REVIEWER_NAME","REVIEW_TEXT" = DBT_INTERNAL_SOURCE."REVIEW_TEXT","REVIEW_SENTIMENT" = DBT_INTERNAL_SOURCE."REVIEW_SENTIMENT"
    

    when not matched then insert
        ("LISTING_ID", "REVIEW_DATE", "REVIEWER_NAME", "REVIEW_TEXT", "REVIEW_SENTIMENT")
    values
        ("LISTING_ID", "REVIEW_DATE", "REVIEWER_NAME", "REVIEW_TEXT", "REVIEW_SENTIMENT")

;
    commit;