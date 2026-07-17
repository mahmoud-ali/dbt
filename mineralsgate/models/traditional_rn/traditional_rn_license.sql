select *
from {{ ref('license') }}
where "public"."company_profile_tblcompanyproductionlicense"."state_id"=1