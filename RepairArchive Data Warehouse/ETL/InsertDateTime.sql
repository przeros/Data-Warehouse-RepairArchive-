USE [RepairArchiveWarehouse]
GO

BULK INSERT dbo.Dim_date FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab5\date.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.Dim_time FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab5\time.txt' WITH (FIELDTERMINATOR='|')

