select *
from {{ ref('entaj_production_alloy') }}
where "source_state_id"=1