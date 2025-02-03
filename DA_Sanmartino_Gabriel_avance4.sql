--########################## Avance 4 Proyecto integrador ##########################

--Preguntas para consultas :

/*		Listar todos los productos y sus categor�as

1: �C�mo puedo obtener una lista de todos los productos junto con sus categor�as? 

		
		Obtener empleados y su sucursal asignada:

2: �C�mo puedo saber a qu� sucursal est� asignado cada empleado?


		Identificar productos sin categor�a asignada:

3: �Existen productos que no tienen una categor�a asignada?


		Detalle completo de �rdenes:

4: �C�mo puedo obtener un detalle completo de las �rdenes, incluyendo el Nombre del cliente,
Nombre del empleado que tom� la orden, y Nombre del mensajero que la entreg�?


		Productos vendidos por sucursal:

5: �Cu�ntos art�culos correspondientes a cada Categor�a de Productos se han vendido en cada sucursal?*/



--RESOLUCIONES:

--1:�C�mo puedo obtener una lista de todos los productos junto con sus categor�as? 

USE FastFood_DB;

SELECT 
	P.Nombre AS [Nombre Producto],
	C.Nombre AS Categoria
FROM Productos AS P LEFT JOIN Categorias AS C
ON
	C.CategoriaID = P.CategoriaID;



--2: �C�mo puedo saber a qu� sucursal est� asignado cada empleado?

SELECT
	E.Nombre,
	S.Nombre AS NombreSucursal
FROM Empleados E JOIN Sucursales S
ON E.SucursalID = S.SucursalID;  

select * from Sucursales

--3: �Existen productos que no tienen una categor�a asignada?

SELECT
	P.ProductoID,
	P.Nombre,
	C.Nombre
FROM 
	Productos AS P 
LEFT JOIN Categorias AS C
	ON 
	P.CategoriaID = C.CategoriaID;


--Una alternativa para responder a la pregunta planteada:

SELECT Nombre
FROM Productos
WHERE CategoriaID IS NULL;



/*4: �C�mo puedo obtener un detalle completo de las �rdenes, incluyendo el Nombre del cliente,
Nombre del empleado que tom� la orden, y Nombre del mensajero que la entreg�? */

SELECT 
	O.OrdenID,
	C.Nombre AS Cliente,
	E.Nombre AS Vendedor,
	M.Nombre AS Mensajero,
	O.SucursalID,
	O.TipoPagoID,
	O.OrigenID,
	O.HorarioVenta,
	O.TotalCompra,
	O.KilometrosRecorrer,
	O.FechaDespacho,
	O.FechaEntrega,
	O.FechaOrdenTomada,
	O.FechaOrdenLista
FROM Ordenes O 
LEFT JOIN Clientes C
ON
	O.ClienteID = C.ClienteID 
LEFT JOIN Empleados E
ON
	O.EmpleadoID = E.EmpleadoID 
LEFT JOIN Mensajeros M
ON
	O.MensajeroID = M.MensajeroID;

--5: �Cu�ntos art�culos correspondientes a cada Categor�a de Productos se han vendido en cada sucursal?
--Dejamos "SELECTS" de cada tabla por si es necesario revisar alguna de ellas:
SELECT * FROM Ordenes;
SELECT * FROM Productos;
SELECT * FROM DetalleOrdenes;
SELECT * FROM Sucursales;
SELECT * FROM Categorias;

--Resolucion:
SELECT S.Nombre AS Sucursal, C.Nombre AS Categoria, SUM(D.Cantidad) AS Total
FROM DetalleOrdenes D
JOIN Ordenes O
	ON D.OrdenID = O.OrdenID
JOIN Productos P
	ON P.ProductoID = D.ProductoID
JOIN Categorias C
	ON C.CategoriaID = P.CategoriaID
JOIN Sucursales S
	ON S.SucursalID = O.SucursalID
GROUP BY S.Nombre, C.Nombre
ORDER BY Total;

--##########################--##########################--##########################--##########################--##########################

--------------------------------------------ENTREGA-------------------------------------------------------------------------------------------

/*
Eficiencia de los mensajeros: 

1�Cu�l es el tiempo promedio desde el despacho hasta la entrega 
de los pedidos gestionados por todo el equipo de mensajer�a? */

SELECT 
	MensajeroID,
	AVG(DATEPART(MINUTE, FechaDespacho) - DATEPART(MINUTE, FechaEntrega))  AS Minutos
FROM 
	Ordenes
GROUP BY
	MensajeroID;


--Una alternativa

SELECT
    AVG(DATEDIFF (MINUTE, fechadespacho, FechaEntrega)) AS TiempoPromedioEntegaDesdeELDespacho
FROM
    ordenes;

	--El tiempo promedio es de 30 minutos.


/*An�lisis de Ventas por Origen de Orden: 
2�Qu� canal de ventas genera m�s ingresos?*/

