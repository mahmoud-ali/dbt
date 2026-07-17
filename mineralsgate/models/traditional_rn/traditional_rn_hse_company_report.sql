select *
from {{ ref('hse_company_report') }}
where "source_state_id"=1