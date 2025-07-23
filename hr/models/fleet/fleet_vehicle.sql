SELECT
  "public"."fleet_vehicle"."id" AS "vehicle_id",
  "public"."fleet_vehicle"."year" AS "vehicle_year",
  "public"."fleet_vehicle"."license_plate" AS "vehicle_license_plate",
  "public"."fleet_vehicle"."machine_number" AS "vehicle_machine_number",
  "public"."fleet_vehicle"."chassis_number" AS "vehicle_chassis_number",
  "Fleet Vehiclefueltype - Fuel Type"."name" AS "vehicle_fuel_type",
  "Fleet Vehiclemodel - Model"."name" AS "vehicle_model_name",
  "Fleet Vehiclemake - Make"."name" AS "vehicle_make_name",
  "Fleet Vehiclestatus - Status"."name" AS "vehicle_status_name",
  "public"."fleet_vehicle"."book_value" AS "book_value"
FROM
  "public"."fleet_vehicle"
 
LEFT JOIN "public"."fleet_vehiclefueltype" AS "Fleet Vehiclefueltype - Fuel Type" ON "public"."fleet_vehicle"."fuel_type_id" = "Fleet Vehiclefueltype - Fuel Type"."id"
LEFT JOIN "public"."fleet_vehiclemodel" AS "Fleet Vehiclemodel - Model" ON "public"."fleet_vehicle"."model_id" = "Fleet Vehiclemodel - Model"."id"
LEFT JOIN "public"."fleet_vehiclemake" AS "Fleet Vehiclemake - Make" ON "Fleet Vehiclemodel - Model"."make_id" = "Fleet Vehiclemake - Make"."id"
LEFT JOIN "public"."fleet_vehiclestatus" AS "Fleet Vehiclestatus - Status" ON "public"."fleet_vehicle"."status_id" = "Fleet Vehiclestatus - Status"."id"
