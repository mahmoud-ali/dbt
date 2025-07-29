SELECT
  "public"."company_profile_tblcompanyproductionlicense"."id" AS "id",
  "public"."company_profile_tblcompanyproductionlicense"."date" AS "date",
  "public"."company_profile_tblcompanyproductionlicense"."start_date" AS "start_date",
  "public"."company_profile_tblcompanyproductionlicense"."end_date" AS "end_date",
  "public"."company_profile_tblcompanyproductionlicense"."sheet_no" AS "sheet_no",
  "public"."company_profile_tblcompanyproductionlicense"."license_no" AS "license_no",
  "license_type"."name" AS "license_type",
  "company_profile_tblcompanyproduction - company_id"."name_ar" AS "company_name_ar",
  "company_profile_tblcompanyproduction - company_id"."name_en" AS "company_name_en",
  "company_profile_tblcompanyproduction - company_id"."code" AS "company_code",
  "company_type"."name" AS "company_type",
  "company_type"."id" AS "company_type_id",
  "company_profile_lkpstate - state_id"."name" AS "company_state_name"
FROM
  "public"."company_profile_tblcompanyproductionlicense"
 
LEFT JOIN "public"."company_profile_tblcompanyproduction" AS "company_profile_tblcompanyproduction - company_id" ON "public"."company_profile_tblcompanyproductionlicense"."company_id" = "company_profile_tblcompanyproduction - company_id"."id"
LEFT JOIN "public"."company_profile_lkpstate" AS "company_profile_lkpstate - state_id" ON "public"."company_profile_tblcompanyproductionlicense"."state_id" = "company_profile_lkpstate - state_id"."id"
LEFT JOIN {{ ref('company_type') }} as "company_type" on "company_type"."id" = "company_profile_tblcompanyproduction - company_id"."company_type"
LEFT JOIN {{ ref('license_type') }} as "license_type" on "license_type"."id" = "public"."company_profile_tblcompanyproductionlicense"."license_type"