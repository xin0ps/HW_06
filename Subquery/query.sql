USE [master]
GO
/****** Object:  Database [Academy5]    Script Date: 12/24/2023 11:01:54 PM ******/
CREATE DATABASE [Academy5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Academy5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Academy5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Academy5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Academy5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Academy5] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Academy5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Academy5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Academy5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Academy5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Academy5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Academy5] SET ARITHABORT OFF 
GO
ALTER DATABASE [Academy5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Academy5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Academy5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Academy5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Academy5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Academy5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Academy5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Academy5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Academy5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Academy5] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Academy5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Academy5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Academy5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Academy5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Academy5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Academy5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Academy5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Academy5] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Academy5] SET  MULTI_USER 
GO
ALTER DATABASE [Academy5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Academy5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Academy5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Academy5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Academy5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Academy5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Academy5] SET QUERY_STORE = ON
GO
ALTER DATABASE [Academy5] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Academy5]
GO
/****** Object:  Table [dbo].[Curators]    Script Date: 12/24/2023 11:01:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 12/24/2023 11:01:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Building] [int] NOT NULL,
	[Financing] [money] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[FacultyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 12/24/2023 11:01:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 12/24/2023 11:01:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Year] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsCurators]    Script Date: 12/24/2023 11:01:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsCurators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CuratorId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsLectures]    Script Date: 12/24/2023 11:01:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsLectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[LectureId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsStudents]    Script Date: 12/24/2023 11:01:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsStudents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 12/24/2023 11:01:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateOfLecture] [date] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 12/24/2023 11:01:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Rating] [int] NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 12/24/2023 11:01:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 12/24/2023 11:01:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsProfessor] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Salary] [money] NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Curators] ON 

INSERT [dbo].[Curators] ([Id], [Name], [Surname]) VALUES (1, N'Alice', N'Johnson')
INSERT [dbo].[Curators] ([Id], [Name], [Surname]) VALUES (2, N'David', N'Miller')
INSERT [dbo].[Curators] ([Id], [Name], [Surname]) VALUES (3, N'Maria', N'Garcia')
INSERT [dbo].[Curators] ([Id], [Name], [Surname]) VALUES (4, N'James', N'Anderson')
SET IDENTITY_INSERT [dbo].[Curators] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Building], [Financing], [Name], [FacultyId]) VALUES (1, 1, 50000.0000, N'Biology', 1)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [Name], [FacultyId]) VALUES (2, 2, 60000.0000, N'Physics', 1)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [Name], [FacultyId]) VALUES (3, 3, 30000.0000, N'History', 2)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [Name], [FacultyId]) VALUES (4, 4, 70000.0000, N'Mechanical Engineering', 3)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [Name], [FacultyId]) VALUES (5, 5, 80000.0000, N'Medical Sciences', 4)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (2, N'Arts')
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (3, N'Engineering')
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (4, N'Medicine')
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (1, N'Science')
SET IDENTITY_INSERT [dbo].[Faculties] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (1, N'Alpha', 1, 1)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (2, N'Beta', 2, 2)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (3, N'Gamma', 3, 3)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (4, N'Delta', 4, 4)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (5, N'Epsilon', 5, 5)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsCurators] ON 

INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (1, 1, 1)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (2, 2, 2)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (3, 3, 3)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (4, 4, 4)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (5, 1, 5)
SET IDENTITY_INSERT [dbo].[GroupsCurators] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsLectures] ON 

INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (1, 1, 1)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (2, 2, 2)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (3, 3, 3)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (4, 4, 4)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (5, 5, 5)
SET IDENTITY_INSERT [dbo].[GroupsLectures] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsStudents] ON 

INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (1, 1, 1)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (2, 2, 2)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (3, 3, 3)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (4, 4, 4)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (5, 5, 1)
SET IDENTITY_INSERT [dbo].[GroupsStudents] OFF
GO
SET IDENTITY_INSERT [dbo].[Lectures] ON 

INSERT [dbo].[Lectures] ([Id], [DateOfLecture], [SubjectId], [TeacherId]) VALUES (1, CAST(N'2023-01-15' AS Date), 1, 1)
INSERT [dbo].[Lectures] ([Id], [DateOfLecture], [SubjectId], [TeacherId]) VALUES (2, CAST(N'2023-01-16' AS Date), 2, 2)
INSERT [dbo].[Lectures] ([Id], [DateOfLecture], [SubjectId], [TeacherId]) VALUES (3, CAST(N'2023-01-17' AS Date), 3, 3)
INSERT [dbo].[Lectures] ([Id], [DateOfLecture], [SubjectId], [TeacherId]) VALUES (4, CAST(N'2023-01-18' AS Date), 4, 4)
INSERT [dbo].[Lectures] ([Id], [DateOfLecture], [SubjectId], [TeacherId]) VALUES (5, CAST(N'2023-01-19' AS Date), 5, 1)
SET IDENTITY_INSERT [dbo].[Lectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Name], [Rating], [Surname]) VALUES (1, N'Alice', 4, N'Brown')
INSERT [dbo].[Students] ([Id], [Name], [Rating], [Surname]) VALUES (2, N'David', 3, N'Smith')
INSERT [dbo].[Students] ([Id], [Name], [Rating], [Surname]) VALUES (3, N'Maria', 5, N'Wilson')
INSERT [dbo].[Students] ([Id], [Name], [Rating], [Surname]) VALUES (4, N'James', 2, N'Taylor')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (5, N'Anatomy')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (1, N'Genetics')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (2, N'Quantum Mechanics')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (4, N'Thermodynamics')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (3, N'World History')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [IsProfessor], [Name], [Salary], [Surname]) VALUES (1, 1, N'John', 5000.0000, N'Doe')
INSERT [dbo].[Teachers] ([Id], [IsProfessor], [Name], [Salary], [Surname]) VALUES (2, 0, N'Emma', 5500.0000, N'Smith')
INSERT [dbo].[Teachers] ([Id], [IsProfessor], [Name], [Salary], [Surname]) VALUES (3, 1, N'Robert', 6000.0000, N'Brown')
INSERT [dbo].[Teachers] ([Id], [IsProfessor], [Name], [Salary], [Surname]) VALUES (4, 0, N'Sophia', 4800.0000, N'Wilson')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__737584F6967804F3]    Script Date: 12/24/2023 11:01:54 PM ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Facultie__737584F61EA47849]    Script Date: 12/24/2023 11:01:54 PM ******/
ALTER TABLE [dbo].[Faculties] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Groups__737584F600523555]    Script Date: 12/24/2023 11:01:54 PM ******/
ALTER TABLE [dbo].[Groups] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Subjects__737584F6C05E3079]    Script Date: 12/24/2023 11:01:54 PM ******/
ALTER TABLE [dbo].[Subjects] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departments] ADD  DEFAULT ((0)) FOR [Financing]
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ((0)) FOR [IsProfessor]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[GroupsCurators]  WITH CHECK ADD FOREIGN KEY([CuratorId])
REFERENCES [dbo].[Curators] ([Id])
GO
ALTER TABLE [dbo].[GroupsCurators]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectures]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectures]  WITH CHECK ADD FOREIGN KEY([LectureId])
REFERENCES [dbo].[Lectures] ([Id])
GO
ALTER TABLE [dbo].[GroupsStudents]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsStudents]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD CHECK  (([Building]>=(1) AND [Building]<=(5)))
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD CHECK  (([Financing]>=(0)))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([Year]>=(1) AND [Year]<=(5)))
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD CHECK  (([Rating]>=(0) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Salary]>(0)))
GO
USE [master]
GO
ALTER DATABASE [Academy5] SET  READ_WRITE 
GO
