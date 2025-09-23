SELECT
  "public"."gold_travel_appmovegold"."id" AS "id",
  "public"."gold_travel_appmovegold"."date" AS "date",
  "public"."gold_travel_appmovegold"."code" AS "code",
  "gold_travel_lkpowner__via__owner_name_lst_id"."name" AS "owner_name",
  "gold_export_state"."name" AS "state",
  "gold_export_state"."id" AS "state_id",
  SUM(
    "Gold Travel Appmovegolddetails"."alloy_weight_in_gram"
  ) AS "sum",
  count(distinct "Gold Travel Appmovegolddetails"."id") AS "alloy_count",
  CONCAT('https://mineralsgate.com/app/managers/gold_travel/appmovegoldreexportgold/',"public"."gold_travel_appmovegold"."id",'/change/') as "link"
FROM
  "public"."gold_travel_appmovegold"
 
LEFT JOIN 
    "public"."gold_travel_appmovegolddetails" AS "Gold Travel Appmovegolddetails" ON "public"."gold_travel_appmovegold"."id" = "Gold Travel Appmovegolddetails"."master_id"
LEFT JOIN 
    "public"."gold_travel_lkpowner" AS "gold_travel_lkpowner__via__owner_name_lst_id" ON "public"."gold_travel_appmovegold"."owner_name_lst_id" = "gold_travel_lkpowner__via__owner_name_lst_id"."id"
LEFT JOIN 
    {{ ref('export_gold_export_state')}} AS "gold_export_state" ON "public"."gold_travel_appmovegold"."state" = "gold_export_state"."id"
WHERE
  "public"."gold_travel_appmovegold"."form_type" = 2
  AND "public"."gold_travel_appmovegold"."source_state_id" = 1 
  AND "gold_export_state"."id" <> 1

GROUP BY 1,2,3,4,5,6
ORDER BY 2 DESC
