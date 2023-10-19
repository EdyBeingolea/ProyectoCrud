use master
go

drop database if exists Snacker
go

create database Snacker
go 

use Snacker
go

CREATE TABLE Areas (
    id int  identity(1,1),
    name varchar(80),
    description varchar(200),
    state char(1) default 'A',
    CONSTRAINT Areas_pk PRIMARY KEY  (id)
);

CREATE TABLE Customer (
    id int  identity(1,1),
    name varchar(60),
    address varchar(90),
    phone char(9),
    status char(1) default 'A',
    CONSTRAINT Customer_pk PRIMARY KEY  (id)
);

CREATE TABLE Employee (
    id int  identity(1,1),
    name varchar(50),
    lastName varchar(80),
    dni char(8),
    state char(1)default 'A',
    CONSTRAINT Employee_pk PRIMARY KEY  (id)
);

CREATE TABLE Product (
    id int  identity(1,1),
    name varchar(60),
    description varchar(80),
    unit_price decimal(8,2),
    available_stock int,
    CONSTRAINT Product_pk PRIMARY KEY  (id)
);

CREATE TABLE Supplier (
    id int  identity(1,1),
    name varchar(60)  ,
    address varchar(90)  ,
    phone char(9) ,
    CONSTRAINT Supplier_pk PRIMARY KEY  (id)
);

CREATE TABLE Purchase (
    id int  identity(1,1),
    Supplier_id int  ,
    date datetime default GETDATE(),
    CONSTRAINT Purchase_pk PRIMARY KEY  (id)
);

CREATE TABLE RawMaterial (
    id int  identity(1,1),
    name varchar(80) ,
    price decimal(8,2)  ,
    CONSTRAINT RawMaterial_pk PRIMARY KEY  (id)
);

CREATE TABLE PurchaseDetail (
    id int  identity(1,1),
    quantity int  ,
    Purchase_id int ,
    RawMaterial_id int ,
    unit_price decimal(8,2) ,
    CONSTRAINT PurchaseDetail_pk PRIMARY KEY  (id)
);

CREATE TABLE RawMaterialHistory (
    id int  identity(1,1),
    Employee_id int  ,
    Areas_id int  ,
    Purchase_id int  ,
    RawMaterial_id int  ,
    state char(1) default 'A',
    CONSTRAINT RawMaterialHistory_pk PRIMARY KEY  (id)
);

CREATE TABLE Sale (
    id int  identity(1,1),
    Employee_id int  ,
    Customer_id int  ,
    date datetime default GETDATE(),
    CONSTRAINT Sale_pk PRIMARY KEY  (id)
);

CREATE TABLE Record (
    id int  identity(1,1),
    Employee_id int ,
    Product_id int  ,
    Sale_id int  ,
    amount int  ,
    date datetime default GETDATE() ,
    sale_detail int  ,
    state char(1) default 'A',
    CONSTRAINT Record_pk PRIMARY KEY  (id)
);

CREATE TABLE SaleDetail (
    id int  identity(1,1),
    Sale_id int  ,
    Product_id int  ,
    quantity int  ,
    unit_price decimal(8,2) ,
    CONSTRAINT SaleDetail_pk PRIMARY KEY  (id)
);





ALTER TABLE PurchaseDetail ADD CONSTRAINT PurchaseDetail_Purchase
    FOREIGN KEY (Purchase_id)
    REFERENCES Purchase (id);

ALTER TABLE PurchaseDetail ADD CONSTRAINT PurchaseDetail_RawMaterial
    FOREIGN KEY (RawMaterial_id)
    REFERENCES RawMaterial (id);

ALTER TABLE Purchase ADD CONSTRAINT Purchase_Supplier
    FOREIGN KEY (Supplier_id)
    REFERENCES Supplier (id);

ALTER TABLE RawMaterialHistory ADD CONSTRAINT RawMaterialHistory_Areas
    FOREIGN KEY (Areas_id)
    REFERENCES Areas (id);

ALTER TABLE RawMaterialHistory ADD CONSTRAINT RawMaterialHistory_Employee
    FOREIGN KEY (Employee_id)
    REFERENCES Employee (id);

