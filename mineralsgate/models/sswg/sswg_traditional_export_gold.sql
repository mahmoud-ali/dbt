SELECT
  "public"."sswg_basicformexport"."created_at",
  "public"."sswg_basicformexport"."id" AS "export_id",
  "public"."sswg_basicformexport"."date" AS "date",
  "public"."sswg_basicformexport"."sn_no" AS "sn_no",
  "export_state"."name" AS "state",
  "export_next_state"."name" AS "next_state",
  "Gold Travel Lkpowner - Name"."name" AS "company_name",
  CONCAT('https://mineralsgate.com/app/managers/sswg/basicformexport/',"public"."sswg_basicformexport"."id",'/change/') as "link"
FROM
  "public"."sswg_basicformexport"
  LEFT JOIN "public"."sswg_companydetails" AS "Sswg Companydetails" ON "public"."sswg_basicformexport"."id" = "Sswg Companydetails"."basic_form_export_id"
  LEFT JOIN "public"."gold_travel_lkpowner" AS "Gold Travel Lkpowner - Name" ON "Sswg Companydetails"."name_id" = "Gold Travel Lkpowner - Name"."id"

LEFT JOIN
    {{ ref('sswg_export_state')}} as "export_state" ON "export_state"."id" = "public"."sswg_basicformexport"."state"
LEFT JOIN
    {{ ref('sswg_export_state')}} as "export_next_state" ON "export_next_state"."id" = ("public"."sswg_basicformexport"."state"+1)
    