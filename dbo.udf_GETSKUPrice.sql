CREATE FUNCTION dbo.GETSKUPrice(
    @ID_SKU int
)
RETURNS decimal(18, 2) AS
BEGIN
    RETURN (SELECT sum(Value) / sum(Quantity) FROM dbo.Basket WHERE ID_SKU=@ID_SKU);
END;