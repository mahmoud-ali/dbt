select * 
from {{ ref('license')}} as "license"
where "license"."company_type_id" = 'sageer' 
