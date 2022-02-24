USE [RepairArchive]
GO
DECLARE @plane_id INT = 1;
DECLARE @maxID INT = 0;
DECLARE @maxID1 INT = 0;
DECLARE @maxID2 INT = 0;
DECLARE @plane_business_id INT;
DECLARE @plane_model nvarchar(255);
DECLARE @plane_type nvarchar(255);
DECLARE @capacity INT;
DECLARE @capacity_category nvarchar(255);
DECLARE @year_of_production nvarchar(255);
DECLARE @year_of_production_category nvarchar(255);
DECLARE @insertion_date smalldatetime;
DECLARE @disactivation_date smalldatetime = NULL;

SELECT @maxID1 = COUNT(0) FROM dbo.planes;
USE [RepairArchiveWarehouse]
SELECT @maxID2 = COUNT(0) FROM dbo.Dim_plane;
IF @maxID1 >= @maxID2
	SET @maxID = @maxID1;
ELSE
	SET @maxID = @maxID2;

USE [RepairArchiveWarehouse]
IF NOT EXISTS (SELECT * FROM Dim_plane WHERE Id_plane_Sk = -1)
	INSERT INTO Dim_plane VALUES('-1', 'Unknown', 'Unknown', 'Unknown', 'Unknown', NULL, NULL);

WHILE @plane_id <= @maxID
BEGIN
	USE [RepairArchive]

	SELECT @plane_business_id = plane_id, @plane_model = model, @plane_type = type, @capacity = capacity, @year_of_production = year_of_production  
	FROM dbo.planes
	WHERE plane_id = @plane_id;
	
	IF @capacity < 125
		SET @capacity_category = 'small';
	ELSE IF @capacity < 200
		SET @capacity_category = 'medium';
	ELSE
		SET @capacity_category = 'large';

	IF @year_of_production < 1980
		SET @year_of_production_category = 'very old';
	ELSE IF @year_of_production < 1990
		SET @year_of_production_category = 'old';
	ELSE IF @year_of_production < 2000
		SET @year_of_production_category = 'average';
	ELSE
		SET @year_of_production_category = 'new';

	SET @insertion_date = GETDATE();

	USE [RepairArchiveWarehouse]
	UPDATE Dim_plane
		SET disactivation_date = @insertion_date
	WHERE Id_plane_Bk = @plane_business_id 
	AND disactivation_date IS NULL
	AND (model != @plane_model OR type != @plane_type OR capacity_category != @capacity_category OR year_of_production_category != @year_of_production_category)

	BEGIN TRY
		IF NOT EXISTS (SELECT * FROM Dim_plane WHERE (@plane_business_id = Id_plane_Bk AND  model = @plane_model AND type = @plane_type AND capacity_category = @capacity_category AND year_of_production_category = @year_of_production_category))
			INSERT INTO Dim_plane VALUES(@plane_business_id, @plane_model, @plane_type, @capacity_category, @year_of_production_category, @insertion_date, @disactivation_date);
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;

	SET @plane_id = @plane_id + 1;
END;

USE [RepairArchiveWarehouse]
SELECT * FROM Dim_plane