SELECT
    "public"."dabtiaat_altaedin_appdabtiaat"."id" AS "id",
    "public"."dabtiaat_altaedin_appdabtiaat"."date" AS "date",
    "public"."dabtiaat_altaedin_appdabtiaat"."report_number" AS "report_number",
    ROUND(CAST(("dabtiaat_altaedin_appdabtiaatdetails"."gold_weight_in_gram" * "dabtiaat_altaedin_appdabtiaatdetails"."gold_price" * 0.22) AS NUMERIC),2) AS "total_amount",
    "dabtiaat_altaedin_appdabtiaatdetails"."gold_weight_in_gram" AS "dabtiaat_weight_in_gram",
    "dabtiaat_altaedin_appdabtiaatdetails"."gold_price" AS "dabtiaat_gold_price",
    -- "public"."dabtiaat_altaedin_appdabtiaat"."source_state_id",
	  "dabtiaat_state"."name" AS "state",
    CONCAT('https://mineralsgate.com/app/managers/dabtiaat_altaedin/appdabtiaat/',"public"."dabtiaat_altaedin_appdabtiaat"."id",'/change/') as "link"

FROM
    "public"."dabtiaat_altaedin_appdabtiaat"    
LEFT JOIN 
    "public"."dabtiaat_altaedin_appdabtiaatdetails" AS "dabtiaat_altaedin_appdabtiaatdetails" ON "public"."dabtiaat_altaedin_appdabtiaat"."id" = "dabtiaat_altaedin_appdabtiaatdetails"."app_dabtiaat_id"
LEFT JOIN 
    {{ ref('export_dabtiaat_state')}} AS "dabtiaat_state" ON "public"."dabtiaat_altaedin_appdabtiaat"."state" = "dabtiaat_state"."id"

WHERE "public"."dabtiaat_altaedin_appdabtiaat"."source_state_id" = 10 AND "dabtiaat_state"."id" <> 1
