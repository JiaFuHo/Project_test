DROP PROC IF EXISTS pr_cupdate
GO
CREATE PROCEDURE pr_cupdate
    @caccount NVARCHAR(100),
    @cpassword NVARCHAR(64),
    @cname NVARCHAR(50),
    @cphone NVARCHAR(20),
    @emergency NVARCHAR(50),
    @emergencyphone NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRANSACTION
    BEGIN TRY
    DECLARE @cid INT, @id CHAR(20)
    SELECT @cid = Client.cid, @id = id
    FROM Client INNER JOIN ClientInfo ON Client.cid = ClientInfo.cid
    WHERE @caccount = caccount
    IF @cpassword IS NOT NULL
    BEGIN
        UPDATE Client SET cpassword = CONVERT(NVARCHAR(64), HASHBYTES('SHA2_256', @cpassword), 2)
        WHERE Client.cid = @cid
    END
    IF @cname IS NOT NULL
    BEGIN
        UPDATE ClientInfo SET cname = @cname
        WHERE ClientInfo.cid = @cid
    END
    IF @cphone IS NOT NULL
    BEGIN
        UPDATE Phone SET cphone = @cphone
        WHERE Phone.id = @id
    END
    IF @emergency IS NOT NULL
    BEGIN
        UPDATE ClientInfo SET emergency = @emergency
        WHERE ClientInfo.cid = @cid
    END
    IF @emergencyphone IS NOT NULL
    BEGIN
        UPDATE Phone SET emergencyphone = @emergencyphone
        WHERE Phone.id = @id
    END
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
    ROLLBACK TRANSACTION
    THROW
    END CATCH
END
GO
EXEC pr_cupdate 'test', 'admin', 'admin', '98765432', 'admin', '98765432'