SELECT
  "public"."production_control_goldproductionform"."id" AS "id",
  "public"."production_control_goldproductionform"."date" AS "date",
  "public"."production_control_goldproductionform"."form_no" AS "form_no",
  "company_profile_tblcompanyproductionlicense__via__license_id"."license_no" AS "license_no",
  "company_profile_tblcompanyproductionlicense__via__license_id"."sheet_no" AS "sheet_no",
  "company_profile_tblcompanyproductionlicense - license_id"."date" AS "license_date",
  "company_type"."name" as "company_type",
  "company_profile_tblcompanyproduction__via__company__21d5e3ee"."name_ar" AS "company_name_ar",
  "company_profile_tblcompanyproduction__via__company__21d5e3ee"."name_en" AS "company_name_en",
  "public"."production_control_goldproductionform"."alloy_weight_expected" AS "alloy_weight_expected",
  "public"."production_control_goldproductionform"."alloy_khabath" AS "alloy_khabath",
  "public"."production_control_goldproductionform"."alloy_remaind" AS "alloy_remaind",
  "production_state"."name" AS "state",
  "public"."production_control_goldproductionform"."alloy_jaf" AS "alloy_jaf",
  SUM(
    "production_control_goldproductionformalloy"."alloy_weight"
  ) AS "sum_alloy_weight",
  count(
    distinct "production_control_goldproductionformalloy"."id"
  ) AS "alloy_count"
FROM
  "public"."production_control_goldproductionform"
 
LEFT JOIN "public"."production_control_goldproductionformalloy" AS "production_control_goldproductionformalloy" ON "public"."production_control_goldproductionform"."id" = "production_control_goldproductionformalloy"."master_id"
  LEFT JOIN "public"."company_profile_tblcompanyproductionlicense" AS "company_profile_tblcompanyproductionlicense - license_id" ON "public"."production_control_goldproductionform"."license_id" = "company_profile_tblcompanyproductionlicense - license_id"."id"
  LEFT JOIN "public"."company_profile_tblcompanyproductionlicense" AS "company_profile_tblcompanyproductionlicense__via__license_id" ON "public"."production_control_goldproductionform"."license_id" = "company_profile_tblcompanyproductionlicense__via__license_id"."id"
  LEFT JOIN "public"."company_profile_tblcompanyproduction" AS "company_profile_tblcompanyproduction__via__company__21d5e3ee" ON "company_profile_tblcompanyproductionlicense - license_id"."company_id" = "company_profile_tblcompanyproduction__via__company__21d5e3ee"."id"
  LEFT JOIN {{ ref('company_type') }} as "company_type" on "company_type"."id" = "company_profile_tblcompanyproduction__via__company__21d5e3ee"."company_type"
  LEFT JOIN {{ ref('production_state') }} as "production_state" on "production_state"."id" = "public"."production_control_goldproductionform"."state"

WHERE
  "public"."production_control_goldproductionform"."state" > 1
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14
ORDER BY 1 desc