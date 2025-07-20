SELECT
  "public"."hse_traditional_hsetraditionalreport"."id" AS "report_id",
  "public"."hse_traditional_hsetraditionalreport"."year" AS "year",
  "public"."hse_traditional_hsetraditionalreport"."month" AS "month",
  "hse_traditional_report_state"."name" AS "state",
  "lkpstate"."name" AS "source_state"
FROM
  "public"."hse_traditional_hsetraditionalreport"

LEFT JOIN "public"."company_profile_lkpstate" AS "lkpstate" ON "public"."hse_traditional_hsetraditionalreport"."source_state_id" = "lkpstate"."id"
LEFT JOIN {{ ref('hse_traditional_report_state')}} as "hse_traditional_report_state" ON "hse_traditional_report_state"."id" = "public"."hse_traditional_hsetraditionalreport"."state"
