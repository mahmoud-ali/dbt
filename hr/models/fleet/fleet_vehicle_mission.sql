SELECT 
  fleet_mission.*,
  fleet_missionvehicle.id AS mission_vehicle_id,
  COALESCE(fleet_vehicledriver.driver_id, fleet_mission.driver_id) AS assigned_driver_id,
  COALESCE(fleet_vehicledriver.vehicle_id, fleet_mission.vehicle_id) AS assigned_vehicle_id,
  fleet_driver.name AS driver_name
FROM "public"."fleet_mission" AS fleet_mission
LEFT JOIN "public"."fleet_missionvehicle" AS fleet_missionvehicle ON fleet_mission.id = fleet_missionvehicle.mission_id
LEFT JOIN "public"."fleet_vehicledriver" AS fleet_vehicledriver ON fleet_missionvehicle.assignment_id = fleet_vehicledriver.id
LEFT JOIN "public"."fleet_driver"  AS fleet_driver ON fleet_driver.id = COALESCE(fleet_vehicledriver.driver_id, fleet_mission.driver_id)
