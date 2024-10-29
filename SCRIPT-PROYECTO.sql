DROP DATABASE IF EXISTS inventech;

CREATE DATABASE inventech CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use inventech;
 
create table Rol(
ID INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

create table Empleado (
ID INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
TIPO_DOCUMENTO VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
NUMERO_DOCUMENTO INT NOT NULL,
EMAIL VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
C_EMAIL VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
DIRECCION VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
TELEFONO VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
CARGO VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
ID_ROL INT NOT NULL,
FOREIGN KEY (ID_ROL) REFERENCES Rol(ID)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

create table Categoria (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  NOMBRE VARCHAR(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  DESCRIPCIÓN VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
 
create table Proveedor (
ID INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
EMAIL VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
DIRECCIÓN VARCHAR(30) COLLATE utf8mb4_unicode_ci NOT NULL,
TELEFONO INT NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

create table Administrador (
ID INT PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
EMAIL VARCHAR(50)COLLATE utf8mb4_unicode_ci NOT NULL,
CONTRASEÑA VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
REP_CONTRASEÑA VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
TELEFONO INT NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

Create table Inventario (
ID INT PRIMARY KEY AUTO_INCREMENT,
FECHA DATE,
STOCK INT 
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

Create table Tipo_Movimiento (
ID INT PRIMARY KEY AUTO_INCREMENT,
DESCRIPCIÓN VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
ID_inventario INT NOT NULL,
FOREIGN KEY (ID_Inventario) REFERENCES Inventario (ID)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

Create Table Factura (
ID INT PRIMARY KEY AUTO_INCREMENT,
FECHA DATE,
VALOR_TOTAL INT NOT NULL,
IVA INT NOT NULL,
ID_Inventario INT NOT NULL,
FOREIGN KEY (ID_Inventario) REFERENCES Inventario (ID)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

Create table Venta (
ID INT PRIMARY KEY AUTO_INCREMENT,
ESTADO VARCHAR(20) COLLATE utf8mb4_unicode_ci NOT NULL,
FECHA DATE NOT NULL,
ID_Factura INT NOT NULL,
ID_Cliente INT NOT NULL,
FOREIGN KEY (ID_Factura) REFERENCES Factura (ID)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
 
Create table Producto (
ID INT PRIMARY KEY AUTO_INCREMENT,
ESTADO VARCHAR(100) COLLATE utf8mb4_unicode_ci NOT NULL,
CANTIDAD_DISPONIBLE INT NOT NULL,
STOCK_MIN INT NOT NULL,
STOCK_MAX INT NOT NULL,
COLOR VARCHAR (20) COLLATE  utf8mb4_unicode_ci NOT NULL,
FECHA_CADUCIDAD DATE NOT NULL,
ID_Proveedor INT NOT NULL,
ID_Categoria INT NOT NULL,
ID_Inventario INT NOT NULL,
ID_Venta INT NOT NULL,
foreign key (ID_Proveedor) REFERENCES Proveedor(ID),
foreign key (ID_Categoria) REFERENCES Categoria(ID),
foreign key (ID_Inventario) REFERENCES Inventario (ID),
foreign key (ID_Venta) REFERENCES Venta(ID)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
