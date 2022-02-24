/*DROP TABLE tempRepair;
CREATE TABLE tempRepair (
  [Id_repair] int PRIMARY KEY IDENTITY(1, 1),
  [Id_test] int NOT NULL,
  [Id_plane] int NOT NULL,
  [Id_start_date] int NOT NULL,
  [Id_end_date] int NOT NULL,
  [Id_start_time] int NOT NULL,
  [Id_end_time] int NOT NULL,
  [repair_time] int NOT NULL,
  [repair_cost] float NOT NULL,
  [is_successful] int NOT NULL, 
  UNIQUE([Id_test], [Id_plane], [Id_start_date], [Id_end_date], [Id_start_time], [Id_end_time])
)*/
DECLARE @start_datetime DATETIME;
DECLARE @end_datetime DATETIME;
DECLARE @start_date DATE;
DECLARE @end_date DATE;
DECLARE @start_time INT;
DECLARE @end_time INT;
DECLARE @repair_time INT;
DECLARE @repair_cost FLOAT;
DECLARE @plane_id INT;

DECLARE @test_name NVARCHAR(255);
DECLARE @test_result NVARCHAR(255);
DECLARE @test_description NVARCHAR(255);
DECLARE @test_code_of_repair INT;

DECLARE @iterator INT = 1;
DECLARE @id1 INT;
DECLARE @id2 INT;
DECLARE @id3 INT;
DECLARE @id4 INT;
DECLARE @id_plane INT;
DECLARE @id_test INT;
DECLARE @is_successful INT;

use [RepairArchive]

DECLARE @number_of_rows INT = (SELECT COUNT(*) FROM dbo.repairs);

WHILE @iterator <= @number_of_rows
BEGIN
use [RepairArchive]

SELECT @start_datetime = repairs.start_date, @end_datetime = repairs.end_date, @repair_time = repairs.[repair_time(days)], @repair_cost = repairs.repair_costs, @plane_id = repairs.plane_id
FROM repairs
WHERE code_of_repair = @iterator;

SET @start_time = DATEPART(HOUR, @start_datetime);
SET @end_time = DATEPART(HOUR, @end_datetime);
SET @start_date = CAST(@start_datetime AS DATE);
SET @end_date = CAST(@end_datetime AS DATE);

SELECT @test_name = tests.test_name, @test_result = tests.result, @test_description = tests.description, @test_code_of_repair = tests.code_of_repair
FROM tests
WHERE code_of_repair = @iterator;

use [RepairArchiveWarehouse]

SELECT @id1 = Id_date 
FROM Dim_date
WHERE @start_date = Dim_date.date

SELECT @id2 = Id_date 
FROM Dim_date
WHERE @end_date = Dim_date.date

SELECT @id3 = Id_time 
FROM Dim_time
WHERE @start_time = Dim_time.hour

SELECT @id4 = Id_time
FROM Dim_time
WHERE @end_time = Dim_time.hour

SELECT @id_plane = Id_plane_Sk
FROM Dim_plane
WHERE @plane_id = Id_plane_Bk

SELECT TOP(1) @id_test = Id_test
FROM Dim_test
WHERE test_name = @test_name 
AND result = @test_result 
AND Dim_test.description = @test_description

IF @test_result = 'Success'
	SET @is_successful = 1;
ELSE
	SET @is_successful = 0;

IF @start_datetime IS NULL 
BEGIN
	SET @id1 = -1; 
	SET @id3 = -1; 
END
IF @end_datetime IS NULL
BEGIN
	SET @id2 = -1; 
	SET @id4 = -1; 
END
PRINT @plane_id;
IF @plane_id IS NULL
BEGIN
	SET @id_plane = -1; 
END

/*INSERT INTO tempRepair VALUES(@id_test, @id_plane, @id1, @id2, @id3, @id4, @repair_time, @repair_cost, @is_successful);*/
INSERT INTO F_plane_repair VALUES(@id_test, @id_plane, @id1, @id2, @id3, @id4, @repair_time, @repair_cost, @is_successful);

SET @iterator = @iterator + 1;
END

SELECT * FROM F_plane_repair

