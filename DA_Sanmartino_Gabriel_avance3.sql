--########################## Avance 3 Proyecto integrador ##########################

--Consultas con funciones de agregacion:

	--Preguntas para consulta:

--1:¿Cuál es el total de ventas (TotalCompra) a nivel global?
--2¿Cuál es el precio promedio de los productos dentro de cada categoría?
--3:¿Cuál es el valor de la orden mínima y máxima por cada sucursal?
--4:¿Cuál es el mayor número de kilómetros recorridos para una entrega?
--5:¿Cuál es la cantidad promedio de productos por orden?
--6:¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?
--7:¿Cuál Sucursal tiene el ingreso promedio más alto?
--8:¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?
--9:¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?
/*10:¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de 
ventas, cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo 
alcanzado por una orden en dicha jornada?*/

--Seleccionamos nuestra base de datos

USE FastFood_DB;

--1:¿Cuál es el total de ventas (TotalCompra) a nivel global?

SELECT SUM(TotalCompra) AS TotalVentas
FROM Ordenes;

--El total de ventas a nivel global es de $9124

--2¿Cuál es el precio promedio de los productos dentro de cada categoría?

SELECT 
	C.Nombre AS NombreCategoria, 
	AVG(P.Precio) AS PrecioPromedio
FROM Productos AS P
INNER JOIN Categorias AS C ON P.CategoriaID = C.CategoriaID
GROUP BY C.Nombre
ORDER BY PrecioPromedio DESC;

--Precio promedio por categoria:
	
	--Pizzas: $12,50
	--Comida rapida: $10
	--Ensaladas: $6,50
	--Postres: $3,50
	--Helados: $3

/*Para responder a la preguntas 2 se realizaron iteraciones
sobre la estructura de la query, para lograr mayor presicion y reducir
la cantidad de caracteres a traves de alias.
En primer lugar seleccionamos las columnas con las que nos interesa trabajar, 
indicando primero la tabla de la que viene la columna (esto es posibles gracias a
"INNER JOIN"), utilizando "AS" para renombrar cada columna, hacemos uso de "AVG" 
para calcular el precio promedio, colocando un alias nuevamente, procedemos a indicar
mediante "FROM" la tabla desde la que seleccionaremos nuestros precios, para luego
mediante "INNER JOIN", hacer la union de datos entre las tablas "Productos y categorias",
hacemos esto por que nos interesa traer los nombres de las categorias, los cuales no  se encuentran
en la tabla "Productos", para finalizar agrupamos con "GROUP BY" y ordenamos con "ORDER BY"
de manera descendente para una mejor visualizacion*/

--3:¿Cuál es el valor de la orden mínima y máxima por cada sucursal?

SELECT 
	S.Nombre,
	MIN(TotalCompra) AS OrdenMinima, 
	MAX(TotalCompra) AS OrdenMaxima
FROM Ordenes O
INNER JOIN Sucursales AS S ON O.SucursalID = S.SucursalID
GROUP BY S.Nombre
ORDER BY OrdenMinima ASC;

--En este caso los valores para las ordenes minimas y maximas de cada sucursal coinciden

--4:¿Cuál es el mayor número de kilómetros recorridos para una entrega?

SELECT MAX(KilometrosRecorrer) AS MayorNumeroKmsParaUnaEntrega FROM Ordenes;

--El mayor numero de kilometros para una entrega es de 13

--5:¿Cuál es la cantidad promedio de productos por orden?

SELECT 
	OrdenID,
	AVG(Cantidad) AS CantidadPromedio
FROM DetalleOrdenes
GROUP BY OrdenID;

--Cantidad promedio de productos por orden: 3

--6:¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?

SELECT 
	T.Descripcion AS TipoDePago, 
	SUM(TotalCompra) AS FacturacionTotal
FROM Ordenes AS O
INNER JOIN TiposPago AS T ON O.TipoPagoID = T.TipoPagoID
GROUP BY T.Descripcion
ORDER BY FacturacionTotal DESC;

--Dsitribucion de facturacion segun tipo de pago:

/*	Cupón de Descuento			1095
	Vale de Comida				1085
	Tarjeta de Crédito			1075
	Cheque						1065
	Efectivo					1054
	Transferencia Bancaria		955
	Criptomonedas				945
	PayPal						930
	Tarjeta de Débito			920			*/

--7:¿Cuál Sucursal tiene el ingreso promedio más alto?

SELECT TOP 1
	S.Nombre,
	AVG(TotalCompra) AS IngresoPromedio 
	FROM Ordenes AS O
INNER JOIN Sucursales AS S ON O.SucursalID = S.SucursalID
GROUP BY S.Nombre
ORDER BY IngresoPromedio DESC;

--Sucursal Lago tiene el ingreso promedio mas alto

--8:¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?

SELECT 
	S.SucursalID, 
	S.Nombre, 
	SUM(TotalCompra) AS VentasTotales
FROM Ordenes AS O
INNER JOIN Sucursales AS S ON O.SucursalID = S.SucursalID
GROUP BY S.SucursalID, S.Nombre
HAVING AVG(TotalCompra) > 1000
ORDER BY VentasTotales DESC;

--Las sucursales que generaron ventas totales por encima de 1000 son las siguientes:

/*		Sucursal Lago
		Sucursal Valle
		Sucursal Norte
		Sucursal Montaña
		Sucursal Central														*/

--9:¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?

--Promedio antes de 1 de julio de 2023

SELECT 
	AVG(TotalCompra) AS PromedioAntes 
FROM Ordenes
WHERE FechaOrdenTomada < '01-07-2023';


--Promedio despues de 1 de julio de 2023

SELECT
	AVG(TotalCompra) AS PromedioDespues
FROM Ordenes
WHERE FechaOrdenTomada > '2023-07-01';

--------------------------------------------RESOLUCION EN UNA SOLA QUERY---------------------------------------------------
SELECT 
    AVG(CASE WHEN FechaOrdenTomada < '01-07-2023' THEN TotalCompra END) AS Promedio_Ventas_Antes_Julio,
    AVG(CASE WHEN FechaOrdenTomada > '01-07-2023' THEN TotalCompra END) AS Promedio_Ventas_Despues_Julio
FROM 
    Ordenes;

--El promedio de ventas antes del 1 julio es de $979,83
--El promedio de ventas despues del 1 julio es de $1081


/*10:¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de 
ventas, cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo 
alcanzado por una orden en dicha jornada?*/

SELECT 
	HorarioVenta,
	COUNT(OrdenID) AS CantidadVentasHorario,
	AVG(TotalCompra) AS IngresoPromedio,
	MAX(TotalCompra) AS ImporteMaximo
FROM Ordenes
GROUP BY HorarioVenta
ORDER BY ImporteMaximo DESC;


/* Se registra la misma cantidad de ventas para los 3 horarios (mañana, tarde y noche).
	Ingreso promedio de ventas por horario:
											Tarde		$1038.33
											Mañana		$1016.33
											Noche		$986.66

	Importe maximo alcanzado para cada horario:
											Tarde		$1085
											Mañana		$1065
											Noche		$1095							*/


--##########################--##########################--##########################--##########################--##########################















