USE MiniEhandelDB;
GO

-- Ta bort orderrader först (pga FK)
DELETE FROM OrderItem
WHERE OrderId = 1;

-- Ta bort order
DELETE FROM [Order]
WHERE OrderId = 1;
