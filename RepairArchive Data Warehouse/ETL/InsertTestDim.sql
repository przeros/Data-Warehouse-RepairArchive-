USE [RepairArchive]
GO
DECLARE @test_id INT = 1;
DECLARE @maxID INT = 0;
DECLARE @test_name nvarchar(255);
DECLARE @result nvarchar(255);
DECLARE @description nvarchar(255);

SELECT @maxID = COUNT(0) FROM dbo.parts;

USE [RepairArchiveWarehouse]
IF NOT EXISTS (SELECT * FROM Dim_test WHERE Id_test = -1)
	INSERT INTO Dim_test VALUES('Unknown', 'Unknown', 'Unknown');

WHILE @test_id <= @maxID
BEGIN
	USE [RepairArchive]

	SELECT @test_name = test_name, @result = result, @description = description
	FROM dbo.tests
	WHERE code_of_test = @test_id;

	USE [RepairArchiveWarehouse]
	BEGIN TRY
		INSERT INTO Dim_test VALUES(@test_name, @result, @description);
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;

	SET @test_id = @test_id + 1;
END;

USE [RepairArchiveWarehouse]
SELECT * FROM Dim_test