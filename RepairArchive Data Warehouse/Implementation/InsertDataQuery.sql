USE [RepairArchiveWarehouse]
GO

BULK INSERT dbo.Dim_date FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab4\Dim_date.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.Dim_time FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab4\Dim_time.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.Dim_part FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab4\Dim_part.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.Dim_mechanic FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab4\Dim_mechanic.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.Dim_plane FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab4\Dim_plane.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.Dim_test FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab4\Dim_test.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.F_plane_repair FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab4\F_plane_repair.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.F_parts_used_in_repair FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab4\F_parts_used_in_repair.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.F_making_repair FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab4\F_making_repair.txt' WITH (FIELDTERMINATOR='|')
