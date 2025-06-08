DROP PROC IF EXISTS pr_creserve
GO
CREATE PROCEDURE pr_creserve
    @caccount NVARCHAR(100),
    @citime NVARCHAR(10),
    @day INT,
    @rid INT
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRANSACTION
    BEGIN TRY
    DECLARE @reid INT, @rprice INT, @time DATETIME2, @cmonth nvarchar , @cbmonth nvarchar , @discount FLOAT, @fee FLOAT
    SELECT @rprice = rprice
    FROM Price INNER JOIN Room ON Price.rlimit = Room.rlimit
    WHERE @rid = rid
    SET @time = CONVERT(DATETIME2, @citime)
    SET @cmonth = MONTH(GETDATE())
    SET @cbmonth = FORMAT((SELECT cbirthday
    FROM ClientInfo INNER JOIN Client ON ClientInfo.cid = Client.cid
    WHERE @caccount = caccount), 'M')
    IF @cmonth =  @cbmonth 
    BEGIN
        SET @discount = 0.9
    END 
    ELSE 
    BEGIN
        SET @discount = 1
    END
    SET @fee = @rprice * @day * @discount
    IF @fee IS NOT NULL
    BEGIN
        INSERT INTO Reserve
            (caccount, citime, [day], rid)
        VALUES
            (@caccount, @time, @day, @rid)
        SET @reid = SCOPE_IDENTITY()
        INSERT INTO History
            (caccount, fee, reid)
        VALUES
            (@caccount, @fee, @reid)
        UPDATE Room
        SET sid = 2
        WHERE rid = @rid
    END
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
    ROLLBACK TRANSACTION
    THROW
    END CATCH
END
GO
EXEC pr_creserve 'test', '2025-04-24', '3', '29'