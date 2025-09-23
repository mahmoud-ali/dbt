SELECT
  "public"."hse_traditional_hsetraditionalaccident"."id" AS "accident_id",
  "hse_traditional_accident_type"."name" AS "type",
  "hse_traditional_report_state"."name" AS "state",
  "public"."hse_traditional_hsetraditionalaccident"."what" AS "what",
  "public"."hse_traditional_hsetraditionalaccident"."when" AS "when",
  "public"."hse_traditional_hsetraditionalaccident"."where" AS "where",
  "lkpstate"."name" AS "source_state",
  "lkpstate"."id" AS "source_state_id"
FROM
  "public"."hse_traditional_hsetraditionalaccident"

LEFT JOIN "public"."company_profile_lkpstate" AS "lkpstate" ON "public"."hse_traditional_hsetraditionalaccident"."source_state_id" = "lkpstate"."id"
LEFT JOIN {{ ref('hse_traditional_report_state')}} as "hse_traditional_report_state" ON "hse_traditional_report_state"."id" = "public"."hse_traditional_hsetraditionalaccident"."state"
LEFT JOIN {{ ref('hse_traditional_accident_type')}} as "hse_traditional_accident_type" ON "hse_traditional_accident_type"."id" = "public"."hse_traditional_hsetraditionalaccident"."type"