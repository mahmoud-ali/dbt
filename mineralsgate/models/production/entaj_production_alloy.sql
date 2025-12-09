SELECT
  "public"."production_control_goldproductionformalloy"."alloy_serial_no" AS "alloy_serial_no",
  "public"."production_control_goldproductionformalloy"."alloy_weight" AS "alloy_weight",
  "public"."production_control_goldproductionformalloy"."alloy_added_gold" AS "alloy_added_gold",
  "public"."production_control_goldproductionformalloy"."alloy_shipped" AS "alloy_shipped",
  "Production Control Goldproductionform - Master"."form_no" AS "production_form_no",
  "Production Control Goldproductionform - Master"."date" AS "production_date",
  "production_state"."name" AS "production_form_state",
  "Production Control Goldshippingform - Master"."date" AS "shipping_date",
  "shipping_state"."name" AS "shipping_form_state",
  "Company Profile Tblcompanyproduction - Company"."name_ar" AS "company_name_ar",
  "Company Profile Tblcompanyproduction - Company"."name_en" AS "company_name_en",
  "company_type"."name" AS "company_company_type",
  "company_type"."id" as "company_type_id",
  "Company Profile Tblcompanyproductionlicense - License"."start_date" AS "license_start_date",
  "Company Profile Tblcompanyproductionlicense - License"."end_date" AS "license_end_date",
  "Company Profile Tblcompanyproductionlicense - License"."sheet_no" AS "license_sheet_no",
  "Company Profile Tblcompanyproductionlicense - License"."license_no" AS "license_no",
  "Company Profile Lkpstate - State"."name" AS "source_state_name",
  "Company Profile Lkplocality - Locality"."name" AS "locality_name"
FROM
  "public"."production_control_goldproductionformalloy"
 
LEFT JOIN "public"."production_control_goldshippingformalloy" AS "Production Control Goldshippingformalloy" ON "public"."production_control_goldproductionformalloy"."id" = "Production Control Goldshippingformalloy"."alloy_serial_no_id"
  LEFT JOIN "public"."production_control_goldproductionform" AS "Production Control Goldproductionform - Master" ON "public"."production_control_goldproductionformalloy"."master_id" = "Production Control Goldproductionform - Master"."id"
  LEFT JOIN "public"."production_control_goldshippingform" AS "Production Control Goldshippingform - Master" ON "Production Control Goldshippingformalloy"."master_id" = "Production Control Goldshippingform - Master"."id"
  LEFT JOIN "public"."company_profile_tblcompanyproductionlicense" AS "Company Profile Tblcompanyproductionlicense - License" ON "Production Control Goldproductionform - Master"."license_id" = "Company Profile Tblcompanyproductionlicense - License"."id"
  LEFT JOIN "public"."company_profile_tblcompanyproduction" AS "Company Profile Tblcompanyproduction - Company" ON "Company Profile Tblcompanyproductionlicense - License"."company_id" = "Company Profile Tblcompanyproduction - Company"."id"
  LEFT JOIN "public"."company_profile_lkpstate" AS "Company Profile Lkpstate - State" ON "Company Profile Tblcompanyproductionlicense - License"."state_id" = "Company Profile Lkpstate - State"."id"
  LEFT JOIN "public"."company_profile_lkplocality" AS "Company Profile Lkplocality - Locality" ON "Company Profile Tblcompanyproductionlicense - License"."locality_id" = "Company Profile Lkplocality - Locality"."id"
  LEFT JOIN {{ ref('production_state') }} as "production_state" on "production_state"."id" = "Production Control Goldproductionform - Master"."state"
  LEFT JOIN {{ ref('shipping_state') }} as "shipping_state" on "shipping_state"."id" = "Production Control Goldshippingform - Master"."state"
  LEFT JOIN {{ ref('company_type') }} as "company_type" on "company_type"."id" = "Company Profile Tblcompanyproduction - Company"."company_type"
