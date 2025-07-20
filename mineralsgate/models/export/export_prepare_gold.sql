SELECT
  "public"."gold_travel_apppreparegold"."id" AS "id",
  "public"."gold_travel_apppreparegold"."date" AS "date",
  "company_profile_lkpstate - source_state_id"."name" AS "source_state_name",
  "public"."gold_travel_apppreparegold"."owner_name" AS "owner_name",
  "public"."gold_travel_apppreparegold"."gold_weight_in_gram" AS "gold_weight_in_gram",
  "prepare_state"."name" AS "state"
FROM
  "public"."gold_travel_apppreparegold"
 
LEFT JOIN 
    "public"."company_profile_lkpstate" AS "company_profile_lkpstate - source_state_id" ON "public"."gold_travel_apppreparegold"."source_state_id" = "company_profile_lkpstate - source_state_id"."id"
LEFT JOIN
    {{ ref('export_prepare_state')}} AS "prepare_state" ON "public"."gold_travel_apppreparegold"."state" = "prepare_state"."id"