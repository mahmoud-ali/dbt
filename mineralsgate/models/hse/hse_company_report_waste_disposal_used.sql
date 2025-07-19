SELECT
  "public"."hse_companies_apphseperformancereportwastedisposal"."id" AS "id",
  "hse_waste_disposal_factors"."name" AS "factor",
  "public"."hse_companies_apphseperformancereportwastedisposal"."qty_used" AS "qty_used",
  "public"."hse_companies_apphseperformancereportwastedisposal"."disposal_method" AS "disposal_method",
  "hse_companies_apphseperformancereport - master_id".*
FROM
  "public"."hse_companies_apphseperformancereportwastedisposal"
 
LEFT JOIN {{ ref('hse_company_report') }} AS "hse_companies_apphseperformancereport - master_id" ON "public"."hse_companies_apphseperformancereportwastedisposal"."master_id" = "hse_companies_apphseperformancereport - master_id"."report_id"
LEFT JOIN {{ ref('hse_company_waste_disposal_factors')}} as "hse_waste_disposal_factors" ON "hse_waste_disposal_factors"."id" = "public"."hse_companies_apphseperformancereportwastedisposal"."factor"
