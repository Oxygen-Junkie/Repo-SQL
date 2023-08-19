CREATE PROCEDURE MakeFamilyPurchase(@FamilySurName varchar(255))
    AS
        BEGIN
        IF NOT EXISTS(SELECT 1 FROM dbo.Family WHERE SurName=@FamilySurName)
                BEGIN
                    RAISERROR('Фамилия не найдена', 1, 1);
                END

                UPDATE dbo.Family 
                SET BudgetValue=
                    (SELECT sum(dbo.Basket.Value) 
                    FROM dbo.Basket JOIN dbo.Family 
                    ON dbo.Basket.ID_Family=dbo.Family.ID
                    WHERE dbo.Family.SurName=@FamilySurName)
                WHERE SurName=@FamilySurName
        END