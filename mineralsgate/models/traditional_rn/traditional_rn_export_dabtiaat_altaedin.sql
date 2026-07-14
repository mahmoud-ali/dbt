SELECT *

FROM
    {{ ref('export_dabtiaat_altaedin')}}

WHERE "source_state_id" = 1 
