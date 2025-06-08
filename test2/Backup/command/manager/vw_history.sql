DROP VIEW IF EXISTS vw_history
GO
CREATE VIEW vw_history
AS
    SELECT Client.cid, cname, cgender, FORMAT(cbirthday, 'yyyy-MM-dd') AS birthday, SUM(fee) AS sum_fee
    FROM History INNER JOIN Client ON History.caccount = Client.caccount INNER JOIN ClientInfo ON Client.cid = ClientInfo.cid
    GROUP BY Client.cid, cname, cgender, cbirthday
GO
SELECT *
FROM vw_history