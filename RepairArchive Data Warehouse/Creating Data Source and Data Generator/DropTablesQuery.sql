USE [RepairArchive]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[making_repairs]') AND type in (N'U'))
DROP TABLE [dbo].[making_repairs]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mechanics]') AND type in (N'U'))
DROP TABLE [dbo].[mechanics]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[parts_used_in_repair]') AND type in (N'U'))
DROP TABLE [dbo].[parts_used_in_repair]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tests]') AND type in (N'U'))
DROP TABLE [dbo].[tests]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[parts]') AND type in (N'U'))
DROP TABLE [dbo].[parts]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[repairs]') AND type in (N'U'))
DROP TABLE [dbo].[repairs]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[planes]') AND type in (N'U'))
DROP TABLE [dbo].[planes]
GO