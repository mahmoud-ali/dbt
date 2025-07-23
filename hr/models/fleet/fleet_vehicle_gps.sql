SELECT
  "public"."fleet_vehiclegpsdevice"."id" AS "id",
  "vehicle".*,
  "Tc Devices - Gps"."name" AS "gps_name",
  "Tc Devices - Gps"."uniqueid" AS "gps_uniqueid",
  "Tc Positions - Positionid"."servertime" AS "gps_last_position_servertime",
  "Tc Positions - Positionid"."latitude" AS "gps_last_position_latitude",
  "Tc Positions - Positionid"."longitude" AS "gps_last_position_longitude",
  "Tc Positions - Positionid"."altitude" AS "gps_last_position_altitude",
  "Tc Positions - Positionid"."speed" AS "gps_last_position_speed"
FROM
  "public"."fleet_vehiclegpsdevice"
 
LEFT JOIN "public"."tc_devices" AS "Tc Devices - Gps" ON "public"."fleet_vehiclegpsdevice"."gps_id" = "Tc Devices - Gps"."id"
LEFT JOIN "public"."tc_positions" AS "Tc Positions - Positionid" ON "Tc Devices - Gps"."positionid" = "Tc Positions - Positionid"."id"
LEFT JOIN {{ ref('fleet_vehicle')}} AS "vehicle" ON "public"."fleet_vehiclegpsdevice"."vehicle_id" = "vehicle"."vehicle_id"
