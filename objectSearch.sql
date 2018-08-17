SELECT *
  FROM nc_objects O
 WHERE O.name LIKE 'QST'
END


select o.object_id, o.name, o.description
from nc_objects o
where object_type_id in (
  select object_type_id
  from nc_object_types
  start with object_type_id in (7021759920013445069, 9133383350013199423)
  connect by parent_id = prior object_type_id
)
and upper(name) like upper('Office Phone')
order by o.name;