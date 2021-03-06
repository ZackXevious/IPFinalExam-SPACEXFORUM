USE [master]
GO
/****** Object:  Database [SpaceXDatabase]    Script Date: 5/4/2020 5:04:44 PM ******/
CREATE DATABASE [SpaceXDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SpaceXDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SpaceXDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SpaceXDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SpaceXDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SpaceXDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SpaceXDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SpaceXDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SpaceXDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SpaceXDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SpaceXDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SpaceXDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SpaceXDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [SpaceXDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SpaceXDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SpaceXDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SpaceXDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SpaceXDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SpaceXDatabase] SET QUERY_STORE = OFF
GO
USE [SpaceXDatabase]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/4/2020 5:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 5/4/2020 5:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Date] [datetime] NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[ContentText] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[mainview]    Script Date: 5/4/2020 5:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[mainview]
AS
SELECT        dbo.[Content].Date, dbo.[Content].Title, dbo.[Content].ContentText, dbo.[User].UserName, dbo.[Content].ContentID
FROM            dbo.[Content] INNER JOIN
                         dbo.[User] ON dbo.[Content].UserID = dbo.[User].UserID
GO
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ContentID], [UserID], [Date], [Title], [ContentText]) VALUES (1, 1, CAST(N'2020-05-04T00:00:00.000' AS DateTime), N'AdminPost', N'This is an admin')
INSERT [dbo].[Content] ([ContentID], [UserID], [Date], [Title], [ContentText]) VALUES (2, 3, CAST(N'2020-04-02T00:00:00.000' AS DateTime), N'Userpost', N'This is a userpost')
INSERT [dbo].[Content] ([ContentID], [UserID], [Date], [Title], [ContentText]) VALUES (7, 3, CAST(N'2020-04-20T00:00:00.000' AS DateTime), N'Userpost25', N'This is a userpost')
INSERT [dbo].[Content] ([ContentID], [UserID], [Date], [Title], [ContentText]) VALUES (8, 4, CAST(N'2020-04-25T00:00:00.000' AS DateTime), N'Testpost', N'Cooldudemcdude')
SET IDENTITY_INSERT [dbo].[Content] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Password], [Description], [Email], [IsAdmin]) VALUES (1, N'Admin', N'Admin01', N'DefaultAdmin', N'Admin@admin.com', 1)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Description], [Email], [IsAdmin]) VALUES (3, N'UserMcUsername', N'DefaultUser', N'The default user', N'usermcusername@user.com', 0)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Description], [Email], [IsAdmin]) VALUES (4, N'Cool', N'dudecool', N'cooldude', N'cool@dude.com', 0)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Description], [Email], [IsAdmin]) VALUES (7, N'Tomska', N'ASDFMOVIE', N'Tomska', N'Tomska@youtube.com', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
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
         Begin Table = "Content"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
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
         Filter = 930
         Or = 1245
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mainview'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mainview'
GO
USE [master]
GO
ALTER DATABASE [SpaceXDatabase] SET  READ_WRITE 
GO
