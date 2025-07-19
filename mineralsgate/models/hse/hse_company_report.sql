SELECT
  "public"."hse_companies_apphseperformancereport"."id" AS "report_id",
  "public"."hse_companies_apphseperformancereport"."year" AS "year",
  "public"."hse_companies_apphseperformancereport"."month" AS "month",
  "public"."hse_companies_apphseperformancereport"."note" AS "note",
  "hse_state"."name" AS "state",
  "company - company_id"."id" AS "company_id",
  "company - company_id"."name_ar" AS "company_name_ar",
  "company - company_id"."name_en" AS "company_name_en",
  "company - company_id"."company_type" AS "company_type",
  "company - company_id"."code" AS "company_code",
  "company - company_id"."company_status" AS "company_status",
  "license - license_id"."id" AS "license_id",
  "license - license_id"."date" AS "license_date",
  "license - license_id"."start_date" AS "license_start_date",
  "license - license_id"."end_date" AS "license_end_date",
  "license - license_id"."sheet_no" AS "license_sheet_no",
  "license - license_id"."license_no" AS "license_license_no",
  "license - license_id"."license_type" AS "license_license_type"
FROM
  "public"."hse_companies_apphseperformancereport"
 
LEFT JOIN {{ ref('company') }} AS "company - company_id" ON "public"."hse_companies_apphseperformancereport"."company_id" = "company - company_id"."id"
LEFT JOIN {{ ref('license') }} AS "license - license_id" ON "public"."hse_companies_apphseperformancereport"."license_id" = "license - license_id"."id"
LEFT JOIN {{ ref('hse_company_report_state') }} as "hse_state" ON "public"."hse_companies_apphseperformancereport"."state" = "hse_state"."id"