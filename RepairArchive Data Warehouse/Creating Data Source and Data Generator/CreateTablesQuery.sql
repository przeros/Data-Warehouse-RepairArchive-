/*CREATE DATABASE RepairArchive*/

USE [RepairArchive]
GO

CREATE TABLE [parts] (
  [part_id] int PRIMARY KEY IDENTITY(1, 1),
  [part_model] nvarchar(255),
  [part_type] nvarchar(255),
  [part_cost] int,
  [production_date]date
)
GO

CREATE TABLE [planes] (
  [plane_id] int PRIMARY KEY IDENTITY(1, 1),
  [model] nvarchar(255),
  [type] nvarchar(255),
  [capacity] int,
  [year_of_production] int
)
GO

CREATE TABLE [mechanics] (
  [mechanic_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [surname] nvarchar(255),
  [age] int,
  [employment_date] date,
  [salary] int
)
GO

CREATE TABLE [repairs] (
  [code_of_repair] int PRIMARY KEY IDENTITY(1, 1),
  [start_date] datetime,
  [end_date] datetime,
  [repair_time(days)] int,
  [repair_costs] float,
  [plane_id] int
)
GO

CREATE TABLE [tests] (
  [code_of_test] int PRIMARY KEY IDENTITY(1, 1),
  [test_name] nvarchar(255),
  [result] nvarchar(255),
  [description] nvarchar(255),
  [code_of_repair] int
)
GO

CREATE TABLE [parts_used_in_repair] (
  [code_of_repair] int,
  [part_id] int
  PRIMARY KEY([code_of_repair], [part_id])
)
GO

CREATE TABLE [making_repairs] (
  [code_of_repair] int,
  [mechanic_id] int,
  PRIMARY KEY([code_of_repair], [mechanic_id])
)
GO

ALTER TABLE [parts_used_in_repair] ADD FOREIGN KEY ([code_of_repair]) REFERENCES [repairs] ([code_of_repair])
GO

ALTER TABLE [parts_used_in_repair] ADD FOREIGN KEY ([part_id]) REFERENCES [parts] ([part_id])
GO

ALTER TABLE [making_repairs] ADD FOREIGN KEY ([mechanic_id]) REFERENCES [mechanics] ([mechanic_id])
GO

ALTER TABLE [making_repairs] ADD FOREIGN KEY ([code_of_repair]) REFERENCES [repairs] ([code_of_repair])
GO

ALTER TABLE [repairs] ADD FOREIGN KEY ([plane_id]) REFERENCES [planes] ([plane_id])
GO

ALTER TABLE [tests] ADD FOREIGN KEY ([code_of_repair]) REFERENCES [repairs] ([code_of_repair])
GO
