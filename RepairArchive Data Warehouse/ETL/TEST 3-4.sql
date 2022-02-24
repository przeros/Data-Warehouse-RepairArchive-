USE [RepairArchive]
/*TEST 3*/
UPDATE planes
SET capacity = 400
WHERE plane_id = 2000

/* ETL */

/*original*/
/*UPDATE planes
SET capacity = 20
WHERE plane_id = 2000*/

/*TEST 4*/
UPDATE repairs
SET plane_id = 2000
WHERE code_of_repair = 1000

/* ETL */

/*original*/
/*UPDATE repairs
SET plane_id = 1672
WHERE code_of_repair = 1000*/