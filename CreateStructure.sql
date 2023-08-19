CREATE TABLE dbo.SKU  
 (  
   ID int PRIMARY KEY IDENTITY(1,1),  
   Code as CONCAT('s', ID),
   CONSTRAINT A_Code UNIQUE(Code),
   NAME varchar(255)
);   

CREATE TABLE dbo.Family  
 (  
   ID int PRIMARY KEY IDENTITY(1,1),  
   SurName varchar(255),
   BudgetValue decimal(18, 2)
);   

CREATE TABLE dbo.Basket  
 (  
   ID int IDENTITY(1,1),  
   ID_SKU int NOT NULL,
   ID_Family int NOT NULL,
   Quantity int CHECK(Quantity > 0),
   Value decimal(18, 2) CHECK(Value > 0),
   PurchaseDate date DEFAULT GETDATE(),
   DiscountValue decimal(18, 2),
   CONSTRAINT FK_ID_SKU FOREIGN KEY (ID_SKU) REFERENCES dbo.SKU (ID) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT FK_ID_Family FOREIGN KEY (ID_Family) REFERENCES dbo.Family (ID) ON DELETE CASCADE ON UPDATE CASCADE
);
