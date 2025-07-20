SELECT
  "dailyreport"."date" AS "report_date",
  "dailyreport"."source_state_name" AS "report_source_state_name",
  "dailyreport"."state" AS "report_state",
  "traditional_app_lkpsoag__via__soag_id__via__traditi_c895ecce"."name" AS "soag_name",
  "traditional_app_dailytahsilform"."form_count" AS "form_count",
  "traditional_app_dailytahsilform"."gold_in_gram" AS "gold_in_gram"
FROM
  {{ ref('traditional_daily_report')}} as "dailyreport"

LEFT JOIN 
    "public"."traditional_app_dailytahsilform" AS "traditional_app_dailytahsilform" ON "dailyreport"."report_id" = "traditional_app_dailytahsilform"."daily_report_id"
LEFT JOIN 
    "public"."traditional_app_lkpsoag" AS "traditional_app_lkpsoag__via__soag_id__via__traditi_c895ecce" ON "traditional_app_dailytahsilform"."soag_id" = "traditional_app_lkpsoag__via__soag_id__via__traditi_c895ecce"."id"
