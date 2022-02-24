USE [RepairArchive]
GO
DECLARE @part_id INT = 1;
DECLARE @maxID INT = 0;
DECLARE @part_model nvarchar(255);
DECLARE @part_type nvarchar(255);
DECLARE @part_cost INT;
DECLARE @part_cost_category nvarchar(255);
DECLARE @production_date DATE;
DECLARE @production_date_category nvarchar(255);

SELECT @maxID = COUNT(0) FROM dbo.parts;

USE [RepairArchiveWarehouse]
IF NOT EXISTS (SELECT * FROM Dim_part WHERE Id_part = -1)
	INSERT INTO Dim_part VALUES('Unknown', 'Unknown', 'Unknown', 'Unknown');

WHILE @part_id <= @maxID
BEGIN
	USE [RepairArchive]

	SELECT @part_model = part_model, @part_type = part_type, @part_cost = part_cost, @production_date = production_date  
	FROM dbo.parts
	WHERE part_id = @part_id;
	
	IF @part_cost < 20000
		SET @part_cost_category = 'cheap';
	ELSE IF @part_cost < 40000
		SET @part_cost_category = 'below_average';
	ELSE IF @part_cost < 60000
		SET @part_cost_category = 'average';
	ELSE IF @part_cost < 80000
		SET @part_cost_category = 'costly';
	ELSE
		SET @part_cost_category = 'expensive';

	IF YEAR(@production_date) < 1980
		SET @production_date_category = 'very old';
	ELSE IF YEAR(@production_date) < 1990
		SET @production_date_category = 'old';
	ELSE IF YEAR(@production_date) < 2000
		SET @production_date_category = 'average';
	ELSE
		SET @production_date_category = 'new';

	USE [RepairArchiveWarehouse]
	BEGIN TRY
		INSERT INTO Dim_part VALUES(@part_model, @part_type, @part_cost_category, @production_date_category);
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;

	SET @part_id = @part_id + 1;
END;

USE [RepairArchiveWarehouse]
SELECT * FROM Dim_part