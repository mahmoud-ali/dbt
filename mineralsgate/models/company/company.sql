SELECT
  "public"."company_profile_tblcompanyproduction"."id" AS "id",
  "public"."company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
  "public"."company_profile_tblcompanyproduction"."name_en" AS "name_en",
  "public"."company_profile_tblcompanyproduction"."address" AS "address",
  "public"."company_profile_tblcompanyproduction"."website" AS "website",
  "public"."company_profile_tblcompanyproduction"."manager_name" AS "manager_name",
  "public"."company_profile_tblcompanyproduction"."manager_phone" AS "manager_phone",
  "public"."company_profile_tblcompanyproduction"."rep_name" AS "rep_name",
  "public"."company_profile_tblcompanyproduction"."rep_phone" AS "rep_phone",
  "public"."company_profile_tblcompanyproduction"."email" AS "email",
  "company_type"."name" AS "company_type",
  "public"."company_profile_tblcompanyproduction"."code" AS "code",
  "company_profile_lkpcompanyproductionstatus - status_id"."name" AS "company_status"
FROM
  "public"."company_profile_tblcompanyproduction"
 
LEFT JOIN "public"."company_profile_lkpcompanyproductionstatus" AS "company_profile_lkpcompanyproductionstatus - status_id" ON "public"."company_profile_tblcompanyproduction"."status_id" = "company_profile_lkpcompanyproductionstatus - status_id"."id"
LEFT JOIN {{ ref('company_type') }} as "company_type" on "company_type"."id" = "public"."company_profile_tblcompanyproduction"."company_type"
