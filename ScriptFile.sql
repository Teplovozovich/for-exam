USE [master]
GO
/****** Object:  Database [aboba]    Script Date: 12.06.2024 20:19:47 ******/
CREATE DATABASE [aboba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'aboba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\aboba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'aboba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\aboba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [aboba] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [aboba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [aboba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [aboba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [aboba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [aboba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [aboba] SET ARITHABORT OFF 
GO
ALTER DATABASE [aboba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [aboba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [aboba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [aboba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [aboba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [aboba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [aboba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [aboba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [aboba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [aboba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [aboba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [aboba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [aboba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [aboba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [aboba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [aboba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [aboba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [aboba] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [aboba] SET  MULTI_USER 
GO
ALTER DATABASE [aboba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [aboba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [aboba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [aboba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [aboba] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [aboba] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [aboba] SET QUERY_STORE = ON
GO
ALTER DATABASE [aboba] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [aboba]
GO
/****** Object:  Table [dbo].[Abobus]    Script Date: 12.06.2024 20:19:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abobus](
	[name] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logins_passwords]    Script Date: 12.06.2024 20:19:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins_passwords](
	[id_login] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NULL,
	[login] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Logins_passwords] PRIMARY KEY CLUSTERED 
(
	[id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12.06.2024 20:19:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[date] [nvarchar](max) NOT NULL,
	[status] [nvarchar](max) NOT NULL,
	[decription] [nvarchar](max) NOT NULL,
	[price] [nvarchar](max) NOT NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12.06.2024 20:19:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id_role] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 12.06.2024 20:19:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[id_shift] [int] IDENTITY(1,1) NOT NULL,
	[data] [nvarchar](max) NOT NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [PK_Shifts] PRIMARY KEY CLUSTERED 
(
	[id_shift] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 12.06.2024 20:19:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[id_status] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12.06.2024 20:19:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[status] [nvarchar](max) NOT NULL,
	[id_role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Abobus] ([name], [password]) VALUES (N'aboba', N'aboba')
INSERT [dbo].[Abobus] ([name], [password]) VALUES (N'1', N'1')
INSERT [dbo].[Abobus] ([name], [password]) VALUES (N'2', N'2')
GO
SET IDENTITY_INSERT [dbo].[Logins_passwords] ON 

INSERT [dbo].[Logins_passwords] ([id_login], [id_user], [login], [password]) VALUES (11, 1, N'1', N'1')
INSERT [dbo].[Logins_passwords] ([id_login], [id_user], [login], [password]) VALUES (12, 2, N'2', N'2')
INSERT [dbo].[Logins_passwords] ([id_login], [id_user], [login], [password]) VALUES (14, 17, N'3', N'1')
SET IDENTITY_INSERT [dbo].[Logins_passwords] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id_role], [role]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([id_role], [role]) VALUES (2, N'shef')
INSERT [dbo].[Role] ([id_role], [role]) VALUES (3, N'user')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([id_status], [status_name]) VALUES (1, N'Работает')
INSERT [dbo].[Statuses] ([id_status], [status_name]) VALUES (2, N'Уволен')
INSERT [dbo].[Statuses] ([id_status], [status_name]) VALUES (3, N'В отпуске')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id_user], [name], [status], [id_role]) VALUES (1, N'Артур', N'работает', 1)
INSERT [dbo].[Users] ([id_user], [name], [status], [id_role]) VALUES (2, N'Илья', N'уволен', 2)
INSERT [dbo].[Users] ([id_user], [name], [status], [id_role]) VALUES (17, N'Abobus', N'работает', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Logins_passwords]  WITH CHECK ADD  CONSTRAINT [FK_Logins_passwords_Users] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Logins_passwords] CHECK CONSTRAINT [FK_Logins_passwords_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Shifts]  WITH CHECK ADD  CONSTRAINT [FK_Shifts_Users] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Shifts] CHECK CONSTRAINT [FK_Shifts_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([id_role])
REFERENCES [dbo].[Role] ([id_role])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [aboba] SET  READ_WRITE 
GO
