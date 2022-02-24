USE [RepairArchive]
GO
DECLARE @mechanic_id INT = 1;
DECLARE @maxID INT = 0;
DECLARE @mechanic_name nvarchar(255);
DECLARE @mechanic_surname nvarchar(255);
DECLARE @mechanic_age int;
DECLARE @mechanic_employment_date DATE;
DECLARE @mechanic_salary int;
DECLARE @mechanic_age_category nvarchar(255);
DECLARE @mechanic_employment_date_category nvarchar(255);
DECLARE @mechanic_salary_category nvarchar(255);

SELECT @maxID = COUNT(0) FROM dbo.mechanics;

USE [RepairArchiveWarehouse]
IF NOT EXISTS (SELECT * FROM Dim_mechanic WHERE Id_mechanic = -1)
	INSERT INTO Dim_mechanic VALUES('Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown');

WHILE @mechanic_id <= @maxID
BEGIN
	USE [RepairArchive]

	SELECT @mechanic_name = mechanics.name, @mechanic_surname = mechanics.surname, @mechanic_age = mechanics.age, @mechanic_employment_date = mechanics.employment_date, @mechanic_salary = mechanics.salary
	FROM dbo.mechanics
	WHERE mechanics.mechanic_id = @mechanic_id;
	
	IF @mechanic_age < 30
		SET @mechanic_age_category = 'young';
	ELSE IF @mechanic_age < 43
		SET @mechanic_age_category = 'middle-aged';
	ELSE IF @mechanic_age < 57
		SET @mechanic_age_category = 'adult';
	ELSE
		SET @mechanic_age_category = 'senior';

	IF YEAR(@mechanic_employment_date) < 1980
		SET @mechanic_employment_date_category = 'very old';
	ELSE IF YEAR(@mechanic_employment_date) < 1990
		SET @mechanic_employment_date_category = 'old';
	ELSE IF YEAR(@mechanic_employment_date) < 2000
		SET @mechanic_employment_date_category = 'average';
	ELSE
		SET @mechanic_employment_date_category = 'new';

	IF @mechanic_salary = 5000
		SET @mechanic_salary_category = 'very low';
	ELSE IF @mechanic_salary = 7000
		SET @mechanic_salary_category = 'low';
	ELSE IF @mechanic_salary = 11000
		SET @mechanic_salary_category = 'average';
	ELSE IF @mechanic_salary = 15000
		SET @mechanic_salary_category = 'high';
	ELSE
		SET @mechanic_salary_category = 'very high';

	USE [RepairArchiveWarehouse]
	BEGIN TRY
		INSERT INTO Dim_mechanic VALUES(@mechanic_name, @mechanic_surname, @mechanic_age_category, @mechanic_employment_date_category, @mechanic_salary_category);
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;

	SET @mechanic_id = @mechanic_id + 1;
END;

SELECT * FROM Dim_mechanic