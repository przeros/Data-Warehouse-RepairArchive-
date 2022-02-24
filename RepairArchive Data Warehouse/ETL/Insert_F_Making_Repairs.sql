use [RepairArchiveWarehouse]

DECLARE @id_repair INT;
DECLARE @id_mechanic INT;

DECLARE @mechanic_id INT;
DECLARE @repair_id INT;
DECLARE @mechanic_name NVARCHAR(255);
DECLARE @mechanic_surname NVARCHAR(255);
DECLARE @mechanic_age INT;
DECLARE @mechanic_employment_date DATE;
DECLARE @mechanic_age_category NVARCHAR(255);
DECLARE @mechanic_employment_date_category NVARCHAR(255);
DECLARE @mechanic_salary INT;
DECLARE @mechanic_salary_category NVARCHAR(255);

DECLARE  @time_of_repair INT;
DECLARE  @successful_repair INT;

use [RepairArchive]

DECLARE @number_of_rows INT = (SELECT COUNT(*) FROM dbo.making_repairs);

DECLARE db_cursor CURSOR FOR 
SELECT TOP(@number_of_rows) code_of_repair, mechanic_id
FROM making_repairs

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @repair_id, @mechanic_id

WHILE @@FETCH_STATUS = 0  
BEGIN  
	use [RepairArchive]

	SET @id_repair = @repair_id;

	SELECT @mechanic_name = mechanics.name, @mechanic_surname = surname, @mechanic_age = age, @mechanic_employment_date = employment_date, @mechanic_salary = salary
	FROM mechanics
	WHERE mechanic_id = @mechanic_id

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

	use [RepairArchiveWarehouse]

	SELECT TOP(1) @id_mechanic = Id_mechanic
	FROM Dim_mechanic
	WHERE Dim_mechanic.name = @mechanic_name
	AND surname = @mechanic_surname 
	AND age_category = @mechanic_age_category
	AND employment_date_category = @mechanic_employment_date_category
	AND mechanic_salary_category = @mechanic_salary_category

	SELECT TOP(1) @time_of_repair = repair_time, @successful_repair = is_successful
	FROM F_plane_repair
	WHERE Id_repair = @id_repair

	/*INSERT INTO tempMakingRepairs VALUES(@id_repair, @id_mechanic, @time_of_repair, @successful_repair);*/
	INSERT INTO F_making_repair VALUES(@id_repair, @id_mechanic, @time_of_repair, @successful_repair);

    FETCH NEXT FROM db_cursor INTO @repair_id, @mechanic_id
END 

CLOSE db_cursor  
DEALLOCATE db_cursor

SELECT * FROM F_making_repair
ORDER BY Id_repair

