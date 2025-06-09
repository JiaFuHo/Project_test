DROP FUNCTION IF EXISTS fn_cInfo
GO
CREATE FUNCTION fn_cInfo(@account NVARCHAR(100)) RETURNS TABLE AS 
RETURN (SELECT cname AS name, cgender AS gender, FORMAT(cbirthday, 'yyyy-MM-dd') AS birthday, cphone AS phone, [emergency], emergencyphone AS emergency_phone
FROM Client INNER JOIN ClientInfo ON Client.cid = ClientInfo.cid
WHERE caccount = @account)
GO
SELECT *
FROM dbo.fn_cInfo('test1')
-- done