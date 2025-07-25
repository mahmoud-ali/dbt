SELECT
  "public"."traditional_app_dailyreport"."id" AS "report_id",
  "public"."traditional_app_dailyreport"."date" AS "date",
  "company_profile_lkpstate__via__source_state_id"."name" AS "source_state_name",
  "daily_report_state"."name" AS "state"
FROM
  "public"."traditional_app_dailyreport"

LEFT JOIN 
    "public"."company_profile_lkpstate" AS "company_profile_lkpstate__via__source_state_id" ON "public"."traditional_app_dailyreport"."source_state_id" = "company_profile_lkpstate__via__source_state_id"."id"
LEFT JOIN 
    {{ ref('traditional_daily_report_state')}} as "daily_report_state" ON "public"."traditional_app_dailyreport"."state" = "daily_report_state"."id"