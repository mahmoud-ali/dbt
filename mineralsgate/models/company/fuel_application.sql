SELECT
  "public"."company_profile_appfuelpermission"."id" AS "id",
  "public"."company_profile_appfuelpermission"."created_at" AS "created_at",
  "public"."company_profile_appfuelpermission"."updated_at" AS "updated_at",
  "state"."name" AS "state",
  "Company Profile Appfuelpermissiondetail"."fuel_type_name" AS "fuel_type",
  "company_profile_tblcompanyproduction__via__company_id"."name_ar" AS "company_name_ar",
  "company_profile_tblcompanyproduction__via__company_id"."name_en" AS "company_name_en",
  "company_type"."name" AS "company_type",
  COALESCE(
    SUM(
    "Company Profile Appfuelpermissiondetail"."fuel_qty"
    ), 0) AS "fuel_qty",
  COALESCE(
    SUM(
    "Company Profile Appfuelpermissiondetail"."fuel_actual_qty"
    ), 0) AS "fuel_actual_qty"
FROM
  "public"."company_profile_appfuelpermission"
 
LEFT JOIN "public"."company_profile_appfuelpermissiondetail" AS "Company Profile Appfuelpermissiondetail" ON "public"."company_profile_appfuelpermission"."id" = "Company Profile Appfuelpermissiondetail"."fuel_master_id"
LEFT JOIN "public"."company_profile_tblcompanyproduction" AS "company_profile_tblcompanyproduction__via__company_id" ON "public"."company_profile_appfuelpermission"."company_id" = "company_profile_tblcompanyproduction__via__company_id"."id"
LEFT JOIN {{ ref('company_type') }} as "company_type" on "company_type"."id" = "company_profile_tblcompanyproduction__via__company_id"."company_type"
LEFT JOIN {{ ref('company_app_state')}} as "state" on "state"."id" = "public"."company_profile_appfuelpermission"."state"

GROUP BY 1,2,3,4,5,6,7,8