SELECT
  "dailyreport"."date" AS "report_date",
  "dailyreport"."source_state_name" AS "report_source_state_name",
  "dailyreport"."state" AS "report_state",
  "traditional_app_lkpsoag__via__soag_id__via__traditi_c895ecce"."name" AS "soag_name",
  "hajr_type"."name" AS "hajr_type",
  "traditional_app_dailyincome"."amount" AS "amount",
  CONCAT('https://mineralsgate.com/app/managers/traditional_app/dailyreport/',"dailyreport"."report_id",'/change/') as "link"
FROM
  {{ ref('traditional_daily_report')}} as "dailyreport"

LEFT JOIN 
    "public"."traditional_app_dailyincome" AS "traditional_app_dailyincome" ON "dailyreport"."report_id" = "traditional_app_dailyincome"."daily_report_id"
LEFT JOIN 
    "public"."traditional_app_lkpsoag" AS "traditional_app_lkpsoag__via__soag_id__via__traditi_c895ecce" ON "traditional_app_dailyincome"."soag_id" = "traditional_app_lkpsoag__via__soag_id__via__traditi_c895ecce"."id"
LEFT JOIN
    {{ ref('traditional_daily_report_hajr_type')}} AS "hajr_type" ON "traditional_app_dailyincome"."hajr_type" = "hajr_type"."id"
WHERE
  "traditional_app_dailyincome"."amount" > 0
  AND "dailyreport"."source_state_id" = 1
