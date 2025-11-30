SELECT
  "public"."sandog_employeeomra"."id" AS "id",
  "public"."sandog_employeeomra"."employee_id" AS "employee_id",
  "Sandog Lkpomracategory - Category"."name" AS "category_name",
  "public"."sandog_employeeomra"."count" AS "no_of_persons",
  "public"."sandog_employeeomra"."created_at" AS "created_at",
  "public"."sandog_employeeomra"."updated_at" AS "updated_at"
FROM
  "public"."sandog_employeeomra"
 
LEFT JOIN "public"."sandog_lkpomracategory" AS "Sandog Lkpomracategory - Category" ON "public"."sandog_employeeomra"."category_id" = "Sandog Lkpomracategory - Category"."id"
