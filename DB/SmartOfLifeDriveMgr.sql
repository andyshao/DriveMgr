USE [master]
GO
/****** Object:  Database [SmartOfLifeDriveMgr]    Script Date: 05/03/2017 22:35:01 ******/
CREATE DATABASE [SmartOfLifeDriveMgr] ON  PRIMARY 
( NAME = N'SmartOfLifeDriveMgr', FILENAME = N'I:\项目\SmartOfLife\DB\SmartOfLifeDriveMgr.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SmartOfLifeDriveMgr_log', FILENAME = N'I:\项目\SmartOfLife\DB\SmartOfLifeDriveMgr_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartOfLifeDriveMgr].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET ARITHABORT OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET  DISABLE_BROKER
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET  READ_WRITE
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET RECOVERY FULL
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET  MULTI_USER
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SmartOfLifeDriveMgr] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'SmartOfLifeDriveMgr', N'ON'
GO
USE [SmartOfLifeDriveMgr]
GO
/****** Object:  Table [dbo].[tb_Scores]    Script Date: 05/03/2017 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Scores](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentsID] [bigint] NULL,
	[ScoreOne] [float] NULL,
	[OneStatus] [int] NULL,
	[ScoreTwo] [float] NULL,
	[TwoStatus] [int] NULL,
	[SocreThree] [float] NULL,
	[ThreeStatus] [int] NULL,
	[ScoreFour] [float] NULL,
	[FourStatus] [int] NULL,
	[Remark] [varchar](100) NULL,
 CONSTRAINT [PK_TB_SCORES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于记录学员考试成绩信息。状态为：未考试，已考试。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Scores'
GO
/****** Object:  Table [dbo].[tb_Archives]    Script Date: 05/03/2017 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Archives](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ArchivesCode] [varchar](20) NULL,
	[StudentsID] [bigint] NULL,
	[Remark] [varchar](500) NULL,
 CONSTRAINT [PK_TB_ARCHIVES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于记录学员学籍档案信息。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Archives'
GO
/****** Object:  Table [dbo].[tb_Students]    Script Date: 05/03/2017 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Students](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentsName] [varchar](20) NULL,
	[StudentCode] [varchar](20) NULL,
	[Sex] [bit] NULL,
	[Age] [int] NULL,
	[PhoneNum] [varchar](50) NULL,
	[IsLocal] [bit] NULL,
	[PeriodsID] [int] NULL,
	[CardNum] [varchar](20) NULL,
	[Address] [varchar](200) NULL,
	[PicPath] [varchar](200) NULL,
	[Remark] [varchar](500) NULL,
	[Status] [int] NULL,
	[Operater] [varchar](50) NULL,
	[flag] [int] NULL,
 CONSTRAINT [PK_TB_STUDENTS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'照片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Students', @level2type=N'COLUMN',@level2name=N'PicPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于记录学员基本信息情况。其中状态为：已报名，已考试，退学。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Students'
GO
/****** Object:  View [dbo].[V_Archives]    Script Date: 05/03/2017 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Archives]
AS
SELECT     B.StudentsName, B.StudentCode, A.Remark, A.ArchivesCode, A.StudentsID, A.ID AS ArchivesID, B.CardNum, B.flag
FROM         dbo.tb_Archives AS A LEFT OUTER JOIN
                      dbo.tb_Students AS B ON A.StudentsID = B.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 231
               Bottom = 125
               Right = 390
            End
            DisplayFlags = 280
            TopColumn = 9
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Archives'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Archives'
GO
/****** Object:  View [dbo].[V_ApplyTable]    Script Date: 05/03/2017 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_ApplyTable]
AS
SELECT     dbo.tb_Archives.ArchivesCode, dbo.tb_Students.StudentsName, dbo.tb_Students.StudentCode, dbo.tb_Students.Sex, dbo.tb_Students.Age, dbo.tb_Students.IsLocal, 
                      dbo.tb_Students.CardNum, dbo.tb_Students.Address, dbo.tb_Students.PicPath, dbo.tb_Students.flag, dbo.tb_Students.Status, dbo.tb_Students.ID, 
                      dbo.tb_Students.PhoneNum
FROM         dbo.tb_Students INNER JOIN
                      dbo.tb_Archives ON dbo.tb_Students.ID = dbo.tb_Archives.StudentsID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_Students"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 215
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "tb_Archives"
            Begin Extent = 
               Top = 6
               Left = 235
               Bottom = 125
               Right = 390
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ApplyTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ApplyTable'
GO
/****** Object:  StoredProcedure [dbo].[up_graduater]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_graduater]  --毕业学员统计分析
	-- Add the parameters for the stored procedure here
	@peroidID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select '在学' as cteName, COUNT(1) stuCount from SmartOfLifeDriveMgr.dbo.tb_Students
where flag=1 and Status=0 and PeriodsID=@peroidID    --注意期数的选择    --这期所有在学的有效的学员个数

union
select '毕业' as cteName, COUNT(1) stuCount from SmartOfLifeDriveMgr.dbo.tb_Students
where flag=1  and Status=1 and PeriodsID=@peroidID   --status 1:毕业    --这期所有毕业的有效的学员个数

union
select '退学' as cteName, COUNT(1) stuCount from SmartOfLifeDriveMgr.dbo.tb_Students
where flag=1  and Status=2 and PeriodsID=@peroidID   --status 2:退学    --这期所有退学的有效的学员个数
END
GO
/****** Object:  Table [dbo].[tb_Coach]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Coach](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CoachName] [varchar](20) NULL,
	[CardNum] [varchar](30) NULL,
	[Age] [int] NULL,
	[Sex] [bit] NULL,
	[Phone] [varchar](30) NULL,
	[Address] [varchar](200) NULL,
	[CoachStatus] [int] NULL,
 CONSTRAINT [PK_TB_COACH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于记录教练基本信息。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Coach'
GO
/****** Object:  Table [dbo].[tb_DistributeStudents]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_DistributeStudents](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CoachID] [int] NULL,
	[StudentsID] [bigint] NULL,
	[CreateTime] [datetime] NULL,
	[Operater] [varchar](50) NULL,
	[DistributeStuStatus] [int] NULL,
 CONSTRAINT [PK_TB_DISTRIBUTESTUDENTS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于记录教练分配的学员情况。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_DistributeStudents'
GO
/****** Object:  View [dbo].[V_DistributeStudents]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DistributeStudents]
AS
SELECT     B.StudentsName, C.CoachName, A.CreateTime, A.Operater, B.StudentCode, B.PeriodsID, A.CoachID, A.StudentsID, B.flag, A.ID, A.DistributeStuStatus, 
                      B.Status AS StuStatus
FROM         dbo.tb_DistributeStudents AS A LEFT OUTER JOIN
                      dbo.tb_Students AS B ON A.StudentsID = B.ID LEFT OUTER JOIN
                      dbo.tb_Coach AS C ON A.CoachID = C.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 182
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 220
               Bottom = 125
               Right = 379
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 417
               Bottom = 125
               Right = 563
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_DistributeStudents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_DistributeStudents'
GO
/****** Object:  StoredProcedure [dbo].[up_coachStudents]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_coachStudents]   --教练教学情况分析
	-- Add the parameters for the stored procedure here
	@peroidID int
	--,@coachID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
--	select COUNT(1) from SmartOfLifeDriveMgr.dbo.V_DistributeStudents
--where DistributeStuStatus=1 and flag=1
--and PeriodsID=@peroidID      --注意期数选择
--and CoachID=@coachID   --按照教练来统计
--union
--select COUNT(1) from SmartOfLifeDriveMgr.dbo.V_DistributeStudents
--where DistributeStuStatus=1 and flag=1
--and PeriodsID=@peroidID      --注意期数选择
--and CoachID=@coachID   --按照教练来统计

--and StuStatus =1    --学员状态    1:毕业

--查找所有教练所带学员的在学人数,毕业人数,退学人数

    SELECT CoachName,InCount,GraduterCount,ExiterCount
FROM (
SELECT CoachName, SUM(CASE WHEN DistributeStuStatus=1 and flag=1
and PeriodsID=@peroidID
and StuStatus =0 
 THEN 1 ELSE 0 END) AS InCount,
SUM(CASE WHEN DistributeStuStatus=1 and flag=1
and PeriodsID=@peroidID 
and StuStatus =1  THEN 1 ELSE 0 END) AS GraduterCount,
SUM(CASE WHEN DistributeStuStatus=1 and flag=1
and PeriodsID=@peroidID 
and StuStatus =2  THEN 1 ELSE 0 END) AS ExiterCount
FROM SmartOfLifeDriveMgr.dbo.V_DistributeStudents
GROUP BY CoachName) T
where CoachName is not null
END
GO
/****** Object:  Table [dbo].[tb_Pay]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Pay](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentsID] [bigint] NULL,
	[ShoudPay] [money] NULL,
	[RealPay] [money] NULL,
	[SalePay] [money] NULL,
	[Remark] [varchar](200) NULL,
	[Status] [int] NULL,
	[Operater] [varchar](50) NULL,
	[PayTime] [datetime] NULL,
 CONSTRAINT [PK_TB_PAY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录学员缴费情况，其中会有优惠情况。缴费状态为：未缴费，已交费，未交全。   报名时默认为未缴费。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Pay'
GO
/****** Object:  Table [dbo].[tb_Subject]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Subject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_TB_SUBJECT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于记录学员考试的科目信息。 其中状态为：启用和禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Subject'
GO
/****** Object:  Table [dbo].[tb_Appointment]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Appointment](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentsID] [bigint] NULL,
	[SubjectID] [int] NULL,
	[AppointDate] [datetime] NULL,
	[AppointStatus] [int] NULL,
	[Operater] [varchar](50) NULL,
	[Remark] [varchar](50) NULL,
 CONSTRAINT [PK_TB_APPOINTMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录学员预约信息。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Appointment'
GO
/****** Object:  View [dbo].[V_PreAppointment]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PreAppointment]
AS
SELECT     B.StudentsName, D.SubjectName, A.AppointDate, A.AppointStatus AS AppointmentStatus, A.Operater, A.Remark, B.StudentCode, B.PeriodsID, D.ID AS SubjectID, 
                      D.Status AS SubjectStatus, B.flag, B.ID AS StudentsID, A.ID
FROM         dbo.tb_Appointment AS A LEFT OUTER JOIN
                      dbo.tb_Students AS B ON A.StudentsID = B.ID LEFT OUTER JOIN
                      dbo.tb_Subject AS D ON A.SubjectID = D.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 187
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 225
               Bottom = 125
               Right = 384
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 6
               Left = 602
               Bottom = 110
               Right = 754
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PreAppointment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PreAppointment'
GO
/****** Object:  Table [dbo].[tb_DistributionVehicle]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_DistributionVehicle](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentsID] [bigint] NULL,
	[SubjectID] [int] NULL,
	[VehicleID] [int] NULL,
	[CreateTime] [datetime] NULL,
	[Operater] [varchar](50) NULL,
	[DistributeVihicleStatus] [int] NULL,
 CONSTRAINT [PK_TB_DISTRIBUTIONVEHICLE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录学员分车情况。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_DistributionVehicle'
GO
/****** Object:  View [dbo].[V_DistributeVehicle]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DistributeVehicle]
AS
SELECT     B.StudentsName, C.SubjectName, D.LicencePlateNum, B.StudentCode, B.PeriodsID, D.Id AS VehicleID, C.ID AS SubjectID, B.ID AS StudentsID, B.flag, A.CreateTime, 
                      A.Operater, A.ID, A.DistributeVihicleStatus
FROM         dbo.tb_DistributionVehicle AS A LEFT OUTER JOIN
                      dbo.tb_Students AS B ON A.StudentsID = B.ID LEFT OUTER JOIN
                      dbo.tb_Subject AS C ON A.SubjectID = C.ID LEFT OUTER JOIN
                      db_FinancialMgr.dbo.tb_Vehicle AS D ON A.VehicleID = D.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 181
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 219
               Bottom = 125
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 416
               Bottom = 110
               Right = 568
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 6
               Left = 606
               Bottom = 125
               Right = 775
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_DistributeVehicle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_DistributeVehicle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_DistributeVehicle'
GO
/****** Object:  Table [dbo].[tb_CurrentPeroid]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_CurrentPeroid](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CurrentPeroidID] [int] NULL,
	[flag] [int] NULL,
 CONSTRAINT [PK_tb_CurrentPeroid] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_ExamScores]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_ExamScores]
AS
SELECT     B.StudentsName, A.Remark, B.StudentCode, B.PeriodsID, A.ID, A.StudentsID, A.ScoreOne, A.OneStatus, A.ScoreTwo, A.TwoStatus, A.SocreThree, A.ThreeStatus, 
                      A.ScoreFour, A.FourStatus, B.flag, F.CoachName
FROM         dbo.tb_Scores AS A LEFT OUTER JOIN
                      dbo.tb_Students AS B ON A.StudentsID = B.ID LEFT OUTER JOIN
                      dbo.tb_DistributeStudents AS E ON E.StudentsID = B.ID LEFT OUTER JOIN
                      dbo.tb_Coach AS F ON E.CoachID = F.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 181
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 219
               Bottom = 125
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 6
               Left = 416
               Bottom = 125
               Right = 598
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "F"
            Begin Extent = 
               Top = 6
               Left = 636
               Bottom = 125
               Right = 786
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 20
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ExamScores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ExamScores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ExamScores'
GO
/****** Object:  StoredProcedure [dbo].[sp_Pager]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Pager]
@tableName varchar(64),  --分页表名
@columns varchar(512),  --查询的字段
@order varchar(256),    --排序方式
@pageSize int,  --每页大小
@pageIndex int,  --当前页
@where varchar(1024) = '1=1',  --查询条件
@totalCount int output  --总记录数
as
declare @beginIndex int,@endIndex int,@sqlResult nvarchar(2000),@sqlGetCount nvarchar(2000)
set @beginIndex = (@pageIndex - 1) * @pageSize + 1  --开始
set @endIndex = (@pageIndex) * @pageSize  --结束
set @sqlresult = 'select '+@columns+' from (
select row_number() over(order by '+ @order +')
as Rownum,'+@columns+'
from '+@tableName+' where '+ @where +') as T
where T.Rownum between ' + CONVERT(varchar(max),@beginIndex) + ' and ' + CONVERT(varchar(max),@endIndex)
set @sqlGetCount = 'select @totalCount = count(*) from '+@tablename+' where ' + @where  --总数
--print @sqlresult
exec(@sqlresult)
exec sp_executesql @sqlGetCount,N'@totalCount int output',@totalCount output
--测试调用：
--declare @total int
--exec sp_Pager 'tbLoginInfo','Id,UserName,Success','LoginDate','desc',4,2,'1=1',@total output
--print @total
GO
/****** Object:  Table [dbo].[tb_Periods]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Periods](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PeriodCode] [varchar](20) NULL,
	[Remark] [varchar](500) NULL,
	[flag] [int] NULL,
 CONSTRAINT [PK_TB_PERIODS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于记录学员期数信息。' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Periods'
GO
/****** Object:  View [dbo].[V_StudentsBaseData]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_StudentsBaseData]
AS
SELECT     A.ID, A.StudentsName, A.Sex, A.IsLocal, B.PeriodCode, A.CardNum, A.Address, A.Remark, A.Status, A.Operater AS OperationName, A.StudentCode, A.PeriodsID, 
                      D.ShoudPay, D.RealPay, D.Status AS PayStatus, A.Age, A.Operater, A.flag, A.PhoneNum, F.CoachName
FROM         dbo.tb_Students AS A LEFT OUTER JOIN
                      dbo.tb_Periods AS B ON A.PeriodsID = B.ID LEFT OUTER JOIN
                      dbo.tb_Pay AS D ON A.ID = D.StudentsID LEFT OUTER JOIN
                      dbo.tb_DistributeStudents AS E ON E.StudentsID = A.ID LEFT OUTER JOIN
                      dbo.tb_Coach AS F ON E.CoachID = F.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 235
               Bottom = 110
               Right = 379
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 6
               Left = 597
               Bottom = 125
               Right = 740
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 114
               Left = 235
               Bottom = 233
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "F"
            Begin Extent = 
               Top = 6
               Left = 417
               Bottom = 125
               Right = 567
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_StudentsBaseData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_StudentsBaseData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_StudentsBaseData'
GO
/****** Object:  View [dbo].[V_PayList]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PayList]
AS
SELECT     '场地租赁费' AS PriceType, StudentsID, B.StudentsName, B.StudentCode, TotalPrice, CreateDate, CreatePerson, A.DeleteMark, B.flag, B.PeriodsID,C.PeriodCode
FROM         db_FinancialMgr.dbo.tb_SiteRental_local A LEFT JOIN
                      SmartOfLifeDriveMgr.dbo.tb_Students B ON A.StudentsID = B.ID
LEFT JOIN dbo.tb_Periods C
                      ON B.PeriodsID=C.ID
UNION
SELECT     '车辆租赁费' AS PriceType, StudentsID, B.StudentsName, B.StudentCode, TotalPrice, CreateDate, CreatePerson, A.DeleteMark, B.flag, PeriodsID,C.PeriodCode
FROM         db_FinancialMgr.dbo.tb_VehicleRental_local A LEFT JOIN
                      SmartOfLifeDriveMgr.dbo.tb_Students B ON A.StudentsID = B.ID
LEFT JOIN dbo.tb_Periods C
                      ON B.PeriodsID=C.ID
UNION
SELECT     '考试费' AS PriceType, A.StudentsID, B.StudentsName, B.StudentCode, RealPay, CreateDate, A.Operater, A.DeleteMark, B.flag, PeriodsID,C.PeriodCode
FROM         db_FinancialMgr.dbo.tb_ExamPay A LEFT JOIN
                      SmartOfLifeDriveMgr.dbo.tb_Students B ON A.StudentsID = B.ID
LEFT JOIN dbo.tb_Periods C
                      ON B.PeriodsID=C.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PayList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PayList'
GO
/****** Object:  View [dbo].[V_PeroidsAndCurrent]    Script Date: 05/03/2017 22:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PeroidsAndCurrent]
AS
SELECT     A.ID, A.PeriodCode, A.Remark, A.flag, ISNULL(B.flag, 0) AS peroidStatus
FROM         dbo.tb_Periods AS A LEFT OUTER JOIN
                      dbo.tb_CurrentPeroid AS B ON A.ID = B.CurrentPeroidID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 182
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 220
               Bottom = 110
               Right = 387
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PeroidsAndCurrent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PeroidsAndCurrent'
GO
/****** Object:  Default [DF_tb_Students_flag]    Script Date: 05/03/2017 22:35:03 ******/
ALTER TABLE [dbo].[tb_Students] ADD  CONSTRAINT [DF_tb_Students_flag]  DEFAULT ((1)) FOR [flag]
GO
/****** Object:  Default [DF_tb_Coach_Age]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Coach] ADD  CONSTRAINT [DF_tb_Coach_Age]  DEFAULT ((18)) FOR [Age]
GO
/****** Object:  Default [DF_tb_Coach_Sex]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Coach] ADD  CONSTRAINT [DF_tb_Coach_Sex]  DEFAULT ((1)) FOR [Sex]
GO
/****** Object:  Default [DF_tb_Coach_Status]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Coach] ADD  CONSTRAINT [DF_tb_Coach_Status]  DEFAULT ((1)) FOR [CoachStatus]
GO
/****** Object:  Default [DF_tb_Pay_ShoudPay]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Pay] ADD  CONSTRAINT [DF_tb_Pay_ShoudPay]  DEFAULT ((0)) FOR [ShoudPay]
GO
/****** Object:  Default [DF_tb_Pay_RealPay]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Pay] ADD  CONSTRAINT [DF_tb_Pay_RealPay]  DEFAULT ((0)) FOR [RealPay]
GO
/****** Object:  Default [DF_tb_Pay_SalePay]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Pay] ADD  CONSTRAINT [DF_tb_Pay_SalePay]  DEFAULT ((0)) FOR [SalePay]
GO
/****** Object:  Default [DF_tb_Pay_Status]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Pay] ADD  CONSTRAINT [DF_tb_Pay_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_tb_Pay_Operater]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Pay] ADD  CONSTRAINT [DF_tb_Pay_Operater]  DEFAULT ('') FOR [Operater]
GO
/****** Object:  Default [DF_tb_Pay_PayTime]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Pay] ADD  CONSTRAINT [DF_tb_Pay_PayTime]  DEFAULT (getdate()) FOR [PayTime]
GO
/****** Object:  Default [DF_tb_Periods_flag]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Periods] ADD  CONSTRAINT [DF_tb_Periods_flag]  DEFAULT ((1)) FOR [flag]
GO
/****** Object:  ForeignKey [FK_tb_Scores_tb_Students]    Script Date: 05/03/2017 22:35:03 ******/
ALTER TABLE [dbo].[tb_Scores]  WITH CHECK ADD  CONSTRAINT [FK_tb_Scores_tb_Students] FOREIGN KEY([StudentsID])
REFERENCES [dbo].[tb_Students] ([ID])
GO
ALTER TABLE [dbo].[tb_Scores] CHECK CONSTRAINT [FK_tb_Scores_tb_Students]
GO
/****** Object:  ForeignKey [FK_tb_Archives_tb_Students]    Script Date: 05/03/2017 22:35:03 ******/
ALTER TABLE [dbo].[tb_Archives]  WITH CHECK ADD  CONSTRAINT [FK_tb_Archives_tb_Students] FOREIGN KEY([StudentsID])
REFERENCES [dbo].[tb_Students] ([ID])
GO
ALTER TABLE [dbo].[tb_Archives] CHECK CONSTRAINT [FK_tb_Archives_tb_Students]
GO
/****** Object:  ForeignKey [FK_TB_STUDE_REFERENCE_TB_PERIO]    Script Date: 05/03/2017 22:35:03 ******/
ALTER TABLE [dbo].[tb_Students]  WITH CHECK ADD  CONSTRAINT [FK_TB_STUDE_REFERENCE_TB_PERIO] FOREIGN KEY([PeriodsID])
REFERENCES [dbo].[tb_Periods] ([ID])
GO
ALTER TABLE [dbo].[tb_Students] CHECK CONSTRAINT [FK_TB_STUDE_REFERENCE_TB_PERIO]
GO
/****** Object:  ForeignKey [FK_TB_DISTR_REFERENCE_TB_COACH]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_DistributeStudents]  WITH CHECK ADD  CONSTRAINT [FK_TB_DISTR_REFERENCE_TB_COACH] FOREIGN KEY([CoachID])
REFERENCES [dbo].[tb_Coach] ([ID])
GO
ALTER TABLE [dbo].[tb_DistributeStudents] CHECK CONSTRAINT [FK_TB_DISTR_REFERENCE_TB_COACH]
GO
/****** Object:  ForeignKey [FK_tb_DistributeStudents_tb_DistributeStudents]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_DistributeStudents]  WITH CHECK ADD  CONSTRAINT [FK_tb_DistributeStudents_tb_DistributeStudents] FOREIGN KEY([ID])
REFERENCES [dbo].[tb_DistributeStudents] ([ID])
GO
ALTER TABLE [dbo].[tb_DistributeStudents] CHECK CONSTRAINT [FK_tb_DistributeStudents_tb_DistributeStudents]
GO
/****** Object:  ForeignKey [FK_tb_DistributeStudents_tb_Students]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_DistributeStudents]  WITH CHECK ADD  CONSTRAINT [FK_tb_DistributeStudents_tb_Students] FOREIGN KEY([StudentsID])
REFERENCES [dbo].[tb_Students] ([ID])
GO
ALTER TABLE [dbo].[tb_DistributeStudents] CHECK CONSTRAINT [FK_tb_DistributeStudents_tb_Students]
GO
/****** Object:  ForeignKey [FK_tb_Pay_tb_Students]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Pay]  WITH CHECK ADD  CONSTRAINT [FK_tb_Pay_tb_Students] FOREIGN KEY([StudentsID])
REFERENCES [dbo].[tb_Students] ([ID])
GO
ALTER TABLE [dbo].[tb_Pay] CHECK CONSTRAINT [FK_tb_Pay_tb_Students]
GO
/****** Object:  ForeignKey [FK_TB_APPOI_REFERENCE_TB_SUBJE]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Appointment]  WITH CHECK ADD  CONSTRAINT [FK_TB_APPOI_REFERENCE_TB_SUBJE] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[tb_Subject] ([ID])
GO
ALTER TABLE [dbo].[tb_Appointment] CHECK CONSTRAINT [FK_TB_APPOI_REFERENCE_TB_SUBJE]
GO
/****** Object:  ForeignKey [FK_tb_Appointment_tb_Students]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_Appointment]  WITH CHECK ADD  CONSTRAINT [FK_tb_Appointment_tb_Students] FOREIGN KEY([StudentsID])
REFERENCES [dbo].[tb_Students] ([ID])
GO
ALTER TABLE [dbo].[tb_Appointment] CHECK CONSTRAINT [FK_tb_Appointment_tb_Students]
GO
/****** Object:  ForeignKey [FK_TB_DISTR_REFERENCE_TB_SUBJE]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_DistributionVehicle]  WITH CHECK ADD  CONSTRAINT [FK_TB_DISTR_REFERENCE_TB_SUBJE] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[tb_Subject] ([ID])
GO
ALTER TABLE [dbo].[tb_DistributionVehicle] CHECK CONSTRAINT [FK_TB_DISTR_REFERENCE_TB_SUBJE]
GO
/****** Object:  ForeignKey [FK_tb_DistributionVehicle_tb_Students]    Script Date: 05/03/2017 22:35:09 ******/
ALTER TABLE [dbo].[tb_DistributionVehicle]  WITH CHECK ADD  CONSTRAINT [FK_tb_DistributionVehicle_tb_Students] FOREIGN KEY([StudentsID])
REFERENCES [dbo].[tb_Students] ([ID])
GO
ALTER TABLE [dbo].[tb_DistributionVehicle] CHECK CONSTRAINT [FK_tb_DistributionVehicle_tb_Students]
GO
