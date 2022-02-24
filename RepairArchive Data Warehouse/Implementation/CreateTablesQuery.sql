/*CREATE DATABASE RepairArchiveWarehouse*/

USE [RepairArchiveWarehouse]
GO

CREATE TABLE [Dim_part] (
  [Id_part] int PRIMARY KEY IDENTITY(-1, 1),
  [part_model] nvarchar(255),
  [part_type] nvarchar(255),
  [part_cost_category] nvarchar(255),
  [production_date_category] nvarchar(255)
)
GO

CREATE TABLE [Dim_plane] (
  [Id_plane_Sk] int PRIMARY KEY IDENTITY(-1, 1),
  [Id_plane_Bk] int,
  [model] nvarchar(255),
  [type] nvarchar(255),
  [capacity_category] nvarchar(255),
  [year_of_production_category] nvarchar(255),
  [insertion_date] smalldatetime,
  [disactivation_date] smalldatetime
)
GO

CREATE TABLE [Dim_mechanic] (
  [Id_mechanic] int PRIMARY KEY IDENTITY(-1, 1),
  [name] nvarchar(255),
  [surname] nvarchar(255),
  [age_category] nvarchar(255),
  [employment_date_category] nvarchar(255),
  [mechanic_salary_category] nvarchar(255)
)
GO

CREATE TABLE [F_plane_repair] (
  [Id_repair] int PRIMARY KEY IDENTITY(1, 1),
  [Id_test] int NOT NULL,
  [Id_plane] int NOT NULL,
  [Id_start_date] int NOT NULL,
  [Id_end_date] int NOT NULL,
  [Id_start_time] int NOT NULL,
  [Id_end_time] int NOT NULL,
  [repair_time] int NOT NULL,
  [repair_cost] float NOT NULL,
  [is_successful] int NOT NULL, 
)
GO

CREATE TABLE [Dim_test] (
  [Id_test] int PRIMARY KEY IDENTITY(-1, 1),
  [test_name] nvarchar(255),
  [result] nvarchar(255),
  [description] nvarchar(255)
)
GO

CREATE TABLE [F_parts_used_in_repair] (
  [Id_repair] int,
  [Id_part] int
  PRIMARY KEY ([Id_repair], [Id_part])
)
GO

CREATE TABLE [F_making_repair] (
  [Id_repair] int,
  [Id_mechanic] int,
  [time_of_repair] int,
  [successful_repair] int
  PRIMARY KEY ([Id_repair], [Id_mechanic])
)
GO

CREATE TABLE [Dim_date] (
  [Id_date] int PRIMARY KEY,
  [date] date,
  [year] nvarchar(4),
  [month] nvarchar(255),
  [day] nvarchar(255)
)
GO

CREATE TABLE [Dim_time] (
  [Id_time] int PRIMARY KEY,
  [hour] int
)
GO

ALTER TABLE [F_plane_repair] ADD FOREIGN KEY ([Id_plane]) REFERENCES [Dim_plane] ([Id_plane_Sk])
GO

ALTER TABLE [F_making_repair] ADD FOREIGN KEY ([Id_mechanic]) REFERENCES [Dim_mechanic] ([Id_mechanic])
GO

ALTER TABLE [F_making_repair] ADD FOREIGN KEY ([Id_repair]) REFERENCES [F_plane_repair] ([Id_repair])
GO

ALTER TABLE [F_parts_used_in_repair] ADD FOREIGN KEY ([Id_part]) REFERENCES [Dim_part] ([Id_part])
GO

ALTER TABLE [F_parts_used_in_repair] ADD FOREIGN KEY ([Id_repair]) REFERENCES [F_plane_repair] ([Id_repair])
GO

ALTER TABLE [F_plane_repair] ADD FOREIGN KEY ([Id_test]) REFERENCES [Dim_test] ([Id_test])
GO

ALTER TABLE [F_plane_repair] ADD FOREIGN KEY ([Id_start_date]) REFERENCES [Dim_date] ([Id_date])
GO

ALTER TABLE [F_plane_repair] ADD FOREIGN KEY ([Id_end_date]) REFERENCES [Dim_date] ([Id_date])
GO

ALTER TABLE [F_plane_repair] ADD FOREIGN KEY ([Id_start_time]) REFERENCES [Dim_time] ([Id_time])
GO

ALTER TABLE [F_plane_repair] ADD FOREIGN KEY ([Id_end_time]) REFERENCES [Dim_time] ([Id_time])
GO