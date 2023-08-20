 CREATE TRIGGER Basket_insert_update ON dbo.Basket
    AFTER INSERT AS
    BEGIN
      DECLARE @DiscountValue AS decimal(18, 2);
      SET @DiscountValue = 0;

      IF (1 < (SELECT count(*) FROM dbo.Basket WHERE ID_SKU = inserted.ID_SKU AND PurchaseDate = GETDATE())) 
        BEGIN
          SET @DiscountValue = CAST(inserted.Value * 5 as decimal(18, 2)) / 100;
        END;

      UPDATE dbo.Basket
      SET DiscountValue = @DiscountValue
      WHERE ID_SKU = inserted.ID_SKU;
    END;