select * 
from {{ ref('license')}} as "license"
where "license"."company_type_id" = 'entaj' or "license"."company_type_id" = 'mokhalfat'
