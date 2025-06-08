DROP VIEW IF EXISTS vw_croom
GO
CREATE VIEW vw_croom
AS
    SELECT rid, tdesc, rlimit, [status], rdesc
    FROM Room INNER JOIN [Type] ON Room.tid = [Type].tid
    WHERE [status] = 'Available'
GO
SELECT *
FROM vw_croom