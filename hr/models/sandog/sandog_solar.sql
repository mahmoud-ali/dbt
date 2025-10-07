SELECT
  "public"."sandog_employeesolarsystem"."id" AS "id",
  "public"."sandog_employeesolarsystem"."employee_id" AS "employee_id",
  "sandog_category"."name" AS "sandog_category_name",
  "sandog_payment_method"."name" AS "sandog_payment_method",
  "public"."sandog_employeesolarsystem"."created_at" AS "created_at",
  "public"."sandog_employeesolarsystem"."updated_at" AS "updated_at"
FROM
  "public"."sandog_employeesolarsystem"
 
LEFT JOIN "public"."sandog_lkpsolarsystemcategory" AS "sandog_category" ON "public"."sandog_employeesolarsystem"."category_id" = "sandog_category"."id"
LEFT JOIN "public"."sandog_lkpsolarsystempaymentmethod" AS "sandog_payment_method" ON "public"."sandog_employeesolarsystem"."payment_method_id" = "sandog_payment_method"."id"