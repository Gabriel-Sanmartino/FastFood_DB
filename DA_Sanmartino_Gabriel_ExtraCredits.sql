/*CARGA DE DATOS ADICIONALES*/
USE FastFood_DB;
GO
-- Insertar datos en DetalleOrdenes para órdenes existentes
INSERT INTO DetalleOrdenes (OrdenID, ProductoID, Cantidad, Precio) VALUES
(4, 1, 3, 21.50),
(4, 2, 2, 44.75),
(4, 3, 1, 47.80),
(4, 4, 4, 23.40),
(4, 5, 3, 26.90),

(5, 6, 4, 19.20),
(5, 7, 5, 13.00),
(5, 8, 2, 20.75),
(5, 9, 3, 29.30),
(5, 10, 4, 38.45),

(6, 1, 1, 22.00),
(6, 2, 2, 39.50),
(6, 3, 5, 50.50),
(6, 4, 3, 42.80),
(6, 5, 1, 31.60),

(7, 6, 4, 18.00),
(7, 7, 3, 14.00),
(7, 8, 2, 21.30),
(7, 9, 4, 30.90),
(7, 10, 5, 41.50),

(8, 1, 5, 25.60),
(8, 2, 3, 48.00),
(8, 3, 2, 44.70),
(8, 4, 1, 28.90),
(8, 5, 3, 32.50),

(9, 6, 2, 19.40),
(9, 7, 1, 12.80),
(9, 8, 3, 26.10),
(9, 9, 2, 31.20),
(9, 10, 4, 38.00);
GO

SELECT * FROM DetalleOrdenes;


CREATE INDEX idxIngresos
ON Ordenes(OrdenID ASC, TotalCompra);

SET STATISTICS IO ON

--Para el producto que mayores ingresos genera, cual es la cantidad por horario?
select  P.Nombre, SUM(TotalCompra) AS Ingresos, SUM(D.Cantidad) AS Cantidad, O.HorarioVenta AS Horario
from DetalleOrdenes D
JOIN Productos P 
ON D.ProductoID = P.ProductoID
JOIN Ordenes O
ON D.OrdenID = O.OrdenID
GROUP BY P.Nombre, O.HorarioVenta
ORDER BY SUM(TotalCompra) DESC;

--El producto que mayores ingresos genera es la "Ensalada Cesar"
--En la mañana la cantidad al momento del analisis es de 5 ensaladas
--Para la tarde la la cantidad se mantiene en 5
--Mientras que por las noches la cantidad se reduce a 1