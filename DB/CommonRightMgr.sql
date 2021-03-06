USE [master]
GO
/****** Object:  Database [db_CommonRightMgr]    Script Date: 05/03/2017 22:35:55 ******/
CREATE DATABASE [db_CommonRightMgr] ON  PRIMARY 
( NAME = N'db_CommonRightMgr', FILENAME = N'I:\项目\SmartOfLife\DB\db_CommonRightMgr.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_CommonRightMgr_log', FILENAME = N'I:\项目\SmartOfLife\DB\db_CommonRightMgr_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_CommonRightMgr] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_CommonRightMgr].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_CommonRightMgr] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET ANSI_NULLS OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET ANSI_PADDING OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET ARITHABORT OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [db_CommonRightMgr] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [db_CommonRightMgr] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [db_CommonRightMgr] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET  DISABLE_BROKER
GO
ALTER DATABASE [db_CommonRightMgr] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [db_CommonRightMgr] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [db_CommonRightMgr] SET  READ_WRITE
GO
ALTER DATABASE [db_CommonRightMgr] SET RECOVERY FULL
GO
ALTER DATABASE [db_CommonRightMgr] SET  MULTI_USER
GO
ALTER DATABASE [db_CommonRightMgr] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [db_CommonRightMgr] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_CommonRightMgr', N'ON'
GO
USE [db_CommonRightMgr]
GO
/****** Object:  Table [dbo].[tbUserRole]    Script Date: 05/03/2017 22:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUserRole](
	[UserId] [int] NULL,
	[RoleId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUserOperateLog]    Script Date: 05/03/2017 22:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbUserOperateLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserIp] [varchar](50) NULL,
	[OperateInfo] [varchar](64) NULL,
	[Description] [varchar](max) NULL,
	[IfSuccess] [bit] NULL,
	[OperateDate] [datetime] NULL,
 CONSTRAINT [PK_tbUserOperateInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbUserDepartment]    Script Date: 05/03/2017 22:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUserDepartment](
	[UserId] [int] NULL,
	[DepartmentId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUser]    Script Date: 05/03/2017 22:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[UserPwd] [varchar](50) NULL,
	[IsAble] [bit] NULL,
	[IfChangePwd] [bit] NULL,
	[AddDate] [datetime] NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_tbUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbRoleMenuButton]    Script Date: 05/03/2017 22:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbRoleMenuButton](
	[RoleId] [int] NULL,
	[MenuId] [int] NULL,
	[ButtonId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbRole]    Script Date: 05/03/2017 22:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[AddDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK_tbRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbMenuButton]    Script Date: 05/03/2017 22:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMenuButton](
	[MenuId] [int] NULL,
	[ButtonId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMenu]    Script Date: 05/03/2017 22:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ParentId] [int] NULL,
	[Code] [varchar](50) NULL,
	[LinkAddress] [varchar](100) NULL,
	[Icon] [varchar](50) NULL,
	[Sort] [int] NULL,
	[AddDate] [datetime] NULL,
	[MenuStatus] [bit] NULL,
 CONSTRAINT [PK_tbMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbLoginLog]    Script Date: 05/03/2017 22:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbLoginLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserIp] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Success] [bit] NULL,
	[LoginDate] [datetime] NULL,
 CONSTRAINT [PK_tbLoginInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbDepartment]    Script Date: 05/03/2017 22:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbDepartment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NULL,
	[ParentId] [int] NULL,
	[Sort] [int] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_tbDepartment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbButton]    Script Date: 05/03/2017 22:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbButton](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Icon] [varchar](50) NULL,
	[Sort] [int] NULL,
	[AddDate] [datetime] NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_tbButton] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbBug]    Script Date: 05/03/2017 22:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbBug](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserIp] [varchar](50) NULL,
	[BugInfo] [varchar](max) NULL,
	[BugReply] [varchar](max) NULL,
	[BugDate] [datetime] NULL,
	[IfShow] [bit] NULL,
	[IfSolve] [bit] NULL,
 CONSTRAINT [PK_tbBug] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_Pager]    Script Date: 05/03/2017 22:35:58 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAuthorityByUserId]    Script Date: 05/03/2017 22:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetAuthorityByUserId]  
@userId int  --用户主键id  
as    
declare @roleIds varchar(128)  --用户所有的角色集合  
declare @sql varchar(max)    
SELECT @roleIds=REPLACE(    
(select str(ur.RoleId)+',' from tbUser u    
join tbUserRole ur on u.Id = ur.UserId where u.Id = @userId  
for xml path('')),' ','')    
--print substring(@roleids,1,len(@roleids)-1)  --打印出用户所拥有的角色id  
set @sql=    
'select m.Id menuid,m.Name menuname,m.ParentId parentid,m.Icon menuicon,mb.ButtonId buttonid,b.Name buttonname,b.Icon buttonicon,rmb.RoleId roleid,  
case      
when isnull(rmb.ButtonId,0) = 0   
then ''false'' else ''true''    
end checked    
from tbMenu m  
left join tbMenuButton mb on m.Id=mb.MenuId  
left join tbButton b on mb.ButtonId=b.Id    
left join tbRoleMenuButton rmb on (mb.MenuId=rmb.MenuId and mb.ButtonId=rmb.ButtonId and rmb.RoleId in ('    
+    
isnull(substring(@roleIds,1,len(@roleIds)-1),0)    
+'))    
order by m.ParentId,m.Sort,b.Sort'  
--print @sql    
exec (@sql)
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckLogin]    Script Date: 05/03/2017 22:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_CheckLogin]  
@ip nvarchar(50),  
@lastErrorLoginTime datetime output  
as          
declare @errorLoginCount int  --错误次数  
select @errorLoginCount = Count(1) from tbLoginLog where Success = 0 and DATEADD(MI,30,LoginDate) > GETDATE() and UserIp = @ip  
if @errorLoginCount >= 5  
begin  
 select top 1 @lastErrorLoginTime = T.LoginDate from (select top 5 LoginDate from tbLoginLog where UserIp = @ip order by LoginDate desc ) T order by LoginDate asc  
end  
else  
begin  
 set @lastErrorLoginTime = null  
end
GO
/****** Object:  Default [DF_tbUserOperateInfo_OperateDate]    Script Date: 05/03/2017 22:35:57 ******/
ALTER TABLE [dbo].[tbUserOperateLog] ADD  CONSTRAINT [DF_tbUserOperateInfo_OperateDate]  DEFAULT (getdate()) FOR [OperateDate]
GO
/****** Object:  Default [DF_tbUser_AddDate]    Script Date: 05/03/2017 22:35:57 ******/
ALTER TABLE [dbo].[tbUser] ADD  CONSTRAINT [DF_tbUser_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_tbRole_AddDate]    Script Date: 05/03/2017 22:35:57 ******/
ALTER TABLE [dbo].[tbRole] ADD  CONSTRAINT [DF_tbRole_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_tbMenu_AddDate]    Script Date: 05/03/2017 22:35:57 ******/
ALTER TABLE [dbo].[tbMenu] ADD  CONSTRAINT [DF_tbMenu_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_tbMenu_MenuStatus]    Script Date: 05/03/2017 22:35:57 ******/
ALTER TABLE [dbo].[tbMenu] ADD  CONSTRAINT [DF_tbMenu_MenuStatus]  DEFAULT ((1)) FOR [MenuStatus]
GO
/****** Object:  Default [DF_tbLoginInfo_LoginDate]    Script Date: 05/03/2017 22:35:57 ******/
ALTER TABLE [dbo].[tbLoginLog] ADD  CONSTRAINT [DF_tbLoginInfo_LoginDate]  DEFAULT (getdate()) FOR [LoginDate]
GO
/****** Object:  Default [DF_tbDepartment_AddDate]    Script Date: 05/03/2017 22:35:57 ******/
ALTER TABLE [dbo].[tbDepartment] ADD  CONSTRAINT [DF_tbDepartment_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_tbButton_AddDate]    Script Date: 05/03/2017 22:35:57 ******/
ALTER TABLE [dbo].[tbButton] ADD  CONSTRAINT [DF_tbButton_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_tbBug_BugDate]    Script Date: 05/03/2017 22:35:57 ******/
ALTER TABLE [dbo].[tbBug] ADD  CONSTRAINT [DF_tbBug_BugDate]  DEFAULT (getdate()) FOR [BugDate]
GO
