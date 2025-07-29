select * 
from {{ ref('entaj_production_alloy')}} as "entaj_production_alloy"
where "entaj_production_alloy"."company_type_id" = 'entaj'