SELECT * FROM OrigenesOrden
SELECT * FROM Ordenes


--######
SELECT
	Origenes.Descripcion, 
	SUM(O.TotalCompra) AS Ingresos
FROM Ordenes O
LEFT JOIN OrigenesOrden Origenes
	ON O.OrigenID = Origenes.OrigenID
GROUP BY Origenes.Descripcion
ORDER BY Ingresos DESC;


/*Productividad de los Empleados: 
3�Cu�l es el nivel de ingreso generado por Empleado?*/
use FastFood_DB
SELECT 
	E.Nombre,
	SUM(O.TotalCompra) [Total Ingreso por Empleado],
	CASE
		WHEN SUM(O.TotalCompra) > 1000 THEN 'Alto'
		ELSE 'Bajo'
	END AS Nivel
FROM Ordenes O
JOIN Empleados E
	ON O.EmpleadoID = E.EmpleadoID
GROUP BY E.Nombre
ORDER BY [Total Ingreso por Empleado] DESC;



/*An�lisis de Demanda por Horario y D�a: 
4�C�mo var�a la demanda de productos a lo largo del d�a?
NOTA: Esta consulta no puede ser implementada sin una definici�n
clara del horario (ma�ana, tarde, noche) en la base de datos existente. 
Asumiremos que HorarioVenta refleja esta informaci�n correctamente.*/

SELECT * FROM Productos
SELECT * FROM Ordenes
SELECT * FROM DetalleOrdenes
-----------------------------------------------------------------
SELECT 
	O.HorarioVenta, 
	P.Nombre,
	SUM(D.Cantidad) CantidadProducto
FROM DetalleOrdenes D
JOIN Ordenes O
	ON D.OrdenID = O.OrdenID
JOIN Productos P
	ON D.ProductoID = P.ProductoID
GROUP BY O.HorarioVenta, P.Nombre
ORDER BY CantidadProducto DESC;



/*Comparaci�n de Ventas Mensuales: 

5�Cu�l es la tendencia de los ingresos generados en cada periodo mensual?*/

SELECT 
	DATEPART(MONTH, FechaOrdenTomada) AS Mes,
	SUM(TotalCompra) [Total Ingresos por  Mes]
FROM 
	Ordenes
GROUP BY FechaOrdenTomada
ORDER BY Mes ASC;

--Una alternativa:

SELECT YEAR(Ordenes.FechaOrdenTomada) AS A�oOrden,
    MONTH(Ordenes.FechaOrdenTomada) AS MesOrden, 
    SUM(TotalCompra) AS TotalIngresos
FROM Ordenes
GROUP BY YEAR(Ordenes.FechaOrdenTomada), MONTH(Ordenes.FechaOrdenTomada)
ORDER BY TotalIngresos DESC;

--Una alternativa que mediante OrdenID nos permite ordenar mes a mes:

SELECT 
	OrdenID,
    FORMAT(FechaOrdenTomada, 'MMMM yyyy') AS Mes, 
    SUM(TotalCompra) as IngresosGenerados
FROM 
    Ordenes
GROUP BY 
    OrdenID, FechaOrdenTomada
ORDER BY
     OrdenID ASC;

/*An�lisis de Fidelidad del Cliente: 
6�Qu� porcentaje de clientes son recurrentes versus nuevos clientes cada mes?
NOTA: La consulta se enfocar�a en la frecuencia de �rdenes por cliente para inferir la fidelidad.  */

--La siguiente query debe ejecutarse completa, desde la linea 257 a 287
WITH ClientePrimeraOrden AS (
    SELECT 
        ClienteID,
        MIN(MONTH(FechaOrdenTomada)) AS MesPrimeraOrden,
        MIN(YEAR(FechaOrdenTomada)) AS AnioPrimeraOrden
    FROM Ordenes
    GROUP BY ClienteID
),
ClientesPorMes AS (
    SELECT 
        MONTH(O.FechaOrdenTomada) AS Mes,
        YEAR(O.FechaOrdenTomada) AS Anio,
        O.ClienteID,
        CASE 
            WHEN CP.MesPrimeraOrden = MONTH(O.FechaOrdenTomada) 
                AND CP.AnioPrimeraOrden = YEAR(O.FechaOrdenTomada)
            THEN 'Nuevo'
            ELSE 'Recurrente'
        END AS TipoCliente
    FROM Ordenes AS O
    INNER JOIN ClientePrimeraOrden CP
        ON O.ClienteID = CP.ClienteID
)
SELECT 
    Mes,
    Anio,
    SUM(CASE WHEN TipoCliente = 'Nuevo' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS [Porcentaje Nuevos],
    SUM(CASE WHEN TipoCliente = 'Recurrente' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS [Porcentaje Recurrentes]
FROM ClientesPorMes
GROUP BY Mes, Anio
ORDER BY Anio, Mes;

--##########################--##########################--##########################--##########################--##########################


