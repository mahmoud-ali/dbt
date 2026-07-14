SELECT *

FROM {{ ref('gold_travel_traditional_buy')}}

WHERE source_state_id = 1