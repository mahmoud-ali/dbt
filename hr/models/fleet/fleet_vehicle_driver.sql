SELECT
  "public"."fleet_vehicledriver"."id" AS "driver_id",
  "vehicle".*,
  "Fleet Driver - Driver"."name" AS "driver_name",
  "public"."fleet_vehicledriver"."start_date" AS "driver_start_date",
  "public"."fleet_vehicledriver"."end_date" AS "driver_end_date",
  "Fleet Driver - Driver"."license_no" AS "driver_license_no",
  "Fleet Driver - Driver"."expiry_date" AS "driver_expiry_date",
  "Fleet Driver - Driver"."phone" AS "driver_phone",
  "Fleet Driverlicensetype - License Type"."name" AS "driver_license_type"
FROM
  "public"."fleet_vehicledriver"
LEFT JOIN {{ ref('fleet_vehicle')}} AS "vehicle" ON "public"."fleet_vehicledriver"."vehicle_id" = "vehicle"."vehicle_id"
LEFT JOIN "public"."fleet_driver" AS "Fleet Driver - Driver" ON "public"."fleet_vehicledriver"."driver_id" = "Fleet Driver - Driver"."id"
LEFT JOIN "public"."fleet_driverlicensetype" AS "Fleet Driverlicensetype - License Type" ON "Fleet Driver - Driver"."license_type_id" = "Fleet Driverlicensetype - License Type"."id"
