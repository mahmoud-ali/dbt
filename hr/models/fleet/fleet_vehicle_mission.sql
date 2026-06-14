
SELECT 
"public"."fleet_mission".*,
"public"."fleet_driver"."name" AS "driver_name",
"public"."fleet_vehicle"."fuel_type_id" AS "vehicle_fuel_type"
FROM "public"."fleet_mission" AS fleet_mission
left join "public"."fleet_driver"  AS fleet_driver ON fleet_driver.id = fleet_mission.driver_id
left join "public"."fleet_vehicle" AS fleet_vehicle ON fleet_vehicle.id = fleet_mission.vehicle_id
