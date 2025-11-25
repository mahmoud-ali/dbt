SELECT
  "public"."khatabat_khatabat"."letter_number" AS "letter_number",
  "public"."khatabat_khatabat"."subject" AS "subject",
  "public"."khatabat_khatabat"."updated_at" AS "updated_at",
  "public"."khatabat_khatabat"."created_at" AS "created_at",
  "public"."khatabat_harkatkhatabat"."id" AS "haraka_id",
  "maktab_tanfizi_movement_type"."name" AS "haraka_movement_type",
  "public"."khatabat_harkatkhatabat"."forward_date" AS "haraka_forward_date",
  "public"."khatabat_harkatkhatabat"."delivery_date" AS "haraka_delivery_date",
  "maktab_tanfizi_followup"."name" AS "haraka_followup_result",
  "public"."khatabat_harkatkhatabat"."followup_attachment" AS "haraka_followup_attachment",
  "public"."khatabat_harkatkhatabat"."letter_attachment" AS "haraka_letter_attachment",
  "maktab_tanfizi_procedure"."name" AS "procedure_name",
  "public"."khatabat_harkatkhatabat"."date" AS "haraka_date",
  "public"."khatabat_harkatkhatabat"."note" AS "haraka_note",
  "public"."khatabat_maktabtanfizi"."name" AS "maktab_tanfizi_name",
  "khatabat_maktabtanfizijiha_source"."name" AS "haraka_source_jiha",
  "khatabat_maktabtanfizijiha_forwarded_to"."name" AS "haraka_forwarded_to_jiha"
FROM
  "public"."khatabat_khatabat"
INNER JOIN "public"."khatabat_harkatkhatabat" ON "public"."khatabat_khatabat"."letter_number" = "public"."khatabat_harkatkhatabat"."letter_id"
LEFT JOIN "public"."khatabat_maktabtanfizi" ON "public"."khatabat_khatabat"."maktab_tanfizi_id" = "public"."khatabat_maktabtanfizi"."id"
LEFT JOIN "public"."khatabat_maktabtanfizijiha" AS "khatabat_maktabtanfizijiha_source" ON "public"."khatabat_harkatkhatabat"."source_entity_id" = "khatabat_maktabtanfizijiha_source"."id"
LEFT JOIN "public"."khatabat_maktabtanfizijiha" AS "khatabat_maktabtanfizijiha_forwarded_to" ON "public"."khatabat_harkatkhatabat"."forwarded_to_id" = "khatabat_maktabtanfizijiha_forwarded_to"."id"
LEFT JOIN {{ref('maktab_tanfizi_procedure')}} AS "maktab_tanfizi_procedure" ON "public"."khatabat_harkatkhatabat"."procedure" = "maktab_tanfizi_procedure"."id"
LEFT JOIN {{ref('maktab_tanfizi_movement_type')}} AS "maktab_tanfizi_movement_type" ON "public"."khatabat_harkatkhatabat"."movement_type" = "maktab_tanfizi_movement_type"."id"
LEFT JOIN {{ref('maktab_tanfizi_followup')}} AS "maktab_tanfizi_followup" ON "public"."khatabat_harkatkhatabat"."movement_type" = "maktab_tanfizi_followup"."id"
