SELECT
  "public"."sswg_basicformexport"."id" AS "export_id",
  "public"."sswg_basicformexport"."date" AS "date",
  "public"."sswg_basicformexport"."sn_no" AS "sn_no",
  "export_state"."name" AS "state",
  "export_next_state"."name" AS "next_state",
  CONCAT('https://mineralsgate.com/app/managers/sswg/basicformexport/',"public"."sswg_basicformexport"."id",'/change/') as "link"
FROM
  "public"."sswg_basicformexport"
LEFT JOIN
    {{ ref('sswg_export_state')}} as "export_state" ON "export_state"."id" = "public"."sswg_basicformexport"."state"
LEFT JOIN
    {{ ref('sswg_export_state')}} as "export_next_state" ON "export_next_state"."id" = ("public"."sswg_basicformexport"."state"+1)
    