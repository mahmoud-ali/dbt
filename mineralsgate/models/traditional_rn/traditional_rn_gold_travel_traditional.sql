SELECT *

FROM {{ ref('gold_travel_traditional')}}

WHERE source_state_id = 1