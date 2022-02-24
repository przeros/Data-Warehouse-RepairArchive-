USE [RepairArchiveWarehouse]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dim_date]') AND type in (N'U'))
DROP TABLE [dbo].[Dim_date]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dim_time]') AND type in (N'U'))
DROP TABLE [dbo].[Dim_time]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dim_test]') AND type in (N'U'))
DROP TABLE [dbo].[Dim_test]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dim_plane]') AND type in (N'U'))
DROP TABLE [dbo].[Dim_plane]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dim_mechanic]') AND type in (N'U'))
DROP TABLE [dbo].[Dim_mechanic]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_making_repair]') AND type in (N'U'))
DROP TABLE [dbo].[F_making_repair]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dim_part]') AND type in (N'U'))
DROP TABLE [dbo].[Dim_part]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_parts_used_in_repair]') AND type in (N'U'))
DROP TABLE [dbo].[F_parts_used_in_repair]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_plane_repair]') AND type in (N'U'))
DROP TABLE [dbo].[F_plane_repair]
GO