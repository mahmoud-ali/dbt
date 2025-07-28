select id,date,code,source_state,owner_name,sum,alloy_count 
from {{ ref('export_gold_export')}} as "export_gold_export"
where "export_gold_export"."state_id" = 2