SELECT
  "public"."sswg_mocsdata"."id" AS "mocs_id",
  "public"."sswg_mocsdata"."contract_number" AS "mocs_contract_number",
  "public"."sswg_mocsdata"."exporters_importers_registry_number" AS "mocs_exporters_importers_registry_number",
  "public"."sswg_mocsdata"."unit_price_in_grams" AS "mocs_unit_price_in_grams",
  "public"."sswg_mocsdata"."total_contract_value" AS "mocs_total_contract_value",
  "public"."sswg_mocsdata"."port_of_shipment" AS "mocs_port_of_shipment",
  "public"."sswg_mocsdata"."port_of_arrival" AS "mocs_port_of_arrival",
  "public"."sswg_mocsdata"."main_bank_name" AS "mocs_main_bank_name",
  "public"."sswg_mocsdata"."subsidiary_bank_name" AS "mocs_subsidiary_bank_name",
  "public"."sswg_mocsdata"."contract_expiration_date" AS "mocs_contract_expiration_date",
  "sswg_basicformexport"."export_id" AS "export_id",
  "sswg_basicformexport"."date" AS "export_date",
  "sswg_basicformexport"."sn_no" AS "export_sn_no",
  "sswg_basicformexport"."state" AS "export_state",
  "sswg_basicformexport"."next_state" AS "export_next_state",
  "sswg_basicformexport"."company_name" AS "company_name",
  "sswg_basicformexport"."link" AS "link"
FROM
  "public"."sswg_mocsdata"
INNER JOIN 
    {{ ref('sswg_traditional_export_gold')}} AS "sswg_basicformexport" ON "public"."sswg_mocsdata"."basic_form_export_id" = "sswg_basicformexport"."export_id"
