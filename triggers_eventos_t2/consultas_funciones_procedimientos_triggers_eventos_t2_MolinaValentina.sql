-- CONSULTAS SIMPLES

-- 1. listar todos los paises
select * from countries;

-- 2. Obtener todos los departamentos
select * from departments;

-- 3. Mostrar el titulo y salario minimo de todos los trabajos.
select job_title, min_salary from jobs;

-- 4. lista de dependientes juntos
-- con los datos de los empleados a los que esten asociados´0
select * from dependents d 
join employees e
on d.employee_id = e.employee_id;

-- 5. Salario promedio por departamento y cuidad

-- ejemplo profe
select d.department_name,
l.city,
avg(e.salary) as avg_salary
from departments d
join employees e on d.department_id = e.department_id
join locations l on d.location_id = l.location_id
group by d.department_name, l.city
order by avg_salary desc;

-- ejemplo jaime
select department_id, 
job_id, 
avg(salary) as salary_average 
from employees
group by department_id, job_id
order by department_id, job_id;


-- 6. lista de empleados con su trabajo, departamento y ubicación alter

-- ejemplo luis Henao
select e.first_name,e.last_name,j.job_title,d.department_name,l.street_address from jobs j 
inner join employees e on e.job_id=j.job_id 
inner join departments d  on e.department_id=d.department_id
inner join locations l on d.location_id=l.location_id ;

-- ejemplo profe pedro
select e.first_name as employee_name,
e.last_name as employee_last_name,
j.job_title,
d.department_name,
l.city as location_city
from employees e join jobs j on e.job_id=j.job_id
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;


-- FUNCIONES 

select country_name from countries where country_id='US';
-- 1. Obtener el nombre de un pais por su ID -------------------
DELIMITER //
create function obtenerPais_Nombre (country_id_i char(2))
returns varchar(50) deterministic
begin
declare country_name_r varchar(50);
select country_name into country_name_r from countries
where country_id=country_id_i;
return country_name_r;
end //
DELIMITER ;

select obtenerPais_Nombre('US');


-- PROCEDIMIENTO 
-- 1.Insertar una nueva region 
-- insertaremos la siguiente insercion 
-- insert into regions(region_name) values("Africa");
DELIMITER //
create procedure insertarRegion (in nombre_region varchar(50)) begin
insert into regions (region_name) values (nombre_region);
end
// DELIMITER ;
call insertarRegion ("Africa");
select * from regions;

