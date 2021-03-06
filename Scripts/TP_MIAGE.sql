USE [master]
GO
/****** Object:  Database [TP_MIAGE]    Script Date: 24/03/2019 15:33:29 ******/
CREATE DATABASE [TP_MIAGE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP_MIAGE', FILENAME = N'/var/opt/mssql/data/TP_MIAGE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP_MIAGE_log', FILENAME = N'/var/opt/mssql/data/TP_MIAGE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TP_MIAGE] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP_MIAGE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP_MIAGE] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [TP_MIAGE] SET ANSI_NULLS ON 
GO
ALTER DATABASE [TP_MIAGE] SET ANSI_PADDING ON 
GO
ALTER DATABASE [TP_MIAGE] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [TP_MIAGE] SET ARITHABORT ON 
GO
ALTER DATABASE [TP_MIAGE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP_MIAGE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP_MIAGE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP_MIAGE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP_MIAGE] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [TP_MIAGE] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [TP_MIAGE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP_MIAGE] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [TP_MIAGE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP_MIAGE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP_MIAGE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP_MIAGE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP_MIAGE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP_MIAGE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP_MIAGE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP_MIAGE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP_MIAGE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP_MIAGE] SET RECOVERY FULL 
GO
ALTER DATABASE [TP_MIAGE] SET  MULTI_USER 
GO
ALTER DATABASE [TP_MIAGE] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [TP_MIAGE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP_MIAGE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP_MIAGE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TP_MIAGE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP_MIAGE', N'ON'
GO
ALTER DATABASE [TP_MIAGE] SET QUERY_STORE = OFF
GO
USE [TP_MIAGE]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 24/03/2019 15:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Label] [varchar](50) NOT NULL,
	[Duration] [int] NOT NULL,
	[ThemeId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 24/03/2019 15:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lastname] [varchar](50) NOT NULL,
	[Firstname] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 24/03/2019 15:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_StudentCourse] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 24/03/2019 15:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lastname] [varchar](50) NOT NULL,
	[FIrstname] [varchar](50) NOT NULL,
	[Role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Theme]    Script Date: 24/03/2019 15:33:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theme](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Label] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Theme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student] ON 
GO
INSERT [dbo].[Student] ([Id], [Lastname], [Firstname], [Age], [Email]) VALUES (1, N'Morisson', N'Jack', 52, N'jack@s76.com')
GO
INSERT [dbo].[Student] ([Id], [Lastname], [Firstname], [Age], [Email]) VALUES (2, N'McCree', N'Jesse', 35, N'jesse@mccree.com')
GO
INSERT [dbo].[Student] ([Id], [Lastname], [Firstname], [Age], [Email]) VALUES (3, N'Oxton', N'Lena', 26, N'oxton@tracer.com')
GO
INSERT [dbo].[Student] ([Id], [Lastname], [Firstname], [Age], [Email]) VALUES (4, N'Ziegler', N'Angela', 37, N'a.ziegle@mercy.com')
GO
INSERT [dbo].[Student] ([Id], [Lastname], [Firstname], [Age], [Email]) VALUES (5, N'Lacroix', N'Amélie', 29, N'amelie@widow.com')
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 
GO
INSERT [dbo].[Teacher] ([Id], [Lastname], [FIrstname], [Role]) VALUES (1, N'Fleury', N'Nicolas', N'Architecte')
GO
INSERT [dbo].[Teacher] ([Id], [Lastname], [FIrstname], [Role]) VALUES (2, N'Destouches', N'Thibaud', N'Expert')
GO
INSERT [dbo].[Teacher] ([Id], [Lastname], [FIrstname], [Role]) VALUES (3, N'Besnard', N'Romain-Alexandre', N'Architecte')
GO
INSERT [dbo].[Teacher] ([Id], [Lastname], [FIrstname], [Role]) VALUES (4, N'Penaud', N'François', N'Architecte')
GO
INSERT [dbo].[Teacher] ([Id], [Lastname], [FIrstname], [Role]) VALUES (5, N'Valente', N'François', N'Expert')
GO
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
SET IDENTITY_INSERT [dbo].[Theme] ON 
GO
INSERT [dbo].[Theme] ([Id], [Label]) VALUES (1, N'Nouvelles Technos')
GO
INSERT [dbo].[Theme] ([Id], [Label]) VALUES (2, N'BI')
GO
SET IDENTITY_INSERT [dbo].[Theme] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 
GO
INSERT [dbo].[Course] ([Id], [Label], [Duration], [ThemeId], [TeacherId]) VALUES (1, N'.NET', 5, 1, 1)
GO
INSERT [dbo].[Course] ([Id], [Label], [Duration], [ThemeId], [TeacherId]) VALUES (2, N'Java', 5, 1, 3)
GO
INSERT [dbo].[Course] ([Id], [Label], [Duration], [ThemeId], [TeacherId]) VALUES (3, N'Angular 4', 2, 1, 4)
GO
INSERT [dbo].[Course] ([Id], [Label], [Duration], [ThemeId], [TeacherId]) VALUES (4, N'Informatica', 2, 2, 5)
GO
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (1, 1)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (1, 2)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (1, 3)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (1, 4)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (2, 1)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (2, 2)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (2, 3)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (2, 4)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (3, 1)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (3, 2)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (3, 3)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (3, 4)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (4, 1)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (4, 2)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (4, 3)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (4, 4)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (5, 1)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (5, 2)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (5, 3)
GO
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (5, 4)
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Theme] FOREIGN KEY([ThemeId])
REFERENCES [dbo].[Theme] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Theme]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Teacher]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Course]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Student]
GO
USE [master]
GO
ALTER DATABASE [TP_MIAGE] SET  READ_WRITE 
GO
