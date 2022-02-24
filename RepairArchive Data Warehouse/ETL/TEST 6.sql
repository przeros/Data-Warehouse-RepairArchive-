USE [RepairArchive]

UPDATE repairs
SET plane_id = NULL
WHERE code_of_repair = 2

/*original*/
UPDATE repairs
SET plane_id = 921
WHERE code_of_repair = 2