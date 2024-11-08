-- consultas
-- Devuelve todos los datos del alumno más joven.  ======================1
use universidad_t2;
select * from alumno order by fecha_nacimiento desc limit 2;

-- Devuelve un listado con los profesores que no están asociados a un departamento.  ======================2
select * from profesor
where id_departamento is null;

-- Devuelve un listado con los departamentos que no tienen profesores asociados.  ======================3
select * from departamento where departamento.id 
not in (select  profesor.id_departamento from profesor);

-- Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.  ======================4
select P.*, A.nombre from profesor P
left join asignatura A on P.id = A.id_profesor where A.id_profesor is null;

-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.  ======================5
select * from asignatura where id_profesor is null;



-- Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.  ======================6



-- Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna   ======================7
-- asignatura en el Grado en Ingeniería Informática (Plan 2015).
 select * from departamento
 
 

-- Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores 
-- que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, 
-- primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor 
-- a mayor por el nombre del departamento, apellidos y el nombre.


-- Devuelve un listado con los profesores que no están asociados a un departamento.

-- Devuelve un listado con los departamentos que no tienen profesores asociados.
-- Devuelve un listado con los profesores que no imparten ninguna asignatura.
-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.

-- Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.