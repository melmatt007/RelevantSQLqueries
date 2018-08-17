-- Get all types of taxes
SELECT OT.object_type_id,
       OT.name AS object_type_name,
       O.parent_id,
       O.object_id,
       O.name,
       O.version
  FROM nc_object_types OT -- OT = Object type
       JOIN nc_objects O -- O = Object
            ON OT.object_type_id = O.object_type_id
 WHERE OT.object_type_id = 9142882779313111035; -- Tax Type ID
END

-- Get all tax codes
SELECT OT.object_type_id,
       OT.name AS object_type_name,
       O.parent_id,
       O.object_id,
       O.name,
       O.version
  FROM nc_object_types OT -- OT = Object type
       JOIN nc_objects O -- O = Object
            ON OT.object_type_id = O.object_type_id
 WHERE OT.object_type_id = 9142883090013111306; -- Tax Code ID
END