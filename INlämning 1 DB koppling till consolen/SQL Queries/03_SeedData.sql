
-- SEEDdata alltså datan får värde 



-- Kategorier
INSERT INTO Category (Name, Description) VALUES
('Elektronik','Teknikprodukter'),
('Kläder','Mode'),
('Hem','Hemartiklar');

-- Kunder
INSERT INTO Customer (FirstName, LastName, Email, Address) VALUES
('Anna','Svensson','anna@mail.se','Stockholm'),
('Erik','Karlsson','erik@mail.se','Uppsala'),
('Sara','Nilsson','sara@mail.se','Malmö'),
('Lina','Berg','lina@mail.se','Örebro');

-- Produkter
INSERT INTO Product (Name, Price, CategoryId) VALUES
('Laptop',9999,1),
('Hörlurar',799,1),
('T-shirt',199,2),
('Kudde',299,3),
('Mus',399,1);

-- Lager
INSERT INTO Store (Name, ProductId, StockQuantity) VALUES
('Huvudlager',1,10),
('Huvudlager',2,30),
('Huvudlager',3,50),
('Huvudlager',4,20),
('Huvudlager',5,15);

-- Ordrar
INSERT INTO [Order] (CustomerId, Status, TotalAmount) VALUES
(1,'Pending',10798),
(2,'Pending',199),
(3,'Pending',299);

-- Orderrader
INSERT INTO OrderItem (OrderId, ProductId, Quantity, UnitPrice) VALUES
(1,1,1,9999),
(1,2,1,799),
(2,3,1,199),
(3,4,1,299);
