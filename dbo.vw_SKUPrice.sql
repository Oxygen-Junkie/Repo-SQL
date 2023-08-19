CREATE VIEW dbo.SKUPrice AS
SELECT *, dbo.GETSKUPrice(ID_SKU) as WholePrice FROM dbo.Basket;
