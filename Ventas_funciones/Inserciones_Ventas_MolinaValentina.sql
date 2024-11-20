USE ventas;

INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES
(1, 'Carlos', 'Martínez', 'González', 'Madrid', 100),
(2, 'Lucía', 'Pérez', 'Fernández', 'Barcelona', 200),
(3, 'Ricardo', 'Gómez', 'López', 'Valencia', NULL),
(4, 'Ana', 'Díaz', 'Sánchez', 'Sevilla', 300),
(5, 'Sofía', 'Ramírez', 'Moreno', 'Zaragoza', 200),
(6, 'Juan', 'López', 'García', 'Bilbao', 100),
(7, 'Beatriz', 'González', 'Rodríguez', 'Málaga', 300),
(8, 'David', 'Martínez', 'Hernández', 'Alicante', 200),
(9, 'Pedro', 'Ruiz', 'Santos', 'Palma de Mallorca', 225),
(10, 'Laura', 'Vázquez', 'Pérez', 'Murcia', 125);

INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES
(1, 'Antonio', 'Vega', 'Pérez', 0.18),
(2, 'Isabel', 'Moreno', 'Sánchez', 0.15),
(3, 'Javier', 'Fernández', 'Martín', 0.14),
(4, 'Elena', 'Hernández', 'Díaz', 0.13),
(5, 'Ricardo', 'Martínez', 'Gómez', 0.12),
(6, 'Laura', 'Sánchez', 'López', 0.10),
(7, 'Marta', 'Rodríguez', 'García', 0.11),
(8, 'Francisco', 'Gómez', 'Ruiz', 0.09);

INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES
(1, 350.75, '2024-02-15', 5, 2),
(2, 1200.50, '2024-03-01', 1, 5),
(3, 530.10, '2024-01-22', 2, 1),
(4, 800.20, '2023-12-14', 8, 3),
(5, 5000.00, '2023-11-30', 5, 2),
(6, 2200.99, '2023-10-25', 7, 1),
(7, 6000.50, '2023-09-10', 2, 1),
(8, 1900.30, '2023-08-21', 4, 6),
(9, 2300.45, '2023-07-10', 8, 3),
(10, 280.95, '2023-06-15', 8, 2),
(11, 150.60, '2023-05-17', 3, 7),
(12, 2500.99, '2024-04-05', 2, 1),
(13, 550.80, '2023-11-18', 6, 1),
(14, 135.75, '2023-10-25', 6, 1),
(15, 480.45, '2024-05-12', 1, 5),
(16, 1200.60, '2024-06-03', 1, 5);