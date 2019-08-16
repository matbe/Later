USE [master]
GO
/****** Object:  Database [Later]    Script Date: 2019-08-16 12:09:04 ******/
CREATE DATABASE [Later]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Later', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Later.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Later_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Later_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Later] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Later].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Later] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Later] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Later] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Later] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Later] SET ARITHABORT OFF 
GO
ALTER DATABASE [Later] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Later] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Later] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Later] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Later] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Later] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Later] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Later] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Later] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Later] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Later] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Later] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Later] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Later] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Later] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Later] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Later] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Later] SET RECOVERY FULL 
GO
ALTER DATABASE [Later] SET  MULTI_USER 
GO
ALTER DATABASE [Later] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Later] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Later] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Later] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Later] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Later] SET QUERY_STORE = OFF
GO
USE [Later]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Later]
GO
/****** Object:  User [CONTOSO\svc-admpwd]    Script Date: 2019-08-16 12:09:05 ******/
CREATE USER [CONTOSO\svc-admpwd] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CONTOSO\svc-admpwd]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [CONTOSO\svc-admpwd]
GO
/****** Object:  Table [dbo].[FailedRequests]    Script Date: 2019-08-16 12:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FailedRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[ComputerName] [nvarchar](50) NOT NULL,
	[ComputerNameByAddress] [nvarchar](50) NULL,
	[ComputerIPAddress] [nvarchar](50) NULL,
	[ComputerNameMatchAddress] [bit] NOT NULL,
	[Error] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK__FailedRe__3214EC07AC105682] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasswordResets]    Script Date: 2019-08-16 12:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordResets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[ComputerName] [nvarchar](50) NOT NULL,
	[ComputerNameByAddress] [nvarchar](50) NULL,
	[ComputerIPAddress] [nvarchar](50) NULL,
	[ComputerNameMatchAddress] [bit] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK__PasswordResets__3214EC075FF5AD14] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 2019-08-16 12:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [nvarchar](50) NOT NULL,
	[Computers] [numeric](18, 0) NOT NULL,
	[TimesPerDay] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK__Policy__3214EC07597E78B5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 2019-08-16 12:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[ComputerName] [nvarchar](50) NOT NULL,
	[ComputerNameByAddress] [nvarchar](50) NULL,
	[ComputerIPAddress] [nvarchar](50) NULL,
	[ComputerNameMatchAddress] [bit] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK__Requests__3214EC075FF5AD14] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FailedRequests] ADD  CONSTRAINT [DF__FailedReq__Times__5CD6CB2B]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[PasswordResets] ADD  CONSTRAINT [DF__PasswordResets__Timest__4CA06362]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[Requests] ADD  CONSTRAINT [DF__Requests__Timest__4CA06362]  DEFAULT (getdate()) FOR [Timestamp]
GO
USE [master]
GO
ALTER DATABASE [Later] SET  READ_WRITE 
GO
