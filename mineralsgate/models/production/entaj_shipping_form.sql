SELECT
  "public"."production_control_goldshippingform"."id" AS "id",
  "public"."production_control_goldshippingform"."date" AS "date",
  "public"."production_control_goldshippingform"."form_no" AS "form_no",
  "shipping_state"."name" AS "state",
  "company_profile_tblcompanyproduction__via__company__21d5e3ee"."name_ar" AS "company_name_ar",
  "company_profile_tblcompanyproduction__via__company__21d5e3ee"."name_en" AS "company_name_en",
  "company_profile_tblcompanyproductionlicense - license_id"."license_no" AS "license_no",
  "company_profile_tblcompanyproductionlicense - license_id"."date" AS "license_date",
  "company_type"."name" AS "company_type",
  SUM(
    "production_control_goldproductionformalloy__via__al_eb865912"."alloy_weight"
  ) AS "sum_alloy_weight",
  count(
    distinct "production_control_goldproductionformalloy__via__al_eb865912"."id"
  ) AS "alloy_count"
FROM
  "public"."production_control_goldshippingform"
 
LEFT JOIN "public"."production_control_goldshippingformalloy" AS "production_control_goldshippingformalloy" ON "public"."production_control_goldshippingform"."id" = "production_control_goldshippingformalloy"."master_id"
  LEFT JOIN "public"."company_profile_tblcompanyproductionlicense" AS "company_profile_tblcompanyproductionlicense - license_id" ON "public"."production_control_goldshippingform"."license_id" = "company_profile_tblcompanyproductionlicense - license_id"."id"
  LEFT JOIN "public"."company_profile_tblcompanyproduction" AS "company_profile_tblcompanyproduction__via__company__21d5e3ee" ON "company_profile_tblcompanyproductionlicense - license_id"."company_id" = "company_profile_tblcompanyproduction__via__company__21d5e3ee"."id"
  LEFT JOIN "public"."production_control_goldproductionformalloy" AS "production_control_goldproductionformalloy__via__al_eb865912" ON "production_control_goldshippingformalloy"."alloy_serial_no_id" = "production_control_goldproductionformalloy__via__al_eb865912"."id"
  LEFT JOIN {{ ref('company_type') }} as "company_type" on "company_type"."id" = "company_profile_tblcompanyproduction__via__company__21d5e3ee"."company_type"
  LEFT JOIN {{ ref('shipping_state') }} as "shipping_state" on "shipping_state"."id" = "public"."production_control_goldshippingform"."state"
WHERE
  "public"."production_control_goldshippingform"."state" > 1
GROUP BY 1,2,3,4,5,6,7,8,9
ORDER BY 1 desc
