SELECT
  "environmental_inspection"."id" AS "environmental_inspection_id",
  "environmental_inspection"."market_name" AS "market_name",
  "environmental_inspection"."what" AS "what",
  "environmental_inspection"."who" AS "who",
  "environmental_inspection"."hazard_identified" AS "hazard_identified",
  "environmental_inspection"."closed_date" AS "closed_date",
  "report"."report_id" as "report_id",
  "report"."year" as "report_year",
  "report"."month" as "report_month",
  "report"."report_date" as "report_date",
  "report"."state" as "report_state",
  "report"."source_state" as "report_source_state",
  CONCAT('https://mineralsgate.com/app/managers/hse_traditional/hsetraditionalreport/',"report"."report_id",'/change/') as "link"
FROM
  "public"."hse_traditional_environmentalinspection" AS "environmental_inspection"
INNER JOIN
  {{ ref('hse_traditional_report')}} as "report" ON "environmental_inspection"."report_id" = "report"."report_id"