ALTER TABLE RawMaterialHistory ADD CONSTRAINT RawMaterialHistory_Purchase
    FOREIGN KEY (Purchase_id)
    REFERENCES Purchase (id);

ALTER TABLE RawMaterialHistory ADD CONSTRAINT RawMaterialHistory_RawMaterial
    FOREIGN KEY (RawMaterial_id)
    REFERENCES RawMaterial (id);

ALTER TABLE Record ADD CONSTRAINT Record_Employee
    FOREIGN KEY (Employee_id)
    REFERENCES Employee (id);

ALTER TABLE Record ADD CONSTRAINT Record_Product
    FOREIGN KEY (Product_id)
    REFERENCES Product (id);

ALTER TABLE Record ADD CONSTRAINT Record_Sale
    FOREIGN KEY (Sale_id)
    REFERENCES Sale (id);

ALTER TABLE SaleDetail ADD CONSTRAINT SaleDetail_Product
    FOREIGN KEY (Product_id)
    REFERENCES Product (id);

ALTER TABLE SaleDetail ADD CONSTRAINT SaleDetail_Sale
    FOREIGN KEY (Sale_id)
    REFERENCES Sale (id);

ALTER TABLE Sale ADD CONSTRAINT Sale_Customer
    FOREIGN KEY (Customer_id)
    REFERENCES Customer (id);

ALTER TABLE Sale ADD CONSTRAINT Sale_Employee
    FOREIGN KEY (Employee_id)
    REFERENCES Employee (id);



-- Insert data into the Areas table
-- Datos de Areas para la producción de chifle

INSERT INTO Areas (name, description)
VALUES ('Área de Pelado', 'Esta área se encarga de pelar las plátanos para la producción de chifle.'),
       ('Área de Corte', 'Aquí se cortan los plátanos en rodajas finas para freír.'),
       ('Área de Fritura', 'Las rodajas de plátano se fríen en esta área hasta que estén crujientes.'),
       ('Área de Sazón', 'Se agregan condimentos y sal a las rodajas de plátano fritas.'),
       ('Área de Empaque', 'Las porciones de chifle se empacan y etiquetan para su distribución.'),
       ('Área de Almacenamiento', 'Almacén de materias primas y productos terminados para la producción de chifle.'),
       ('Área de Calidad', 'Esta área se encarga de controlar la calidad de los chifles antes de su distribución.');
go

-- Insertar datos ficticios para 15 clientes en Perú
INSERT INTO Customer (name, address, phone)
VALUES
    ('Juan Pérez', 'Lima, Perú', '912345678'),
    ('María González', 'Arequipa, Perú', '945678912'),
    ('Carlos Rodríguez', 'Trujillo, Perú', '976543210'),
    ('Sofía Martínez', 'Cusco, Perú', '913210987'),
    ('Luis García', 'Piura, Perú', '954678123'),
    ('Ana López', 'Chiclayo, Perú', '968712345'),
    ('Pedro Fernández', 'Iquitos, Perú', '937891234'),
    ('Elena Ramírez', 'Tacna, Perú', '911234567'),
    ('Miguel Torres', 'Pucallpa, Perú', '926789012'),
    ('Laura Silva', 'Huancayo, Perú', '927890123'),
    ('José Mendoza', 'Chimbote, Perú', '918765432'),
    ('Carmen Herrera', 'Ica, Perú', '979012345'),
    ('Jorge Vargas', 'Huaraz, Perú', '953210987'),
    ('Rosa Flores', 'Tarapoto, Perú', '958765432'),
    ('Diego Castro', 'Ayacucho, Perú', '994567890')
go


-- Insertar datos ficticios para 15 empleados
INSERT INTO Employee (name, lastName, dni)
VALUES
    ('Luis', 'Gómez', '12345678'),
    ('Ana', 'Martínez', '23456789'),
    ('Carlos', 'Rodríguez', '34567890'),
    ('María', 'Pérez', '45678901'),
    ('Pedro', 'González', '56789012'),
    ('Sofía', 'López', '67890123'),
    ('Javier', 'Sánchez', '78901234'),
    ('Laura', 'Hernández', '89012345'),
    ('Diego', 'Torres', '90123456'),
    ('Carmen', 'Díaz', '01234567'),
    ('Jorge', 'Fernández', '13579246'),
    ('Elena', 'Ortega', '24681357'),
    ('Andrés', 'Vargas', '35792468'),
    ('Isabel', 'Mendoza', '46813579'),
    ('Fernando', 'Soto', '57924680')
