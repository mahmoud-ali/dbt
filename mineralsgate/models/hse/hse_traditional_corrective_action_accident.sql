SELECT
  "public"."hse_traditional_hsetraditionalcorrectiveaction"."id" AS "corrective_action_id",
  "hse_traditional_report_state"."name" AS "state",
  "public"."hse_traditional_hsetraditionalcorrectiveaction"."corrective_action" AS "corrective_action",
  "lkpstate"."name" AS "source_state",
  "public"."hse_traditional_hsetraditionalcorrectiveaction"."when" AS "when",
  "hse_traditional_accident"."accident_id",
  "hse_traditional_accident"."type" as "accident_type",
  "hse_traditional_accident"."what" as "accident_what",
  "hse_traditional_accident"."when" as "accident_when",
  "hse_traditional_accident"."where" as "accident_where"
FROM
  "public"."hse_traditional_hsetraditionalcorrectiveaction"
INNER JOIN {{ ref('hse_traditional_accident')}} AS "hse_traditional_accident" ON "public"."hse_traditional_hsetraditionalcorrectiveaction"."source_accident_id" = "hse_traditional_accident"."accident_id"
LEFT JOIN "public"."company_profile_lkpstate" AS "lkpstate" ON "public"."hse_traditional_hsetraditionalcorrectiveaction"."source_state_id" = "lkpstate"."id"
LEFT JOIN {{ ref('hse_traditional_report_state')}} as "hse_traditional_report_state" ON "hse_traditional_report_state"."id" = "public"."hse_traditional_hsetraditionalcorrectiveaction"."state"
