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
-- Datos de Areas para la producci�n de chifle

INSERT INTO Areas (name, description)
VALUES ('�rea de Pelado', 'Esta �rea se encarga de pelar las pl�tanos para la producci�n de chifle.'),
       ('�rea de Corte', 'Aqu� se cortan los pl�tanos en rodajas finas para fre�r.'),
       ('�rea de Fritura', 'Las rodajas de pl�tano se fr�en en esta �rea hasta que est�n crujientes.'),
       ('�rea de Saz�n', 'Se agregan condimentos y sal a las rodajas de pl�tano fritas.'),
       ('�rea de Empaque', 'Las porciones de chifle se empacan y etiquetan para su distribuci�n.'),
       ('�rea de Almacenamiento', 'Almac�n de materias primas y productos terminados para la producci�n de chifle.'),
       ('�rea de Calidad', 'Esta �rea se encarga de controlar la calidad de los chifles antes de su distribuci�n.');
go

-- Insertar datos ficticios para 15 clientes en Per�
INSERT INTO Customer (name, address, phone)
VALUES
    ('Juan P�rez', 'Lima, Per�', '912345678'),
    ('Mar�a Gonz�lez', 'Arequipa, Per�', '945678912'),
    ('Carlos Rodr�guez', 'Trujillo, Per�', '976543210'),
    ('Sof�a Mart�nez', 'Cusco, Per�', '913210987'),
    ('Luis Garc�a', 'Piura, Per�', '954678123'),
    ('Ana L�pez', 'Chiclayo, Per�', '968712345'),
    ('Pedro Fern�ndez', 'Iquitos, Per�', '937891234'),
    ('Elena Ram�rez', 'Tacna, Per�', '911234567'),
    ('Miguel Torres', 'Pucallpa, Per�', '926789012'),
    ('Laura Silva', 'Huancayo, Per�', '927890123'),
    ('Jos� Mendoza', 'Chimbote, Per�', '918765432'),
    ('Carmen Herrera', 'Ica, Per�', '979012345'),
    ('Jorge Vargas', 'Huaraz, Per�', '953210987'),
    ('Rosa Flores', 'Tarapoto, Per�', '958765432'),
    ('Diego Castro', 'Ayacucho, Per�', '994567890')
go


-- Insertar datos ficticios para 15 empleados
INSERT INTO Employee (name, lastName, dni)
VALUES
    ('Luis', 'G�mez', '12345678'),
    ('Ana', 'Mart�nez', '23456789'),
    ('Carlos', 'Rodr�guez', '34567890'),
    ('Mar�a', 'P�rez', '45678901'),
    ('Pedro', 'Gonz�lez', '56789012'),
    ('Sof�a', 'L�pez', '67890123'),
    ('Javier', 'S�nchez', '78901234'),
    ('Laura', 'Hern�ndez', '89012345'),
    ('Diego', 'Torres', '90123456'),
    ('Carmen', 'D�az', '01234567'),
    ('Jorge', 'Fern�ndez', '13579246'),
    ('Elena', 'Ortega', '24681357'),
    ('Andr�s', 'Vargas', '35792468'),
    ('Isabel', 'Mendoza', '46813579'),
    ('Fernando', 'Soto', '57924680')
go

-- Insertar datos ficticios para 15 empleados sin el campo "state"
INSERT INTO Employee (name, lastName, dni)
VALUES
    ('Juan', 'P�rez G�mez', '12345678'),
    ('Mar�a', 'Gonz�lez L�pez', '23456789'),
    ('Carlos', 'Rodr�guez Mart�nez', '34567890'),
    ('Sof�a', 'Mart�nez Garc�a', '45678901'),
    ('Luis', 'Garc�a Rodr�guez', '56789012'),
    ('Ana', 'L�pez P�rez', '67890123'),
    ('Pedro', 'Fern�ndez S�nchez', '78901234'),
    ('Elena', 'Ram�rez Torres', '89012345'),
    ('Miguel', 'Torres Gonz�lez', '90123456'),
    ('Laura', 'Silva Mart�nez', '01234567'),
    ('Jos�', 'Mendoza L�pez', '11223344'),
    ('Carmen', 'Herrera Rodr�guez', '22334455'),
    ('Jorge', 'Vargas P�rez', '33445566'),
    ('Rosa', 'Flores S�nchez', '44556677'),
    ('Diego', 'Castro Torres', '55667788')
go

-- Insertar datos ficticios para 15 productos con nombres y descripciones
INSERT INTO Product (name, description, unit_price, available_stock)
VALUES
    ('Chifles de Platano', 'Aperitivo de platano frito', 3.99, 100),
    ('Chifles de Papas', 'Aperitivo de papas fritas', 2.49, 150),
    ('Chifles de Yuca', 'Aperitivo de yuca frita', 3.49, 120),
    ('Chifles de Pl�tano Maduro', 'Aperitivo de pl�tano maduro frito', 3.79, 95),
    ('Papas de Camote', 'Papas de camote crujientes', 2.99, 130),
    ('Chifles Mixtos', 'Mezcla de chifles de platano y yuca', 3.99, 85)
go


-- Insertar datos ficticios para 15 proveedores en Piura, Per�
INSERT INTO Supplier (name, address, phone)
VALUES
    ('Jos� Garc�a P�rez', 'Piura, Av. Principal 123', '912345678'),
    ('Mar�a Rodr�guez S�nchez', 'Piura, Calle Central 456', '945678912'),
    ('Juan Mart�nez L�pez', 'Sullana, Jr. Libertad 789', '976543210'),
    ('Ana P�rez Gonz�lez', 'Piura, Av. Comercial 234', '913210987'),
    ('Pedro L�pez Torres', 'Talara, Calle Playa 567', '954678123'),
    ('Carmen Gonz�lez Vargas', 'Piura, Calle Mercado 890', '968712345'),
    ('Luis P�rez Garc�a', 'Piura, Av. Principal 1234', '937891234'),
    ('Elena S�nchez Mart�nez', 'Chulucanas, Jr. C�ceres 123', '911234567'),
    ('Miguel Mart�nez Gonz�lez', 'Piura, Calle Industrial 5678', '926789012'),
    ('Sof�a Garc�a Rodr�guez', 'Piura, Av. Norte 345', '927890123'),
    ('Carlos P�rez Torres', 'Piura, Calle Mariscal 901', '918765432'),
    ('Rosa S�nchez Garc�a', 'Piura, Jr. Lima 2345', '979012345'),
    ('Diego Torres L�pez', 'Piura, Av. Sur 678', '953210987'),
    ('Laura Vargas P�rez', 'Piura, Calle Este 12345', '958765432'),
    ('Jorge P�rez S�nchez', 'Castilla, Av. Oeste 6789', '994567890')
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

-- Datos de materias primas relacionadas con camote, pl�tano, yuca y papas

-- Camote
INSERT INTO RawMaterial (name, price)
VALUES ('Camote naranja', 2.50),
       ('Camote morado', 2.75),
       ('Camote amarillo', 2.60);

-- Pl�tano
INSERT INTO RawMaterial (name, price)
VALUES ('Pl�tano verde', 1.80),
       ('Pl�tano maduro', 2.00);

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

-- Compra de Pl�tano
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



-- Datos de RawMaterialHistory relacionados con la producci�n de chifle

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