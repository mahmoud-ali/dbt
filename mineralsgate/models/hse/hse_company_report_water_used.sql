SELECT
  "public"."hse_companies_apphseperformancereportwaterused"."id" AS "id",
  "hse_water_used_factors"."name" AS "factor",
  "public"."hse_companies_apphseperformancereportwaterused"."qty_used" AS "qty_used",
  "public"."hse_companies_apphseperformancereportwaterused"."source_of_water" AS "source_of_water",
  "public"."hse_companies_apphseperformancereportwaterused"."storage_method" AS "storage_method",
  "hse_companies_apphseperformancereport - master_id".*
FROM
  "public"."hse_companies_apphseperformancereportwaterused"
 
LEFT JOIN {{ ref('hse_company_report') }} AS "hse_companies_apphseperformancereport - master_id" ON "public"."hse_companies_apphseperformancereportwaterused"."master_id" = "hse_companies_apphseperformancereport - master_id"."report_id"
LEFT JOIN {{ ref('hse_company_water_used_factors')}} as "hse_water_used_factors" ON "hse_water_used_factors"."id" = "public"."hse_companies_apphseperformancereportwaterused"."factor"