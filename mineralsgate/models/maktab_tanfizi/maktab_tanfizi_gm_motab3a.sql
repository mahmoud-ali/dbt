SELECT
  "public"."khatabat_khatabat"."letter_number" AS "letter_number",
  "public"."khatabat_khatabat"."subject" AS "subject",
  "public"."khatabat_khatabat"."updated_at" AS "updated_at",
  "public"."khatabat_khatabat"."created_at" AS "created_at",
  "public"."khatabat_motab3atkhatabat"."id" AS "motab3a_id",
  "public"."khatabat_maktabtanfizi"."name" AS "maktab_tanfizi_name",
  "public"."khatabat_motab3atkhatabat"."date" AS "date",
  "public"."khatabat_motab3atkhatabat"."action" AS "action",
  "completion_state"."name" AS "done",
  CONCAT('https://mineralsgate.com/app/managers/khatabat/khatabat/',"public"."khatabat_khatabat"."letter_number",'/change/') as "link"

FROM  "public"."khatabat_khatabat"
INNER JOIN "public"."khatabat_motab3atkhatabat" ON "public"."khatabat_khatabat"."letter_number" = "public"."khatabat_motab3atkhatabat"."letter_id"
LEFT JOIN "public"."khatabat_maktabtanfizi" ON "public"."khatabat_khatabat"."maktab_tanfizi_id" = "public"."khatabat_maktabtanfizi"."id"
LEFT JOIN {{ref('completion_state')}} AS "completion_state" ON "completion_state"."id" = "public"."khatabat_motab3atkhatabat"."done"
WHERE LOWER("public"."khatabat_maktabtanfizi"."code") = 'gm' 
