-- Get all object relationships
SELECT A.attr_id AS relationship_id,
       A.name AS relationship_name,
       ROT.object_type_id,
       ROT.name AS object_type_name,
       RO.parent_id AS object_parent_id,
       RO.object_id,
       RO.name AS object_name
  FROM nc_objects O -- O = object
       JOIN nc_references R -- R = Reference
            ON O.object_id = R.object_id
       JOIN nc_attributes A  -- A = Attribute
            ON R.attr_id = A.attr_id
       JOIN nc_objects RO -- RO = Referenced object
            ON R.reference = RO.object_id
       JOIN nc_object_types ROT -- ROT = Referenced object type
            ON RO.object_type_id = ROT.object_type_id
 WHERE O.object_id = ;-- Object Code
END

-- Get all object parameters
SELECT A.attr_id AS parameter_id,
       A.name AS parameter_name,
       P.value,
       LT.attr_type_def_id AS value_type_id,
       LT.name AS value_type_name,
       LV.list_value_id AS value_id,
       LV.value AS value_description
  FROM nc_objects O -- O = object
       JOIN nc_params P -- P = Parameter
            ON O.object_id = P.object_id
       JOIN nc_attributes A -- A = Attribute
            ON P.attr_id = A.attr_id
       LEFT JOIN nc_list_values LV -- LV = List value
                 ON P.list_value_id = LV.list_value_id
       LEFT JOIN nc_attr_type_defs  LT -- List type
                 ON LV.attr_type_def_id = LT.attr_type_def_id
 WHERE O.object_id = ;-- Object Code
END

-- Get all your code changes
SELECT O.*
  FROM nc_objects O -- O = object
       JOIN nc_references R -- R = Reference
            ON O.object_id = R.object_id
       JOIN nc_attributes A  -- A = Attribute
            ON R.attr_id = A.attr_id
       JOIN nc_objects RO -- RO = Referenced object
            ON     R.reference = RO.object_id
               AND RO.name LIKE 'QST'
       JOIN nc_params P
            ON     RO.object_id = P.object_id
               AND P.value LIKE '';
END