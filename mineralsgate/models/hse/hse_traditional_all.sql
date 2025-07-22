SELECT
  "report"."report_id" as "id",
  "report"."year",
  "report"."month",
  "report"."report_date" AS "date",
  "report"."state",
  "report"."source_state",
  'التقرير الشهري' as "source",
  CONCAT('https://mineralsgate.com/app/managers/hse_traditional/hsetraditionalreport/',"report"."report_id",'/change/') as "link"
FROM
  {{ ref('hse_traditional_report')}} as "report"
UNION SELECT
  "accident"."accident_id" as "id",
  EXTRACT(YEAR FROM "accident"."when")::INT as "year",
  EXTRACT(MONTH FROM "accident"."when")::INT as "month",
  "accident"."when" AS "date",
  "accident"."state",
  "accident"."source_state",
  'حادث بيئي' as "source",
  CONCAT('https://mineralsgate.com/app/managers/hse_traditional/hsetraditionalaccident/',"accident"."accident_id",'/change/') as "link"
FROM
  {{ ref('hse_traditional_accident')}} as "accident"
WHERE
    "accident"."type" = 'بيئة'
UNION SELECT
  "accident"."accident_id" as "id",
  EXTRACT(YEAR FROM "accident"."when")::INT as "year",
  EXTRACT(MONTH FROM "accident"."when")::INT as "month",
  "accident"."when" AS "date",
  "accident"."state",
  "accident"."source_state",
  'حادث سلامة' as "source",
  CONCAT('https://mineralsgate.com/app/managers/hse_traditional/hsetraditionalaccident/',"accident"."accident_id",'/change/') as "link"
FROM
  {{ ref('hse_traditional_accident')}} as "accident"
WHERE
    "accident"."type" = 'سلامة'

UNION SELECT
  "corrective_accident"."corrective_action_id" as "id",
  EXTRACT(YEAR FROM "corrective_accident"."when")::INT as "year",
  EXTRACT(MONTH FROM "corrective_accident"."when")::INT as "month",
  "corrective_accident"."when" AS "date",
  "corrective_accident"."state",
  "corrective_accident"."source_state",
  'اجراء تصحيحي لحادث' as "source",
  CONCAT('https://mineralsgate.com/app/managers/hse_traditional/hsetraditionalcorrectiveaction/',"corrective_accident"."corrective_action_id",'/change/') as "link"
FROM
  {{ ref('hse_traditional_corrective_action_accident')}} as "corrective_accident"

UNION SELECT
  "training"."training_awareness_id" as "id",
  "training"."report_year",
  "training"."report_month",
  "training"."report_date" AS "date",
  "training"."report_state",
  "training"."report_source_state",
  'تدريب وتوعية' as "source",
  "training"."link" as "link"
FROM
  {{ ref('hse_traditional_training')}} as "training"

UNION SELECT
  "enviromental_inspection"."environmental_inspection_id" as "id",
  "enviromental_inspection"."report_year",
  "enviromental_inspection"."report_month",
  "enviromental_inspection"."report_date" AS "date",
  "enviromental_inspection"."report_state",
  "enviromental_inspection"."report_source_state",
  'تفتيش بيئي' as "source",
  "enviromental_inspection"."link" as "link"
FROM
  {{ ref('hse_traditional_enviromental_inspection')}} as "enviromental_inspection"
UNION SELECT
  "market_arrangement"."market_id" as "id",
  "market_arrangement"."report_year",
  "market_arrangement"."report_month",
  "market_arrangement"."report_date" AS "date",
  "market_arrangement"."report_state",
  "market_arrangement"."report_source_state",
  'تنظيم الأسواق' as "source",
  "market_arrangement"."link" as "link"
FROM
  {{ ref('hse_traditional_market_arrangement')}} as "market_arrangement"
