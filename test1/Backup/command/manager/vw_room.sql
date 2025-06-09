DROP VIEW IF EXISTS vw_room
GO
CREATE VIEW vw_room
AS
    SELECT rid, tdesc, rlimit, [status]
    FROM Room INNER JOIN [Type] ON Room.tid = [Type].tid
GO
SELECT *
FROM vw_room
-- done