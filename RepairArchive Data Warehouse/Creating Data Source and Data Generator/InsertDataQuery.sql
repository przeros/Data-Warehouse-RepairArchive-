USE [RepairArchive]
GO

BULK INSERT dbo.parts FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab2\parts1.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.mechanics FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab2\mechanics1.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.planes FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab2\planes1.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.repairs FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab2\repairs1.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.tests FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab2\tests1.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.parts_used_in_repair FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab2\parts_used_in_repairs1.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.making_repairs FROM 'C:\Users\Przemek\OneDrive\Pulpit\PG SEM 5\Hurtownie danych\LAB\lab2\making_repairs1.txt' WITH (FIELDTERMINATOR='|')

