SELECT
  "public"."fleet_vehicleassignment"."id" AS "id",
  "vehicle".*,
  "public"."fleet_vehicleassignment"."assign_to" AS "assign_to",
  "public"."fleet_vehicleassignment"."start_date" AS "start_date",
  "public"."fleet_vehicleassignment"."end_date" AS "end_date"
FROM
  "public"."fleet_vehicleassignment"
 
LEFT JOIN {{ ref('fleet_vehicle')}} AS "vehicle" ON "public"."fleet_vehicleassignment"."vehicle_id" = "vehicle"."vehicle_id"

