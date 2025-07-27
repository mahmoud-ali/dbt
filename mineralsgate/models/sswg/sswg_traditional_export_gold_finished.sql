SELECT
  "public"."sswg_customforceairportdata"."comment" AS "customforce_comment", 
  "sswg_basicformexport"."export_id" AS "export_id",
  "sswg_basicformexport"."date" AS "export_date",
  "sswg_basicformexport"."sn_no" AS "export_sn_no",
  "sswg_basicformexport"."state" AS "export_state",
  "sswg_basicformexport"."next_state" AS "export_next_state",
  "sswg_basicformexport"."link" AS "link",
  "sswg_basicformexport"."created_at" AS "started_at",
  "public"."sswg_customforceairportdata"."created_at" AS "ended_at",
  FLOOR(EXTRACT(EPOCH FROM ("public"."sswg_customforceairportdata"."created_at" - "sswg_basicformexport"."created_at"))/3600) as "kpi_hours"
FROM
  "public"."sswg_customforceairportdata"
INNER JOIN 
    {{ ref('sswg_traditional_export_gold')}} AS "sswg_basicformexport" ON "public"."sswg_customforceairportdata"."basic_form_export_id" = "sswg_basicformexport"."export_id"
