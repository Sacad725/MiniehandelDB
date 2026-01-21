
-- JOIN: order + kund + produkter
SELECT
    c.FirstName,
    c.LastName,
    o.OrderId,
    p.Name AS ProductName,
    oi.Quantity
FROM Customer c
JOIN [Order] o ON c.CustomerId = o.CustomerId
JOIN OrderItem oi ON o.OrderId = oi.OrderId
JOIN Product p ON oi.ProductId = p.ProductId;

-- Totalt sålda produkter
SELECT
    p.Name,
    SUM(oi.Quantity) AS TotalSold
FROM OrderItem oi
JOIN Product p ON oi.ProductId = p.ProductId
GROUP BY p.Name;

-- Produkter med lågt lager
SELECT
    p.Name,
    s.StockQuantity
FROM Product p
JOIN Store s ON p.ProductId = s.ProductId
WHERE s.StockQuantity < 20;