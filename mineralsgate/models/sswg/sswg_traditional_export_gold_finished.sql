SELECT
  "sswg_basicformexport"."export_id" AS "export_id",
  "sswg_basicformexport"."date" AS "export_date",
  "sswg_basicformexport"."sn_no" AS "export_sn_no",
  "sswg_basicformexport"."state" AS "export_state",
  "sswg_basicformexport"."next_state" AS "export_next_state",
  "sswg_basicformexport"."company_name" AS "company_name",
  "sswg_basicformexport"."link" AS "link",
  "sswg_basicformexport"."date" AS "started_at",
  "public"."sswg_unifiedteamdata"."flight_datetime" AS "ended_at",
  FLOOR(EXTRACT(EPOCH FROM ("public"."sswg_unifiedteamdata"."flight_datetime" - "sswg_basicformexport"."date"))/86400)+1 as "kpi_days"
FROM
  "public"."sswg_unifiedteamdata"
INNER JOIN 
    {{ ref('sswg_traditional_export_gold')}} AS "sswg_basicformexport" ON "public"."sswg_unifiedteamdata"."basic_form_export_id" = "sswg_basicformexport"."export_id"
