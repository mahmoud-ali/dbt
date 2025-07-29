select * 
from {{ ref('company')}} as "company"
where "company"."company_type_id" = 'entaj' or "company"."company_type_id" = 'mokhalfat'
