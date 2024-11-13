use ejercicio_funciones_t2;
-- Consultas sobre una tabla

-- 1. Lista el primer apellido de todos los empleados.
select apellido1 from empleado;

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
select distinct apellido1 from empleado;

-- 3. Lista todas las columnas de la tabla empleado.
select * from empleado;

-- 4. Lista el nombre y los apellidos de todos los empleados.
select nombre,apellido1,apellido2 from empleado;

-- 5. Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.
select id_departamento from empleado;

-- 6. Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los identificadores que aparecen repetidos.
select distinct id_departamento from empleado;

-- 7. Lista el nombre y apellidos de los empleados en una única columna.
select concat_ws('',nombre, ' ', apellido1, ' ',apellido2) as nombre_completo from empleado;

-- 8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
select upper(concat_ws('',nombre, ' ', apellido1, ' ',apellido2)) as nombre_completo from empleado;

-- 9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
select lower(concat_ws('',nombre, ' ', apellido1, ' ',apellido2)) as nombre_completo from empleado;

-- 10. Lista el identificador de los empleados junto al nif, pero el nif deberá
-- aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
select id, substring(nif, 1, 8) as Nif_Números, substring(nif, 9, 1) as Nif_Carácter from empleado;

-- 11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. 
-- Para calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) 
-- los gastos que se han generado (columna gastos). Tenga en cuenta que en algunos casos pueden existir
-- valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.
select nombre, (presupuesto - gastos)  as Presupuesto_Actual  from departamento;

-- 12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
select nombre, presupuesto from departamento order by 2 asc;

-- 13. Lista el nombre de todos los departamentos ordenados de forma ascendente.
select nombre from departamento order by 1 asc;

-- 14. Lista el nombre de todos los departamentos ordenados de forma descendente.
select nombre from departamento order by 1 desc;

-- 15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma
-- alfabética teniendo en cuenta en primer lugar sus apellidos y luego su nombre.
select apellido1, apellido2, nombre from empleado order by 1 asc;

-- 16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
select nombre, presupuesto from departamento order by 2 desc limit 3;

-- 17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
select nombre, presupuesto from departamento order by 2 asc limit 3;

-- 18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
select nombre, gastos from departamento order by 2 desc limit 2;

-- 19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
select nombre, gastos from departamento order by 2 asc limit 2;

-- 20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila
-- se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
select * from empleado limit 2,5;

-- 21. Devuelve una lista con el nombre de los departamentos y el presupuesto, de
-- aquellos que tienen un presupuesto mayor o igual a 150000 euros.
select nombre, presupuesto from departamento where presupuesto >= 150000;

-- 22. Devuelve una lista con el nombre de los departamentos y el gasto, de
-- aquellos que tienen menos de 5000 euros de gastos.
select nombre, gastos from departamento where gastos < 5000;

-- 23. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen
-- un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto > 100000 and presupuesto <  200000;

-- 24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto 
-- entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto < 100000 or presupuesto >  200000;

-- 25. Devuelve una lista con el nombre de los departamentos que tienen un
-- presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto between 100000 and 200000;

-- 26. Devuelve una lista con el nombre de los departamentos que no tienen un
-- presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto not between 100000 and 200000;

-- 27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, 
-- de aquellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
select nombre, gastos, presupuesto from departamento where gastos > presupuesto;

-- 28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, 
-- de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
select nombre, gastos, presupuesto from departamento where gastos < presupuesto;

-- 29. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de 
-- aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
select nombre, gastos, presupuesto from departamento where gastos = presupuesto;

-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
select * from empleado where apellido2 is NULL;

-- 31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
select * from empleado where apellido2 is not NULL;

-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea López.
select * from empleado where apellido2 = 'López';

-- 33. Lista todos los datos de los empleados cuyo segundo apellido
-- sea Díaz o Moreno. Sin utilizar el operador IN.
select * from empleado where apellido2 = 'Díaz' or apellido2 = 'Moreno';

-- 34. Lista todos los datos de los empleados cuyo segundo apellido
-- sea Díaz o Moreno. Utilizando el operador IN.
select * from empleado where apellido2 in  ('Díaz', 'Moreno');

-- 35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
select nombre, apellido1, apellido2, nif from empleado where id_departamento = 3;

-- 36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
select nombre, apellido1, apellido2, nif from empleado where id_departamento in (2, 4, 5);


-- CONSULTAS MULTITABLA (COMPASICION INTERNA)

