SELECT
  "public"."sswg_cbsdata"."id" AS "cbs_id",
  "public"."sswg_cbsdata"."customer_account_number" AS "customer_account_number",
  "public"."sswg_cbsdata"."ex_form_number" AS "ex_form_number",
  "public"."sswg_cbsdata"."commercial_bank_name" AS "commercial_bank_name",
  "payment_method"."name" AS "payment_method",
  "public"."sswg_cbsdata"."issued_amount" AS "issued_amount",
  "sswg_basicformexport"."export_id" AS "export_id",
  "sswg_basicformexport"."date" AS "export_date",
  "sswg_basicformexport"."sn_no" AS "export_sn_no",
  "sswg_basicformexport"."state" AS "export_state",
  "sswg_basicformexport"."next_state" AS "export_next_state",
  "sswg_basicformexport"."company_name" AS "company_name",
  "sswg_basicformexport"."link" AS "link"
FROM
  "public"."sswg_cbsdata"
INNER JOIN 
    {{ ref('sswg_traditional_export_gold')}} AS "sswg_basicformexport" ON "public"."sswg_cbsdata"."basic_form_export_id" = "sswg_basicformexport"."export_id"
LEFT JOIN
  {{ ref('sswg_payment_method')}} as "payment_method" ON "public"."sswg_cbsdata"."payment_method" = "payment_method"."id"