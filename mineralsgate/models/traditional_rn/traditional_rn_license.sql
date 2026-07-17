select *
from {{ ref('license') }}
where "source_state_id"=1