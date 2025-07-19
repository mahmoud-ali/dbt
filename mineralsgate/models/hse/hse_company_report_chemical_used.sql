SELECT
  "public"."hse_companies_apphseperformancereportchemicalused"."id" AS "id",
  "hse_chemical_used_factors"."name" AS "factor",
  "public"."hse_companies_apphseperformancereportchemicalused"."qty_used" AS "qty_used",
  "public"."hse_companies_apphseperformancereportchemicalused"."qty_in_store" AS "qty_in_store",
  "public"."hse_companies_apphseperformancereportchemicalused"."expire_dt" AS "expire_dt",
  "hse_companies_apphseperformancereport - master_id".*
FROM
  "public"."hse_companies_apphseperformancereportchemicalused"
 
LEFT JOIN {{ ref('hse_company_report') }} AS "hse_companies_apphseperformancereport - master_id" ON "public"."hse_companies_apphseperformancereportchemicalused"."master_id" = "hse_companies_apphseperformancereport - master_id"."report_id"
LEFT JOIN {{ ref('hse_company_chemical_used_factors')}} as "hse_chemical_used_factors" ON "hse_chemical_used_factors"."id" = "public"."hse_companies_apphseperformancereportchemicalused"."factor"