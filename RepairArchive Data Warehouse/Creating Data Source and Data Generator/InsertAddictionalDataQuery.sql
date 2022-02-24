USE [RepairArchive]
GO

BULK INSERT dbo.mechanics FROM 'C:\Users\Przemek\PycharmProjects\dataGenerator\mechanics2.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.repairs FROM 'C:\Users\Przemek\PycharmProjects\dataGenerator\repairs2.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.tests FROM 'C:\Users\Przemek\PycharmProjects\dataGenerator\tests2.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.parts_used_in_repair FROM 'C:\Users\Przemek\PycharmProjects\dataGenerator\parts_used_in_repairs2.txt' WITH (FIELDTERMINATOR='|')

BULK INSERT dbo.making_repairs FROM 'C:\Users\Przemek\PycharmProjects\dataGenerator\making_repairs2.txt' WITH (FIELDTERMINATOR='|')
