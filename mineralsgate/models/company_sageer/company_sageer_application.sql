select * 
from {{ ref('company_application')}} as "company_application"
where "company_application"."company_type_id" = 'sageer'
