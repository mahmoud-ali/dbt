SELECT
  "public"."hse_companies_apphseperformancereportmanpower"."id" AS "id",
  "hse_manpower_factors"."name" AS "factor",
  "public"."hse_companies_apphseperformancereportmanpower"."no_gov" AS "no_gov",
  "public"."hse_companies_apphseperformancereportmanpower"."no_staff" AS "no_staff",
  "public"."hse_companies_apphseperformancereportmanpower"."no_contractor" AS "no_contractor",
  "hse_companies_apphseperformancereport - master_id".*
FROM
  "public"."hse_companies_apphseperformancereportmanpower"
 
LEFT JOIN {{ ref('hse_company_report') }} AS "hse_companies_apphseperformancereport - master_id" ON "public"."hse_companies_apphseperformancereportmanpower"."master_id" = "hse_companies_apphseperformancereport - master_id"."report_id"
LEFT JOIN {{ ref('hse_company_manpower_factors')}} as "hse_manpower_factors" ON "hse_manpower_factors"."id" = "public"."hse_companies_apphseperformancereportmanpower"."factor"