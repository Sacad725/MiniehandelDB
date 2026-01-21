
-- Uppdatera orderstatus
UPDATE [Order]
SET Status = 'Paid'
WHERE OrderId = 1;

-- Minska lagersaldo
UPDATE Store
SET StockQuantity = StockQuantity - 1
WHERE ProductId = 1;