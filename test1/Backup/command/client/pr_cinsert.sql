DELETE FROM Client WHERE caccount = 'test'
DELETE FROM ClientInfo WHERE cname = 'test'
DELETE FROM Phone WHERE cphone = '12345678'
DROP PROC IF EXISTS pr_cinsert
GO
CREATE PROCEDURE pr_cinsert
    @caccount NVARCHAR(100),
    @cpassword NVARCHAR(64),
    @cname NVARCHAR(50),
    @cbirthday NVARCHAR(10),
    @cgender NVARCHAR(50),
    @id CHAR(20),
    @cphone NVARCHAR(20),
    @emergency NVARCHAR(50),
    @emergencyphone NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRANSACTION
    BEGIN TRY
    DECLARE @cid INT, @birthday DATETIME, @cpassword_h NVARCHAR(64)
    SET @birthday = CONVERT(DATETIME, @cbirthday)
    SET @cpassword_h = CONVERT(NVARCHAR(64), HASHBYTES('SHA2_256', @cpassword), 2)
    INSERT INTO Phone
        (id, cphone, emergencyphone)
    VALUES
        (@id, @cphone, @emergencyphone)
    INSERT INTO ClientInfo
        (cname, id, cbirthday, cgender, [emergency])
    VALUES
        (@cname, @id, @birthday, @cgender, @emergency)
    SET @cid = SCOPE_IDENTITY()
    INSERT INTO Client
        (cid, caccount, cpassword)
    VALUES
        (@cid, @caccount, @cpassword_h) 
    COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
    ROLLBACK TRANSACTION
    THROW
    END CATCH
END
GO
EXEC pr_cinsert 'test', 'test', 'test', '1985-11-11', 'M', 'J123456789', '12345678', 'test', '12345678'