use AutoRental;

-- 25 CONSULTAS -------------------------------------------------------------------------------

-- 1. cuantos alquileres a tenido el cliente con el identidicador 10
SELECT COUNT(*) AS total_alquileres FROM alquiler WHERE Cliente_idcliente = 10;

-- 2. cuantos carros rojos hay
SELECT COUNT(*) AS total_carros_rojos FROM vehiculo WHERE color = 'Rojo';

-- 3. cuantos carros han salido de la sucursal '1 medellin' a la sucursal '4 barranquilla'
SELECT COUNT(*) AS total_carros FROM alquiler WHERE Sucursal_salida = 'Medellín' AND Sucursal_entrega = 'Barranquilla';

-- 4. cual ha sido el alquiler mas costoso
SELECT * FROM alquiler ORDER BY valor_cotizado DESC LIMIT 1;

-- 5. cual es el carro con mas alquileres
SELECT Vehiculo_idvehiculo, COUNT(*) AS total_alquileres FROM alquiler GROUP BY Vehiculo_idvehiculo ORDER BY total_alquileres DESC LIMIT 1;

-- 6. devuelve las fechas en las que se alquilo el vehiculo con id 10
SELECT Fecha_salida, Fecha_esperada, Fecha_entrega FROM alquiler WHERE Vehiculo_idvehiculo = 10;

-- 7. cuel es la sucursal con mas alquileres
SELECT Sucursal_salida, COUNT(*) AS total_alquileres FROM alquiler GROUP BY Sucursal_salida ORDER BY total_alquileres DESC LIMIT 1;

-- 8. cual es el mes con más alquileres
SELECT MONTH(Fecha_salida) AS mes, COUNT(*) AS total_alquileres FROM alquiler GROUP BY mes ORDER BY total_alquileres DESC LIMIT 1;

-- 9. cuantas veces un cliente a alquilado el mismo vehiculo
SELECT Cliente_idcliente, Vehiculo_idvehiculo, COUNT(*) AS total_alquileres FROM alquiler
GROUP BY Cliente_idcliente, Vehiculo_idvehiculo HAVING COUNT(*) > 1;

-- 10.  cual es el venderor que mas alquileres a registrado 
SELECT Empleado_idempleado, COUNT(*) AS total_alquileres FROM alquiler
GROUP BY Empleado_idempleado ORDER BY total_alquileres DESC LIMIT 1;

-- 11. cuantos alquileres se han registrado en la sucursal de medellin
SELECT COUNT(*) AS total_alquileres FROM alquiler
WHERE Sucursal_salida = 'Medellín';

-- 12. devuelve el total de ingresos por alquiler
SELECT SUM(valor_cotizado) AS total_ingresos FROM alquiler;

-- 13. Listar todos los vehículos que nunca han sido alquilados
SELECT v.idvehiculo FROM vehiculo v
LEFT JOIN alquiler a ON v.idvehiculo = a.Vehiculo_idvehiculo WHERE a.Vehiculo_idvehiculo IS NULL;

-- 14. Calcular el promedio de días de alquiler por vehículo
SELECT Vehiculo_idvehiculo, AVG(DATEDIFF(Fecha_entrega, Fecha_salida)) AS promedio_dias
FROM alquiler GROUP BY Vehiculo_idvehiculo;

-- 15. vehículo con el mayor ingreso total
SELECT Vehiculo_idvehiculo, SUM(valor_cotizado) AS total_ingresos FROM alquiler
GROUP BY Vehiculo_idvehiculo ORDER BY total_ingresos DESC LIMIT 1;

-- 16. empleados que han registrado alquileres en más de una sucursal
SELECT Empleado_idempleado, COUNT(DISTINCT Sucursal_salida) AS total_sucursales FROM alquiler
GROUP BY Empleado_idempleado HAVING total_sucursales > 1;

-- 17. total de descuentos aplicados en los alquileres
SELECT SUM(descuento) AS total_descuentos FROM alquiler;

-- 18. cliente que ha pagado más en alquileres
SELECT Cliente_idcliente, SUM(valor_pagado) AS total_pagado FROM alquiler
GROUP BY Cliente_idcliente ORDER BY total_pagado DESC LIMIT 1;

