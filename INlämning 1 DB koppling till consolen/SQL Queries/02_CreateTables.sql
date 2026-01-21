

-- Steg 1
-- 1. Customer (Kunder)

CREATE TABLE Customer (
    CustomerId INT IDENTITY PRIMARY KEY,     -- Primärnyckel
    FirstName VARCHAR(50) NOT NULL,           -- Kundens förnamn
    LastName VARCHAR(50) NOT NULL,            -- Kundens efternamn
    Email VARCHAR(100) NOT NULL UNIQUE,       -- E-post, måste vara unik
    Address VARCHAR(200),                     -- Adress
    CreatedAt DATETIME DEFAULT GETDATE()      -- Skapad datum
);


-- 2. Category (Kategorier)

CREATE TABLE Category (
    CategoryId INT IDENTITY PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE,        -- Kategorinamn
    Description TEXT
);


-- 3. Product (Produkter)

CREATE TABLE Product (
    ProductId INT IDENTITY PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,               -- Produktnamn
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0), -- Pris > 0
    IsActive BIT NOT NULL DEFAULT 1,           -- Om produkten är aktiv
    CategoryId INT NOT NULL,                  -- FK till Category
    FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
);

-- 4. Store (Lager)

CREATE TABLE Store (
    StoreId INT IDENTITY PRIMARY KEY,
    Name VARCHAR(100),                        -- Lagernamn
    ProductId INT NOT NULL UNIQUE,            -- En lagerpost per produkt
    StockQuantity INT NOT NULL DEFAULT 0 CHECK (StockQuantity >= 0),
    LastUpdated DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);


-- 5. Order (Beställningar)

CREATE TABLE [Order] (
    OrderId INT IDENTITY PRIMARY KEY,
    OrderDate DATETIME DEFAULT GETDATE(),     -- Datum för order
    Status VARCHAR(50) NOT NULL DEFAULT 'Pending',
    TotalAmount DECIMAL(10,2) CHECK (TotalAmount >= 0),
    CustomerId INT NOT NULL,                  -- FK till Customer
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);


-- 6. OrderItem (Orderrader)

CREATE TABLE OrderItem (
    OrderItemId INT IDENTITY PRIMARY KEY,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice > 0),

    -- Samma produkt får inte finnas två gånger i samma order
    CONSTRAINT UQ_Order_Product UNIQUE (OrderId, ProductId),

    FOREIGN KEY (OrderId) REFERENCES [Order](OrderId),
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);

--// RELATIONER ()


-- En kund kan ha många ordrar, men en order tillhör exakt en kund
--Ref: Customer.CustomerId < Order.CustomerId

-- En kategori kan innehålla många produkter, men en produkt tillhör en kategori
--Ref: Category.CategoryId < Product.CategoryId

-- En order kan ha många orderrader
--Ref: Order.OrderId < OrderItem.OrderId

-- En produkt kan förekomma i många orderrader
--Ref: Product.ProductId < OrderItem.ProductId

-- Varje produkt har exakt en lagerpost
--Ref: Product.ProductId < Store.ProductId
