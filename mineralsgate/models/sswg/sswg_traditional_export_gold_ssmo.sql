SELECT
  "public"."sswg_ssmodata"."id" AS "ssmo_id",
  "public"."sswg_ssmodata"."raw_weight" AS "raw_weight_gram",
  "public"."sswg_ssmodata"."net_weight" AS "net_weight_gram",
  "public"."sswg_ssmodata"."allow_count" AS "allow_count",
  "public"."sswg_ssmodata"."certificate_id" AS "certificate_id",
  "sswg_basicformexport"."export_id" AS "export_id",
  "sswg_basicformexport"."date" AS "export_date",
  "sswg_basicformexport"."sn_no" AS "export_sn_no",
  "sswg_basicformexport"."state" AS "export_state",
  "sswg_basicformexport"."next_state" AS "export_next_state",
  "sswg_basicformexport"."link" AS "link"
FROM
  "public"."sswg_ssmodata"
INNER JOIN 
    {{ ref('sswg_traditional_export_gold')}} AS "sswg_basicformexport" ON "public"."sswg_ssmodata"."basic_form_export_id" = "sswg_basicformexport"."export_id"
