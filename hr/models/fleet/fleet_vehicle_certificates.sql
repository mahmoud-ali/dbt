SELECT
  "public"."fleet_vehiclecertificate"."id" AS "cert_id",
  "vehicle".*,
  "Fleet Vehiclecertificatetype - Cert Type"."name" AS "cert_type_name",
  "public"."fleet_vehiclecertificate"."start_date" AS "cert_start_date",
  "public"."fleet_vehiclecertificate"."end_date" AS "cert_end_date",
  "public"."fleet_vehiclecertificate"."notes" AS "cert_notes"
FROM
  "public"."fleet_vehiclecertificate"
 
LEFT JOIN {{ ref('fleet_vehicle')}} AS "vehicle" ON "public"."fleet_vehiclecertificate"."vehicle_id" = "vehicle"."vehicle_id"
LEFT JOIN "public"."fleet_vehiclecertificatetype" AS "Fleet Vehiclecertificatetype - Cert Type" ON "public"."fleet_vehiclecertificate"."cert_type_id" = "Fleet Vehiclecertificatetype - Cert Type"."id"

