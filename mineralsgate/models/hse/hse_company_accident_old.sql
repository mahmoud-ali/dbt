SELECT
  "public"."company_profile_apphseaccidentreport"."id" AS "accident_id",
  "company_app_state"."name" AS "accident_state",
  "public"."company_profile_apphseaccidentreport"."accident_dt" AS "accident_dt",
  "public"."company_profile_apphseaccidentreport"."accident_place" AS "accident_place",
  "accident_type"."name" AS "accident_type_id",
  "accident_class"."name" AS "accident_class",
  "company".*
FROM
  "public"."company_profile_apphseaccidentreport"
 
LEFT JOIN {{ ref('company') }} AS "company" ON "public"."company_profile_apphseaccidentreport"."company_id" = "company"."id"
LEFT JOIN {{ ref('hse_company_accident_old_class')}} AS "accident_class" ON "public"."company_profile_apphseaccidentreport"."accident_class" = "accident_class"."id"
LEFT JOIN {{ ref('hse_company_accident_old_type')}} AS "accident_type" ON "public"."company_profile_apphseaccidentreport"."accident_type_id" = "accident_type"."id"
LEFT JOIN {{ ref('company_app_state')}} AS "company_app_state" ON "public"."company_profile_apphseaccidentreport"."state" = "company_app_state"."id"