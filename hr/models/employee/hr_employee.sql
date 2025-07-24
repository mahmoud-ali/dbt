SELECT
  "public"."hr_employeebasic"."id" AS "id",
  "public"."hr_employeebasic"."code" AS "code",
  "public"."hr_employeebasic"."name" AS "name",
  "hr_draja_wazifia"."name" AS "draja_wazifia",
  "hr_alawa_sanawia"."name" AS "alawa_sanawia",
  "public"."hr_employeebasic"."tarikh_ta3in" AS "tarikh_ta3in",
  "public"."hr_employeebasic"."atfal" AS "atfal",
  "mariage_state"."name" AS "gasima",
  "hr_moahil"."name" AS "moahil",
  "hr_sex"."name" AS "sex",
  "no3_2lertibat"."name" AS "no3_2lertibat",
  "public"."hr_employeebasic"."phone" AS "phone",
  "public"."hr_employeebasic"."email" AS "email",
  "public"."hr_employeebasic"."tarikh_milad" AS "tarikh_milad",
  "public"."hr_employeebasic"."tarikh_akhir_targia" AS "tarikh_akhir_targia",
  "hr_employee_status"."name" AS "status",
  "hr_mosamawazifi - mosama_wazifi_id"."name" AS "mosamawazifi",
  "hr_hikalwazifi - edara_3ama"."name" AS "edara_3ama",
  "hr_hikalwazifi - edara_far3ia_id"."name" AS "edara_far3ia"
FROM
  "public"."hr_employeebasic"
LEFT JOIN "public"."hr_mosamawazifi" AS "hr_mosamawazifi - mosama_wazifi_id" ON "public"."hr_employeebasic"."mosama_wazifi_id" = "hr_mosamawazifi - mosama_wazifi_id"."id"
LEFT JOIN "public"."hr_hikalwazifi" AS "hr_hikalwazifi - hikal_wazifi_id" ON "public"."hr_employeebasic"."hikal_wazifi_id" = "hr_hikalwazifi - hikal_wazifi_id"."id"
LEFT JOIN "public"."hr_hikalwazifi" AS "hr_hikalwazifi - edara_3ama" ON "hr_hikalwazifi - hikal_wazifi_id"."edara_3ama_id" = "hr_hikalwazifi - edara_3ama"."id"
LEFT JOIN "public"."hr_hikalwazifi" AS "hr_hikalwazifi - edara_far3ia_id" ON "hr_hikalwazifi - hikal_wazifi_id"."edara_far3ia_id" = "hr_hikalwazifi - edara_far3ia_id"."id"
LEFT JOIN {{ ref('hr_draja_wazifia')}} as "hr_draja_wazifia" ON "hr_draja_wazifia"."id" = "public"."hr_employeebasic"."draja_wazifia"
LEFT JOIN {{ ref('hr_alawa_sanawia')}} as "hr_alawa_sanawia" ON "hr_alawa_sanawia"."id" = "public"."hr_employeebasic"."alawa_sanawia"
LEFT JOIN {{ ref('hr_sex')}} as "hr_sex" ON "hr_sex"."id" = "public"."hr_employeebasic"."sex"
LEFT JOIN {{ ref('no3_2lertibat')}} as "no3_2lertibat" ON "no3_2lertibat"."id" = "public"."hr_employeebasic"."no3_2lertibat"
LEFT JOIN {{ ref('hr_employee_status')}} as "hr_employee_status" ON "hr_employee_status"."id" = "public"."hr_employeebasic"."status"
LEFT JOIN {{ ref('hr_moahil')}} as "hr_moahil" ON "hr_moahil"."id" = "public"."hr_employeebasic"."moahil"
LEFT JOIN {{ ref('mariage_state')}} as "mariage_state" ON "mariage_state"."id" = "public"."hr_employeebasic"."gasima"