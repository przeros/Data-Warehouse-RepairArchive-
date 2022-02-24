use [RepairArchiveWarehouse]
/*DROP TABLE tempPartsUsed;
CREATE TABLE tempPartsUsed (
  [Id_repair] int,
  [Id_part] int
  PRIMARY KEY (Id_part, Id_repair)
)*/

DECLARE @id_repair INT;
DECLARE @id_part INT;

DECLARE @part_id INT;
DECLARE @repair_id INT;
DECLARE @part_model NVARCHAR(255);
DECLARE @part_type NVARCHAR(255);
DECLARE @part_cost INT;
DECLARE @part_production_date DATE;
DECLARE @part_cost_category NVARCHAR(255);
DECLARE @part_production_date_category NVARCHAR(255);


use [RepairArchive]

DECLARE @number_of_rows INT = (SELECT COUNT(*) FROM dbo.parts_used_in_repair);

DECLARE db_cursor CURSOR FOR 
SELECT TOP(@number_of_rows) code_of_repair, part_id
FROM parts_used_in_repair

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @repair_id, @part_id

WHILE @@FETCH_STATUS = 0  
BEGIN  
	use [RepairArchive]

	SET @id_repair = @repair_id;

	SELECT @part_model = part_model, @part_type = part_type, @part_cost = part_cost, @part_production_date = production_date
	FROM parts
	WHERE part_id = @part_id

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

	IF YEAR(@part_production_date) < 1980
		SET @part_production_date_category = 'very old';
	ELSE IF YEAR(@part_production_date) < 1990
		SET @part_production_date_category = 'old';
	ELSE IF YEAR(@part_production_date) < 2000
		SET @part_production_date_category = 'average';
	ELSE
		SET @part_production_date_category = 'new';

	use [RepairArchiveWarehouse]

	SELECT TOP(1) @id_part = Id_part
	FROM Dim_part
	WHERE part_model = @part_model
	AND part_type = @part_type 
	AND part_cost_category = @part_cost_category
	AND production_date_category = @part_production_date_category

	/*INSERT INTO tempPartsUsed VALUES(@id_repair, @id_part);*/
	INSERT INTO F_parts_used_in_repair VALUES(@id_repair, @id_part);

    FETCH NEXT FROM db_cursor INTO @repair_id, @part_id
END 

CLOSE db_cursor  
DEALLOCATE db_cursor

SELECT * FROM F_parts_used_in_repair
ORDER BY Id_repair