go

-- Insertar datos ficticios para 15 empleados sin el campo "state"
INSERT INTO Employee (name, lastName, dni)
VALUES
    ('Juan', 'Pérez Gómez', '12345678'),
    ('María', 'González López', '23456789'),
    ('Carlos', 'Rodríguez Martínez', '34567890'),
    ('Sofía', 'Martínez García', '45678901'),
    ('Luis', 'García Rodríguez', '56789012'),
    ('Ana', 'López Pérez', '67890123'),
    ('Pedro', 'Fernández Sánchez', '78901234'),
    ('Elena', 'Ramírez Torres', '89012345'),
    ('Miguel', 'Torres González', '90123456'),
    ('Laura', 'Silva Martínez', '01234567'),
    ('José', 'Mendoza López', '11223344'),
    ('Carmen', 'Herrera Rodríguez', '22334455'),
    ('Jorge', 'Vargas Pérez', '33445566'),
    ('Rosa', 'Flores Sánchez', '44556677'),
    ('Diego', 'Castro Torres', '55667788')
go

-- Insertar datos ficticios para 15 productos con nombres y descripciones
INSERT INTO Product (name, description, unit_price, available_stock)
VALUES
    ('Chifles de Platano', 'Aperitivo de platano frito', 3.99, 100),
    ('Chifles de Papas', 'Aperitivo de papas fritas', 2.49, 150),
    ('Chifles de Yuca', 'Aperitivo de yuca frita', 3.49, 120),
    ('Chifles de Plátano Maduro', 'Aperitivo de plátano maduro frito', 3.79, 95),
    ('Papas de Camote', 'Papas de camote crujientes', 2.99, 130),
    ('Chifles Mixtos', 'Mezcla de chifles de platano y yuca', 3.99, 85)
go


-- Insertar datos ficticios para 15 proveedores en Piura, Perú
INSERT INTO Supplier (name, address, phone)
VALUES
    ('José García Pérez', 'Piura, Av. Principal 123', '912345678'),
    ('María Rodríguez Sánchez', 'Piura, Calle Central 456', '945678912'),
    ('Juan Martínez López', 'Sullana, Jr. Libertad 789', '976543210'),
    ('Ana Pérez González', 'Piura, Av. Comercial 234', '913210987'),
    ('Pedro López Torres', 'Talara, Calle Playa 567', '954678123'),
    ('Carmen González Vargas', 'Piura, Calle Mercado 890', '968712345'),
    ('Luis Pérez García', 'Piura, Av. Principal 1234', '937891234'),
    ('Elena Sánchez Martínez', 'Chulucanas, Jr. Cáceres 123', '911234567'),
    ('Miguel Martínez González', 'Piura, Calle Industrial 5678', '926789012'),
    ('Sofía García Rodríguez', 'Piura, Av. Norte 345', '927890123'),
    ('Carlos Pérez Torres', 'Piura, Calle Mariscal 901', '918765432'),
    ('Rosa Sánchez García', 'Piura, Jr. Lima 2345', '979012345'),
    ('Diego Torres López', 'Piura, Av. Sur 678', '953210987'),
    ('Laura Vargas Pérez', 'Piura, Calle Este 12345', '958765432'),
    ('Jorge Pérez Sánchez', 'Castilla, Av. Oeste 6789', '994567890')
go

-- Insertar datos ficticios para 15 compras en la tabla Purchase
INSERT INTO Purchase (Supplier_id)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10),
    (11),
    (12),
    (13),
    (14),
    (15)
go

-- Datos de materias primas relacionadas con camote, plátano, yuca y papas

-- Camote
INSERT INTO RawMaterial (name, price)
VALUES ('Camote naranja', 2.50),
       ('Camote morado', 2.75),
       ('Camote amarillo', 2.60);

-- Plátano
INSERT INTO RawMaterial (name, price)
VALUES ('Plátano verde', 1.80),
       ('Plátano maduro', 2.00);

