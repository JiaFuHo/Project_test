DROP PROC IF EXISTS pr_cdelete
GO
CREATE PROCEDURE pr_cdelete
    @caccount NVARCHAR(100),
    @cpassword NVARCHAR(64)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRANSACTION
    BEGIN TRY
    DECLARE @cid INT, @id CHAR(20), @password NVARCHAR(64)
    SET @password = CONVERT(NVARCHAR(64), HASHBYTES('SHA2_256', @cpassword), 2) 
    SELECT @cid = Client.cid, @id = id
    FROM Client INNER JOIN ClientInfo ON Client.cid = ClientInfo.cid
    WHERE @caccount = caccount AND @password = cpassword
    IF @cid IS NOT NULL
    BEGIN
        DELETE FROM Client WHERE Client.cid = @cid
        DELETE FROM ClientInfo WHERE ClientInfo.cid = @cid
        DELETE FROM Phone WHERE Phone.id = @id
    END
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
    ROLLBACK TRANSACTION
    THROW
    END CATCH
END
GO
EXEC pr_cdelete 'test', 'admin'