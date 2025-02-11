USE [master]
GO
/****** Object:  Database [Левківська_271_2]    Script Date: 28.05.2023 16:48:10 ******/
CREATE DATABASE [Левківська_271_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Левківська_271_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Левківська_271_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Левківська_271_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Левківська_271_2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Левківська_271_2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Левківська_271_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Левківська_271_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Левківська_271_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Левківська_271_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Левківська_271_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Левківська_271_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Левківська_271_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Левківська_271_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Левківська_271_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Левківська_271_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Левківська_271_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Левківська_271_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Левківська_271_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Левківська_271_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Левківська_271_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Левківська_271_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Левківська_271_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Левківська_271_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Левківська_271_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Левківська_271_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Левківська_271_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Левківська_271_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Левківська_271_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Левківська_271_2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Левківська_271_2] SET  MULTI_USER 
GO
ALTER DATABASE [Левківська_271_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Левківська_271_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Левківська_271_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Левківська_271_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Левківська_271_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Левківська_271_2] SET QUERY_STORE = OFF
GO
USE [Левківська_271_2]
GO
/****** Object:  Table [dbo].[Актори]    Script Date: 28.05.2023 16:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Актори](
	[Код актора] [int] NOT NULL,
	[Прізвище] [nchar](20) NULL,
	[Ім'я] [nchar](10) NULL,
	[Зарплатня] [money] NULL,
	[Стаж] [nchar](20) NULL,
 CONSTRAINT [PK_Актори] PRIMARY KEY CLUSTERED 
(
	[Код актора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Зайнятість акторів]    Script Date: 28.05.2023 16:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Зайнятість акторів](
	[Код актора] [int] NOT NULL,
	[Кількість робочих годин] [time](7) NULL,
	[Код спектаклю] [int] NOT NULL,
	[Вартість річного контракту] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[показ спектаклю]    Script Date: 28.05.2023 16:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[показ спектаклю](
	[Код спекталю] [int] NOT NULL,
	[Дата перм'єри] [date] NULL,
	[Зала показу] [nchar](10) NULL,
	[Кількість квитків] [nchar](10) NULL,
	[Бюджет] [nchar](10) NULL,
	[Код головного актора] [int] NOT NULL,
 CONSTRAINT [PK_показ спектаклю] PRIMARY KEY CLUSTERED 
(
	[Код спекталю] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Зайнятість акторів]  WITH CHECK ADD  CONSTRAINT [FK_Зайнятість акторів_Актори] FOREIGN KEY([Код актора])
REFERENCES [dbo].[Актори] ([Код актора])
GO
ALTER TABLE [dbo].[Зайнятість акторів] CHECK CONSTRAINT [FK_Зайнятість акторів_Актори]
GO
ALTER TABLE [dbo].[Зайнятість акторів]  WITH CHECK ADD  CONSTRAINT [FK_Зайнятість акторів_показ спектаклю] FOREIGN KEY([Код спектаклю])
REFERENCES [dbo].[показ спектаклю] ([Код спекталю])
GO
ALTER TABLE [dbo].[Зайнятість акторів] CHECK CONSTRAINT [FK_Зайнятість акторів_показ спектаклю]
GO
ALTER TABLE [dbo].[Зайнятість акторів]  WITH CHECK ADD  CONSTRAINT [FK_Зайнятість акторів_показ спектаклю1] FOREIGN KEY([Код спектаклю])
REFERENCES [dbo].[показ спектаклю] ([Код спекталю])
GO
ALTER TABLE [dbo].[Зайнятість акторів] CHECK CONSTRAINT [FK_Зайнятість акторів_показ спектаклю1]
GO
ALTER TABLE [dbo].[показ спектаклю]  WITH CHECK ADD  CONSTRAINT [FK_показ спектаклю_Актори] FOREIGN KEY([Код головного актора])
REFERENCES [dbo].[Актори] ([Код актора])
GO
ALTER TABLE [dbo].[показ спектаклю] CHECK CONSTRAINT [FK_показ спектаклю_Актори]
GO
USE [master]
GO
ALTER DATABASE [Левківська_271_2] SET  READ_WRITE 
GO
