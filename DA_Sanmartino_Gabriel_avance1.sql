--########################## Avance 1 proyecto integrador ##########################

--Creacion de la base
CREATE DATABASE FastFood_DB;

--Selecion de base

USE FastFood_DB;

--Creacion de tablas

--Tabla categorias

CREATE TABLE Categorias(
	CategoriaID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(100) not null,
	);

--Tabla productos

CREATE TABLE Productos(
	ProductoID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(100),
	CategoriaID INT,
	FOREIGN KEY (CategoriaId) REFERENCES Categorias (CategoriaId),
	Precio DECIMAL,
	);

--Tabla sucursales

CREATE TABLE Sucursales(
	SucursalID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(100),
	Direccion VARCHAR(200),
	);



--Tabla empleados

CREATE TABLE Empleados(
	EmpleadoID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(100),
	Posicion VARCHAR(100),
	Departamento VARCHAR(100),
	SucursalID INT FOREIGN KEY (SucursalID) REFERENCES Sucursales (SucursalID),
	Rol VARCHAR(100),
	);

--Tabla clientes
 
 CREATE TABLE Clientes(
	ClienteID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(100),
	Direccion VARCHAR(100),
	);

--Tabla origenes

CREATE TABLE OrigenesOrden(
	OrigenID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Descripcion VARCHAR(100),
	);

--Tabla pagos

CREATE TABLE TiposPago(
	TipoPagoID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Descripcion VARCHAR(100),
	);

--Tabla mensajeros

CREATE TABLE Mensajeros(
	MensajeroID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(100),
	EsExterno BIT,
	);

--Tabla ordenes

CREATE TABLE Ordenes(
	OrdenID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ClienteID INT FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID),
	EmpleadoID INT FOREIGN KEY (EmpleadoID) REFERENCES Empleados (EmpleadoID),
	SucursalID INT FOREIGN KEY (SucursalID) REFERENCES Sucursales (SucursalID),
	MensajeroID INT FOREIGN KEY (MensajeroID) REFERENCES Mensajeros (MensajeroID),
	TipoPagoID INT FOREIGN KEY (TipoPagoID) REFERENCES TiposPago (TipoPagoID),
	OrigenID INT FOREIGN KEY (OrigenID) REFERENCES OrigenesOrden (OrigenID),
	HorarioVenta VARCHAR(100) not null,
	TotalCompra DECIMAL not null,
	KilometrosRecorrer DECIMAL not null,
	FechaDespacho DATETIME,
	FechaEntrega DATETIME,
	FechaOrdenTomada DATETIME,
	FechaOrdenLista DATETIME,
	);

--Tabla detalles

CREATE TABLE DetalleOrdenes(
	DetalleID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	OrdenID INT FOREIGN KEY (OrdenID) REFERENCES Ordenes (OrdenID),
	ProductoID INT FOREIGN KEY (ProductoID) REFERENCES Productos (ProductoID),
	Cantidad INT,
	Precio DECIMAL,
	);

	--##########################--##########################--##########################--##########################--##########################

