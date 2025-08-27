select * 
from {{ ref('company')}} as "company"
where "company"."company_type_id" = 'sageer'
