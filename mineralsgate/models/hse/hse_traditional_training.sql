SELECT
  "trainingawareness"."id" AS "training_awareness_id",
  "trainingawareness"."subject" AS "training_awareness_subject",
  "trainingawareness"."attendees" AS "training_awareness_attendees",
  "trainingawareness"."notes" AS "training_awareness_notes",
  "trainingawareness"."market_name" AS "training_awareness_market_name",
  "training_type"."name" AS "training_awareness_type",
  "report"."report_id" as "report_id",
  "report"."year" as "report_year",
  "report"."month" as "report_month",
  "report"."state" as "report_state",
  "report"."source_state" as "report_source_state",
  CONCAT('https://mineralsgate.com/app/managers/hse_traditional/hsetraditionalreport/',"report"."report_id",'/change/') as "link"
FROM
  "public"."hse_traditional_trainingawareness" AS "trainingawareness"
INNER JOIN
  {{ ref('hse_traditional_report')}} as "report" ON "trainingawareness"."report_id" = "report"."report_id"
LEFT JOIN
  {{ ref('hse_traditional_training_type')}} as "training_type" ON "training_type"."id" = "trainingawareness"."traning_type"