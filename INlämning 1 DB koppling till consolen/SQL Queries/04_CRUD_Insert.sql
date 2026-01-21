



-- Skapa ny order
INSERT INTO [Order] (CustomerId, TotalAmount)
VALUES (1, 399);

-- Lägg produkt i order
INSERT INTO OrderItem (OrderId, ProductId, Quantity, UnitPrice)
VALUES (1, 1, 1, 399);
