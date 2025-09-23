SELECT
  "arrangementofmarkets"."id" AS "market_id",
  "arrangementofmarkets"."market_name" AS "market_name",
  "arrangementofmarkets"."notes" AS "notes",
  "arrangementofmarkets"."percent" AS "percent",
  "report"."report_id" as "report_id",
  "report"."year" as "report_year",
  "report"."month" as "report_month",
  "report"."report_date" as "report_date",
  "report"."state" as "report_state",
  "report"."source_state" as "report_source_state",
  CONCAT('https://mineralsgate.com/app/managers/hse_traditional/hsetraditionalreport/',"report"."report_id",'/change/') as "link",
  "report"."source_state_id"
FROM
  "public"."hse_traditional_arrangementofmarkets" AS "arrangementofmarkets"
INNER JOIN
  {{ ref('hse_traditional_report')}} as "report" ON "arrangementofmarkets"."report_id" = "report"."report_id"
