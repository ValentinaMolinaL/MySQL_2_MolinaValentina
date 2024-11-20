-- drop database autorental;
create database AutoRental; 

use AutoRental;

create table sucursal (
idsucursal INT AUTO_INCREMENT PRIMARY KEY,
ciudad VARCHAR (45) NOT NULL,
direccion VARCHAR (45) NOT NULL,
telefono_fijo VARCHAR (45) NOT NULL,
cellular VARCHAR (45) NOT NULL,
email VARCHAR (45) NOT NULL
);

create table empleado (
idempleado INT AUTO_INCREMENT PRIMARY KEY,
cedula VARCHAR(45) NOT NULL,
nombre1 VARCHAR (45) NOT NULL,
nombre2 VARCHAR (45) NOT NULL,
apellido1 VARCHAR (45) NOT NULL,
apellido2 VARCHAR (45) NOT NULL,
ciudad VARCHAR (45) NOT NULL,
direccion VARCHAR (45) NOT NULL,
email VARCHAR (45) NOT NULL,
sucursal_idsucursal INT NOT NULL,
Foreign Key (sucursal_idsucursal) REFERENCES sucursal(idsucursal)
);

create table cliente (
idcliente INT AUTO_INCREMENT PRIMARY KEY,
cedula VARCHAR(45) NOT NULL,
nombre1 VARCHAR(45) NOT NULL,
nombre2 VARCHAR (45) NOT NULL,
apellido1 VARCHAR (45) NOT NULL,
apellido2 VARCHAR (45) NOT NULL,
cuidad VARCHAR (45) NOT NULL,
dirección VARCHAR (45) NOT NULL,
celular VARCHAR (45) NOT NULL,
email VARCHAR (45) NOT NULL
);

create table vehiculo (
idvehiculo INT AUTO_INCREMENT PRIMARY KEY,
placa VARCHAR(45) NOT NULL,
modelo VARCHAR(45) NOT NULL,
motor VARCHAR (45) NOT NULL,
color VARCHAR (45) NOT NULL,
capacidad VARCHAR (45) NOT NULL,
puertas VARCHAR (45) NOT NULL,
tipo_vehiculo VARCHAR (45) NOT NULL,
suroof VARCHAR (45) NOT NULL,
referencia VARCHAR (45) NOT NULL
);

create table alquiler ( 
idalquiler INT AUTO_INCREMENT PRIMARY KEY, 
Fecha_salida DATE NOT NULL, 
Fecha_esperada DATE NOT NULL, 
Fecha_entrega DATE NOT NULL, 
Sucursal_salida VARCHAR (45) NOT NULL, 
Sucursal_entrega VARCHAR (45) NOT NULL, 
valor_dia DECIMAL NOT NULL, 
valor_semanal DECIMAL NOT NULL, 
valor_cotizado DECIMAL NOT NULL, 
descuento DECIMAL NOT NULL, 
valor_pagado DECIMAL NOT NULL, 
sucursal_idsucursal INT NOT NULL, Foreign Key 
(sucursal_idsucursal) REFERENCES sucursal(idsucursal), 
Cliente_idcliente INT NOT NULL, 
Foreign Key (Cliente_idcliente) REFERENCES Cliente (idcliente), 
Vehiculo_idvehiculo INT NOT NULL, 
Foreign Key (Vehiculo_idvehiculo) REFERENCES Vehiculo (idvehiculo), 
Empleado_idempleado INT NOT NULL, 
Foreign Key (Empleado_idempleado) REFERENCES Empleado(idempleado) 
);

SHOW TABLES;