-- 1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select e.nombre, e.apellido1, e.apellido2, e.id_departamento, d.id, d.nombre from empleado e
inner join departamento d on e.id_departamento = d.id;

-- 2. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
-- Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en 
-- segundo lugar por los apellidos y el nombre de los empleados.
select e.nombre, e.apellido1, e.apellido2, e.id_departamento, d.id, d.nombre from empleado e
inner join departamento d on e.id_departamento = d.id order by 6 asc;


-- 3. Devuelve un listado con el identificador y el nombre del departamento,
-- solamente de aquellos departamentos que tienen empleados.
select e.id, d.nombre from empleado e inner join departamento d on e.id_departamento = d.id;
select * from empleado;

-- 4. Devuelve un listado con el identificador, el nombre del departamento y el
-- valor del presupuesto actual del que dispone, solamente de aquellos departamentos que tienen empleados.
-- El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial
-- (columna presupuesto) el valor de los gastos que ha generado (columna gastos).
select d.id, d.nombre, (d.presupuesto - d.gastos)  as Presupuesto_Actual, e.id_departamento, e.nombre, e.apellido1, e.apellido2,
e.id_departamento from departamento d inner join empleado e on d.id = e.id_departamento;

-- 5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
select * from empleado e inner join departamento d on e.id_departamento = d.id where e.nif = '38382980M';

-- 6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
select d.nombre from departamento d inner join empleado e on e.id_departamento = d.id where e.nombre = 'Pepe';

-- 7. Devuelve un listado con los datos de los empleados que trabajan en el
-- departamento de I+D. Ordena el resultado alfabéticamente.
select e.*, d.nombre from empleado e inner join departamento d on e.id_departamento = d.id where d.nombre = 'I+D';

-- 8. Devuelve un listado con los datos de los empleados que trabajan en el
-- departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
select e.*, d.nombre from empleado e inner join departamento d on e.id_departamento = d.id 
where d.nombre = 'I+D' or d.nombre = 'Sistemas' or d.nombre = 'Contabilidad' order by 2 asc;

-- 9. Devuelve una lista con el nombre de los empleados que tienen los
-- departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
select empleado.nombre, departamento.id as id_departamento, departamento.presupuesto from empleado
inner join departamento on departamento.id = empleado.id_departamento where departamento.presupuesto not between 100000 and 200000;


-- 10. Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea (NULL). Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos
select departamento.nombre from departamento
inner join empleado on empleado.id_departamento = departamento.id where empleado.apellido2 is null;

-- CONSULTAS MULTITABLAS (COMPOSICIÓN EXTERNA)
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
-- Este listado también debe incluir los empleados que no tienen ningún departamento asociado.
select concat_ws('', empleado.nombre, ' ', empleado.apellido1, ' ', empleado.apellido2) as nombre_completo,
departamento.id as id_departamento, departamento.nombre as nombre_departamento, departamento.presupuesto, departamento.gastos from empleado 
left join departamento on empleado.id_departamento = departamento.id;

-- 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
select * from empleado 
left join departamento on empleado.id_departamento 

-- 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.

-- 4. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
-- El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no tienen
-- ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

-- 5. Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no 
-- tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
Consultas resumen
1. Calcula la suma del presupuesto de todos los departamentos.
2. Calcula la media del presupuesto de todos los departamentos.
3. Calcula el valor mínimo del presupuesto de todos los departamentos.
4. Calcula el nombre del departamento y el presupuesto que tiene asignado,
del departamento con menor presupuesto.
5. Calcula el valor máximo del presupuesto de todos los departamentos.
6. Calcula el nombre del departamento y el presupuesto que tiene asignado,
del departamento con mayor presupuesto.
7. Calcula el número total de empleados que hay en la tabla empleado.
8. Calcula el número de empleados que no tienen NULL en su segundo
apellido.
9. Calcula el número de empleados que hay en cada departamento. Tienes que
devolver dos columnas, una con el nombre del departamento y otra con el
número de empleados que tiene asignados.
10. Calcula el nombre de los departamentos que tienen más de 2 empleados. El
resultado debe tener dos columnas, una con el nombre del departamento y
otra con el número de empleados que tiene asignados.
11. Calcula el número de empleados que trabajan en cada uno de los
departamentos. El resultado de esta consulta también tiene que incluir
aquellos departamentos que no tienen ningún empleado asociado.
12. Calcula el número de empleados que trabajan en cada unos de los
departamentos que tienen un presupuesto mayor a 200000 euros.*/