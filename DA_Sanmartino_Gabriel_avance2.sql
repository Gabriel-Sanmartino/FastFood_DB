--########################## Avance 2 Proyecto integrador ##########################

--Seleccionamos FastFood_DB
USE FastFood_DB
-- Insertar datos en Categorias
INSERT INTO Categorias (Nombre) VALUES
('Comida Rápida'), ('Postres'), ('Bebidas'), ('Ensaladas'), ('Desayunos'),
('Cafetería'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');

Select * from Categorias

-- Insertar datos en Productos
INSERT INTO Productos (Nombre, CategoriaID, Precio) VALUES
('Hamburguesa Deluxe', 1, 9.99), ('Cheeseburger', 1, 7.99), ('Pizza Margarita', 10, 11.99), ('Pizza Pepperoni', 10, 12.99), ('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), ('Ensalada César', 4, 5.99), ('Ensalada Griega', 4, 6.99), ('Pastel de Zanahoria', 2, 3.99), ('Brownie', 2, 2.99);

Select * from Productos

-- Insertar datos en Sucursales
INSERT INTO Sucursales (Nombre, Direccion) VALUES
('Sucursal Central', '1234 Main St'), ('Sucursal Norte', '5678 North St'), ('Sucursal Este', '9101 East St'), ('Sucursal Oeste', '1121 West St'), ('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), ('Sucursal Montaña', '1718 Mountain St'), ('Sucursal Valle', '1920 Valley St'), ('Sucursal Lago', '2122 Lake St'), ('Sucursal Bosque', '2324 Forest St');

Select * from Sucursales

-- Insertar datos en Empleados
INSERT INTO Empleados (Nombre, Posicion, Departamento, SucursalID, Rol) VALUES
('John Doe', 'Gerente', 'Administración', 1, 'Vendedor'), ('Jane Smith', 'Subgerente', 'Ventas', 1, 'Vendedor'), ('Bill Jones', 'Cajero', 'Ventas', 1, 'Vendedor'), ('Alice Johnson', 'Cocinero', 'Cocina', 1, 'Vendedor'), ('Tom Brown', 'Barista', 'Cafetería', 1, 'Vendedor'),
('Emma Davis', 'Repartidor', 'Logística', 1, 'Mensajero'), ('Lucas Miller', 'Atención al Cliente', 'Servicio', 1, 'Vendedor'), ('Olivia García', 'Encargado de Turno', 'Administración', 1, 'Vendedor'), ('Ethan Martinez', 'Mesero', 'Restaurante', 1, 'Vendedor'), ('Sophia Rodriguez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');

Select * from Empleados

-- Insertar datos en Clientes
INSERT INTO Clientes (Nombre, Direccion) VALUES
('Cliente Uno', '1000 A Street'), ('Cliente Dos', '1001 B Street'), ('Cliente Tres', '1002 C Street'), ('Cliente Cuatro', '1003 D Street'), ('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), ('Cliente Siete', '1006 G Street'), ('Cliente Ocho', '1007 H Street'), ('Cliente Nueve', '1008 I Street'), ('Cliente Diez', '1009 J Street');

Select * from Clientes

-- Insertar datos en OrigenesOrden
INSERT INTO OrigenesOrden (Descripcion) VALUES
('En línea'), ('Presencial'), ('Teléfono'), ('Drive Thru'), ('App Móvil'),
('Redes Sociales'), ('Correo Electrónico'), ('Publicidad'), ('Recomendación'), ('Evento');

Select * from OrigenesOrden

-- Insertar datos en TiposPago
INSERT INTO TiposPago (Descripcion) VALUES
('Efectivo'), ('Tarjeta de Crédito'), ('Tarjeta de Débito'), ('PayPal'), ('Transferencia Bancaria'),
('Criptomonedas'), ('Cheque'), ('Vale de Comida'), ('Cupón de Descuento'), ('Pago Móvil');

Select * from TiposPago

-- Insertar datos en Mensajeros
INSERT INTO Mensajeros (Nombre, EsExterno) VALUES
('Mensajero Uno', 0), ('Mensajero Dos', 1), ('Mensajero Tres', 0), ('Mensajero Cuatro', 1), ('Mensajero Cinco', 0),
('Mensajero Seis', 1), ('Mensajero Siete', 0), ('Mensajero Ocho', 1), ('Mensajero Nueve', 0), ('Mensajero Diez', 1);

Select * from Mensajeros

-- Insertar datos en Ordenes
INSERT INTO Ordenes (ClienteID, EmpleadoID, SucursalID, MensajeroID, TipoPagoID, OrigenID, HorarioVenta, TotalCompra, KilometrosRecorrer, FechaDespacho, FechaEntrega, FechaOrdenTomada, FechaOrdenLista) VALUES
(1, 1, 1, 1, 1, 1, 'Mañana', 1053.51, 5.5, '10-01-2023 08:30:00', '10-01-2023 09:00:00', '10-01-2023 08:00:00', '10-01-2023 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '15-02-2023 14:30:00', '15-02-2023 15:00:00', '15-02-2023 13:30:00', '15-02-2023 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '20-03-2023 19:30:00', '20-03-2023 20:00:00', '20-03-2023 19:00:00', '20-03-2023 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Mañana', 930.00, 0.5, '25-04-2023 09:30:00', '25-04-2023 10:00:00', '25-04-2023 09:00:00', '25-04-2023 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 955.00, 8.0, '30-05-2023 15:30:00', '30-05-2023 16:00:00', '30-05-2023 15:00:00', '30-05-2023 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 945.00, 12.5, '05-06-2023 20:30:00', '05-06-2023 21:00:00', '05-06-2023 20:00:00', '05-06-2023 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Mañana', 1065.00, 7.5, '10-07-2023 08:30:00', '10-07-2023 09:00:00', '10-07-2023 08:00:00', '10-07-2023 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 1085.00, 9.5, '15-08-2023 14:30:00', '15-08-2023 15:00:00', '15-08-2023 14:00:00', '15-08-2023 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 1095.00, 3.0, '20-09-2023 19:30:00', '20-09-2023 20:00:00', '20-09-2023 19:00:00', '20-09-2023 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Mañana', 900.00, 15.0, '25-10-2023 09:30:00', '25-10-2023 10:00:00', '25-10-2023 09:00:00', '25-10-2023 09:15:00');

Select * from Ordenes

-- Insertar datos en DetalleOrdenes
INSERT INTO DetalleOrdenes (OrdenID, ProductoID, Cantidad, Precio) VALUES
(1, 1, 3, 23.44),
(1, 2, 5, 45.14),
(1, 3, 4, 46.37),
(1, 4, 4, 42.34),
(1, 5, 1, 18.25),
(1, 6, 4, 20.08),
(1, 7, 2, 13.31),
(1, 8, 2, 20.96),
(1, 9, 4, 30.13),
(1, 10, 3, 38.34);

Select * from DetalleOrdenes

--UPDATE Y DELETE

--ACTUALIZACIONES DE EJEMPLO (UPDATE)

-- Aumentar el precio de todos los productos en la categoría 1
UPDATE Productos 
SET Precio = Precio + 1 
WHERE CategoriaID = 1;

-- Cambiar la posición de todos los empleados del departamento 'Cocina' a 'Chef'
UPDATE Empleados 
SET Posicion = 'Chef' 
WHERE Departamento = 'Cocina';

-- Actualizar la dirección de una sucursal específica
UPDATE Sucursales 
SET Direccion = '1234 New Address St' 
WHERE SucursalID = 1;

--ELIMINACIONES DE EJEMPLO (DELETE)

/*1. Eliminar una orden específica
Imaginemos que quieres eliminar una orden específica, 
por ejemplo, la orden con OrdenID = 10. 
Esta operación eliminaría la orden junto con sus detalles asociados 
(deberías asegurarte de eliminar o actualizar cualquier dato relacionado 
para mantener la integridad referencial).*/

DELETE FROM DetalleOrdenes 
WHERE OrdenID = 10;

DELETE FROM Ordenes 
WHERE OrdenID = 10;

/*2. Eliminar todos los productos de una categoría específica
Si decides dejar de ofrecer todos los "Postres" 
(supongamos que Categorias.CategoriaID = 2 para "Postres"), 
podrías querer eliminar todos los productos asociados a esa categoría.*/

DELETE FROM Productos 
WHERE CategoriaID = 2;

--Antes de ejecutar este comando, deberías considerar si hay órdenes que incluyen estos productos y decidir cómo manejar esas referencias.

/*3. Eliminar empleados de una sucursal que cerró
Si una sucursal cierra, por ejemplo, 
SucursalID = 10 (Sucursal Bosque), 
podrías necesitar eliminar a todos los empleados asociados con esa sucursal.*/

DELETE FROM Empleados
WHERE SucursalID = 10;

--########################## Respondiendo preguntas de negocio simples ##########################

--Seleccion base de datos

USE FastFood_DB;

--Preguntas de negocio simples a responder:

--1¿Cuál es la cantidad total de registros únicos en la tabla de órdenes?
--2¿Cuántos empleados existen en cada departamento?
--3¿Cuántos productos hay por código de categoría?
--4¿Cuántos clientes se han importado a la tabla de clientes?
/*5¿Cuáles son las sucursales con un promedio de Facturación/Ingresos 
superior a 1000.00 y que minimizan sus costos en base al promedio de 
kilómetros recorridos de todas de sus entregas gestionadas? Para un 
mejor relevamiento, ordene el listado por el Promedio Km Recorridos.*/

--1:¿Cuál es la cantidad total de registros únicos en la tabla de órdenes?

SELECT COUNT (OrdenID) AS RegistrosUnicos
FROM Ordenes;

--La cantidad total de registro unicos es: 9

/*Mediante "SELECT" seleccionamos la funcion "COUNT" la cual
nos permitira realizar un recuento de todos los registros de la columna
que nosotros indiquemos, para este caso es valido ya que trabajaremos con 
"OrdenID", dicha columna por ser PK solo contiene registros unicos.
Luego utilizamos "AS" para colocar un alias a la columna que retornara nuestra
consulta, a continuacion, con "FROM" indicamos de donde seleccionara*/

/*Sin embargo si no trabajasemos con un PK, no podriamos
utilizar la funcion "COUNT", ya que esta cuenta todos los registros,
sin importar si son unicos o no, en este caso podemos utilizar 
"DISTINCT", veamoslo a continuacion*/

SELECT DISTINCT COUNT(OrdenID) AS RegistrosUnicos
FROM Ordenes;

--2:¿Cuántos empleados existen en cada departamento?

SELECT Departamento, COUNT(EmpleadoID) AS CantidadEmpleadosPorDpto
FROM Empleados
GROUP BY Departamento;

--Los departamentos de "Administracion y ventas" cuentan con 2 empleados cada uno.
--El resto de los departamentos esta formado cada uno por un (1) empleado solamente.

--3:¿Cuántos productos hay por código de categoría?

SELECT CategoriaID, COUNT(ProductoID) AS CantidadProductosPorCodigoCategoria
FROM Productos
GROUP BY CategoriaID;

--Por codigo de categoria hay 2 productos

--4:¿Cuántos clientes se han importado a la tabla de clientes?

select count(ClienteID) AS ClientesImportados from Clientes 

--Se han importado 10 clientes a la tabla "Clientes"

/*5:¿Cuáles son las sucursales con un promedio de Facturación/Ingresos 
superior a 1000.00 y que minimizan sus costos en base al promedio de 
kilómetros recorridos de todas de sus entregas gestionadas? Para un 
mejor relevamiento, ordene el listado por el Promedio Km Recorridos.*/

SELECT 
	SucursalID, 
	AVG(TotalCompra) AS PromedioFacturacion,
	AVG(KilometrosRecorrer) AS PromedioKmsRecorridos
FROM Ordenes
GROUP BY SucursalID
HAVING AVG(TotalCompra) > 1000
ORDER BY PromedioKmsRecorridos ASC;

--Las sucursales con promedio de facturacion superior a 1000 son las siguientes:
-- 1, 2, 7, 8 y 9
--La sucursal nueve genero el mayor monto de ventas con la minima cantidad de Kms recorridos.

--##########################--##########################--##########################--##########################--##########################

