DROP FUNCTION IF EXISTS fn_chistory
GO
CREATE FUNCTION fn_chistory(@account NVARCHAR(100)) RETURNS TABLE AS 
RETURN (SELECT Room.rid, tdesc, FORMAT(citime, 'yyyy-MM-dd') AS citime, [day], fee
FROM History INNER JOIN Reserve ON History.reid = Reserve.reid INNER JOIN ROOM ON Reserve.rid = Room.rid INNER JOIN [Type] ON Room.tid = [Type].tid
WHERE Reserve.caccount = @account)
GO
SELECT *
FROM dbo.fn_chistory('test4')
-- done