-- 19. vehículos que han sido alquilados en más de una sucursal:
SELECT Vehiculo_idvehiculo, COUNT(DISTINCT Sucursal_salida) AS total_sucursales FROM alquiler
GROUP BY Vehiculo_idvehiculo HAVING total_sucursales > 1;

-- 20. alquileres con una duración superior a 7 días
SELECT * FROM alquiler WHERE DATEDIFF(Fecha_entrega, Fecha_salida) > 7;

-- 21. vehículos que han sido alquilados en el último año
SELECT DISTINCT Vehiculo_idvehiculo FROM alquiler
WHERE Fecha_salida >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 22. promedio de días que un vehículo ha estado alquilado
SELECT AVG(DATEDIFF(Fecha_entrega, Fecha_salida)) AS promedio_dias_alquilado FROM alquiler;

-- 23. vehículos que han sido alquilados en los últimos seis meses
SELECT DISTINCT Vehiculo_idvehiculo FROM alquiler
WHERE Fecha_salida >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 24. fechas con el menor número de alquileres
SELECT Fecha_salida, COUNT(*) AS total_alquileres FROM alquiler
GROUP BY Fecha_salida ORDER BY total_alquileres ASC LIMIT 1;

-- 25. lista de todos los empleados y cuántos alquileres han registrado
SELECT Empleado_idempleado, COUNT(*) AS total_alquileres
FROM alquiler GROUP BY Empleado_idempleado;

-- 5 FUNCIONES -------------------------------------------------------------------------------

-- 1. Calcula el total de ingresos generados por una sucursal en especial.

DELIMITER //
CREATE FUNCTION TotalIngresosSucursal(sucursal VARCHAR(45))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_ingresos DECIMAL(10, 2);
    SELECT SUM(valor_cotizado - descuento) INTO total_ingresos
    FROM alquiler
    WHERE Sucursal_salida = sucursal;
    RETURN total_ingresos;
END //
DELIMITER ;


-- 2. Calcular el promedio de días de alquiler de un vehículo específico.
DELIMITER //

CREATE FUNCTION PromedioDiasAlquilerVehiculo(vehiculo_id INT)
RETURNS DECIMAL(10, 2)
deterministic
BEGIN
    DECLARE promedio_dias DECIMAL(10, 2);
    SELECT AVG(DATEDIFF(Fecha_entrega, Fecha_salida)) INTO promedio_dias
    FROM alquiler
    WHERE Vehiculo_idvehiculo = vehiculo_id;
    RETURN promedio_dias;
END //

DELIMITER ;


-- 3. Devuelve el cliente que ha pagado más en alquileres.
DELIMITER //

CREATE FUNCTION ClienteMaximoPagado()
RETURNS INT
deterministic
BEGIN
    DECLARE cliente_id INT;
    SELECT Cliente_idcliente INTO cliente_id
    FROM alquiler
    GROUP BY Cliente_idcliente
    ORDER BY SUM(valor_pagado) DESC
    LIMIT 1;
    RETURN cliente_id;
END //

DELIMITER ;

-- 4. Calcula el total de descuentos aplicados en un mes específico

DELIMITER //
CREATE FUNCTION TotalDescuentosMes(mes INT)
RETURNS DECIMAL (10, 2)
deterministic
BEGIN 
	DECLARE total_descuentos DECIMAL (10, 2);
	SELECT SUM(descuento) INTO total_descuentos 
	FROM alquiler 
	WHERE MONTH(Fecha_salida) = mes; 
	RETURN total_descuentos;
END // 
DELIMITER ;

-- 5. Cuenta cuántos alquileres ha realizado un cliente específico en un año determinado
DELIMITER //

CREATE FUNCTION AlquileresClienteAnio(cliente_id INT, anio INT)
RETURNS INT
deterministic
BEGIN
    DECLARE total_alquileres INT;
    SELECT COUNT(*) INTO total_alquileres
    FROM alquiler
    WHERE Cliente_idcliente = cliente_id AND YEAR(Fecha_salida) = anio;
    RETURN total_alquileres;
END //

DELIMITER ;