-- Yuca
INSERT INTO RawMaterial (name, price)
VALUES ('Yuca blanca', 1.90),
       ('Yuca amarilla', 2.10);

-- Papas
INSERT INTO RawMaterial (name, price)
VALUES ('Papas blancas', 1.50),
       ('Papas amarillas', 1.60)
go



-- Compra de Camote
INSERT INTO PurchaseDetail (quantity, Purchase_id, RawMaterial_id, unit_price)
VALUES (100, 1, 1, 2.50),
       (75, 2, 1, 2.50), 
       (120, 3, 1, 2.50); 

-- Compra de Plátano
INSERT INTO PurchaseDetail (quantity, Purchase_id, RawMaterial_id, unit_price)
VALUES (200, 4, 4, 1.80),
       (150, 5, 4, 1.80); 

-- Compra de Yuca
INSERT INTO PurchaseDetail (quantity, Purchase_id, RawMaterial_id, unit_price)
VALUES (80, 6, 6, 1.90),
       (100, 7, 6, 1.90); 

-- Compra de Papas
INSERT INTO PurchaseDetail (quantity, Purchase_id, RawMaterial_id, unit_price)
VALUES (300, 8, 8, 1.50),
       (250, 9, 8, 1.50), 
       (200, 10, 8, 1.50) 

go



-- Datos de RawMaterialHistory relacionados con la producción de chifle

-- Historia de materias primas para el chifle
INSERT INTO RawMaterialHistory (Employee_id, Areas_id, Purchase_id, RawMaterial_id)
VALUES (1, 1, 1, 1),
       (2, 2, 2, 1),
       (3, 3, 3, 1),
       (4, 4, 4, 2),
       (5, 5, 5, 2),
       (6, 6, 6, 3),
       (7, 7, 7, 3),
       (8, 1, 8, 4),
       (9, 2, 9, 4),
       (10, 3, 10, 4),
       (11, 4, 11, 5),
       (12, 5, 12, 5),
       (13, 6, 13, 6),
       (14, 7, 14, 6),
       (15, 1, 15, 7)
go



-- Datos de la tabla Sale (sin el campo de fecha)

INSERT INTO Sale (Employee_id, Customer_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (1, 4),
       (2, 5),
       (3, 6),
       (1, 7),
       (2, 8),
       (3, 9),
       (1, 10),
       (2, 11),
       (3, 12),
       (1, 13),
       (2, 14),
       (3, 15)
go

-- Datos de la tabla Record (sin el campo de fecha y utilizando 6 productos)

INSERT INTO Record (Employee_id, Product_id, Sale_id, amount, sale_detail)
VALUES (1, 1, 1, 10, 1),
       (2, 2, 2, 15, 2),
       (3, 3, 3, 20, 3),
       (1, 4, 4, 8, 4),
       (2, 5, 5, 12, 5),
       (3, 6, 6, 18, 6),
       (1, 1, 7, 11, 7),
       (2, 2, 8, 16, 8),
       (3, 3, 9, 21, 9),
       (1, 4, 10, 9, 10),
       (2, 5, 11, 13, 11),
       (3, 6, 12, 19, 12),
       (1, 1, 13, 12, 13),
       (2, 2, 14, 17, 14),
       (3, 3, 15, 22, 15)
go


-- Datos de la tabla SaleDetail

INSERT INTO SaleDetail (Sale_id, Product_id, quantity, unit_price)
VALUES (1, 1, 5, 2.50),
       (1, 2, 3, 3.00),
       (2, 3, 8, 1.75),
       (2, 4, 10, 2.25),
       (3, 5, 6, 1.90),
       (3, 6, 4, 2.10),
       (4, 1, 7, 2.50),
       (4, 2, 5, 3.00),
       (5, 3, 9, 1.75),
       (5, 4, 11, 2.25),
       (6, 5, 10, 1.90),
       (6, 6, 8, 2.10),
       (7, 1, 6, 2.50),
       (7, 2, 4, 3.00),
       (8, 3, 7, 1.75)
go


select * from Areas;
select * from Customer;
select * from Employee;
select * from Product;
select * from Purchase;
select * from PurchaseDetail;
select * from RawMaterial;
select * from RawMaterialHistory;
select * from Record;
select * from Sale;
select * from SaleDetail;
select * from Supplier;