DROP VIEW IF EXISTS vw_client
GO
CREATE VIEW vw_client
AS
    SELECT cname AS [name], cgender AS gender, FORMAT(cbirthday, 'yyyy-MM-dd') AS birthday, cphone AS phone, [emergency], emergencyphone AS emergency_phone
    FROM ClientInfo
GO
SELECT *
FROM vw_client