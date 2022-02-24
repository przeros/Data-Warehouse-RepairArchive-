USE [RepairArchiveWarehouse]
GO

CREATE TABLE Temp (
  [Id_mechanic] int PRIMARY KEY IDENTITY(-1, 1),
  [name] nvarchar(255),
  [surname] nvarchar(255),
  [age_category] nvarchar(255),
  [employment_date_category] nvarchar(255),
  [mechanic_salary_category] nvarchar(255)
)

BULK INSERT Temp FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab5\mechanicDim.csv' WITH (FIELDTERMINATOR='|')

DECLARE @mechanic_id INT = 1;
DECLARE @maxID INT = 0;
DECLARE @mechanic_name nvarchar(255);
DECLARE @mechanic_surname nvarchar(255);
DECLARE @mechanic_age_category nvarchar(255);
DECLARE @mechanic_employment_date_category nvarchar(255);
DECLARE @mechanic_salary_category nvarchar(255);

SELECT @maxID = COUNT(0) FROM dbo.Temp;

IF NOT EXISTS (SELECT * FROM Dim_mechanic WHERE Id_mechanic = -1)
	INSERT INTO Dim_mechanic VALUES('Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown');

WHILE @mechanic_id <= @maxID - 2
BEGIN

	SELECT @mechanic_name = Temp.name, @mechanic_surname = Temp.surname, @mechanic_age_category = Temp.age_category, @mechanic_employment_date_category = Temp.employment_date_category, @mechanic_salary_category = Temp.mechanic_salary_category
	FROM dbo.Temp
	WHERE Temp.Id_mechanic = @mechanic_id;

	BEGIN TRY
		IF NOT EXISTS (SELECT * FROM Temp WHERE @mechanic_id = -1)
			INSERT INTO Dim_mechanic VALUES(@mechanic_name, @mechanic_surname, @mechanic_age_category, @mechanic_employment_date_category, @mechanic_salary_category);
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;

	SET @mechanic_id = @mechanic_id + 1;
END;

DROP TABLE Temp;

SELECT * FROM Dim_mechanic
