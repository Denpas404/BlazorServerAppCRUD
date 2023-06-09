USE [master]
GO
/****** Object:  Database [BlazorCRUD]    Script Date: 18-04-2023 16:12:30 ******/
CREATE DATABASE [BlazorCRUD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlazorCRUD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BlazorCRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BlazorCRUD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BlazorCRUD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BlazorCRUD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlazorCRUD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlazorCRUD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlazorCRUD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlazorCRUD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlazorCRUD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlazorCRUD] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlazorCRUD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlazorCRUD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlazorCRUD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlazorCRUD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlazorCRUD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlazorCRUD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlazorCRUD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlazorCRUD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlazorCRUD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlazorCRUD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlazorCRUD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlazorCRUD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlazorCRUD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlazorCRUD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlazorCRUD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlazorCRUD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlazorCRUD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlazorCRUD] SET RECOVERY FULL 
GO
ALTER DATABASE [BlazorCRUD] SET  MULTI_USER 
GO
ALTER DATABASE [BlazorCRUD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlazorCRUD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlazorCRUD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlazorCRUD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BlazorCRUD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlazorCRUD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BlazorCRUD', N'ON'
GO
ALTER DATABASE [BlazorCRUD] SET QUERY_STORE = OFF
GO
USE [BlazorCRUD]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 18-04-2023 16:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](150) NOT NULL,
	[LastName] [nvarchar](150) NOT NULL,
	[EmailAddress] [nvarchar](150) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Students]    Script Date: 18-04-2023 16:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[vw_Students]
as
SELECT TOP (1000) [StudentID]
      ,[FirstName]
      ,[LastName]
      ,[EmailAddress]
      ,[Gender]
      ,[CreatedOn]
  FROM [BlazorCRUD].[dbo].[Students]
GO
/****** Object:  View [dbo].[vw_FemaleStudents]    Script Date: 18-04-2023 16:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_FemaleStudents]
as
SELECT TOP (1000) [StudentID]
      ,[FirstName]
      ,[LastName]
      ,[EmailAddress]
      ,[Gender]
      ,[CreatedOn]
  FROM [BlazorCRUD].[dbo].[Students]
  where gender = '0'
GO
/****** Object:  StoredProcedure [dbo].[usp_AddNewStudent]    Script Date: 18-04-2023 16:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_AddNewStudent]
(
@FirstName nvarchar(150),
@LastName nvarchar(150),
@EmailAddress nvarchar(150),
@Gender nvarchar(10)
)
AS

BEGIN

INSERT INTO Students (FirstName, LastName, EmailAddress, Gender, CreatedOn) values (@FirstName, @LastName, @EmailAddress, @Gender, GetDate())

END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteStudentRecord]    Script Date: 18-04-2023 16:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE PROC usp_AddNewStudent
--(
--@FirstName nvarchar(150),
--@LastName nvarchar(150),
--@EmailAddress nvarchar(150),
--@Gender nvarchar(10)
--)
--AS

--BEGIN

--INSERT INTO Students (FirstName, LastName, EmailAddress, Gender, CreatedOn) values (@FirstName, @LastName, @EmailAddress, @Gender, GetDate())

--END

--CREATE PROC usp_UpdateStudentRecord
--(
--@StudentID int,
--@FirstName nvarchar(150),
--@LastName nvarchar(150),
--@EmailAddress nvarchar(150),
--@Gender nvarchar(10)
--)
--AS

--BEGIN

--Update
--Students
--SET FirstName = @FirstName, LastName = @LastName, EmailAddress = @EmailAddress, Gender = @Gender
--WHERE StudentID = @StudentID

--END

CREATE PROC [dbo].[usp_DeleteStudentRecord]
(
@StudentID int
)
AS

BEGIN

Delete FROM Students
WHERE StudentID = @StudentID

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetStudentsRecord]    Script Date: 18-04-2023 16:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE PROC usp_AddNewStudent
--(
--@FirstName nvarchar(150),
--@LastName nvarchar(150),
--@EmailAddress nvarchar(150),
--@Gender nvarchar(10)
--)
--AS

--BEGIN

--INSERT INTO Students (FirstName, LastName, EmailAddress, Gender, CreatedOn) values (@FirstName, @LastName, @EmailAddress, @Gender, GetDate())

--END

--CREATE PROC usp_UpdateStudentRecord
--(
--@StudentID int,
--@FirstName nvarchar(150),
--@LastName nvarchar(150),
--@EmailAddress nvarchar(150),
--@Gender nvarchar(10)
--)
--AS

--BEGIN

--Update
--Students
--SET FirstName = @FirstName, LastName = @LastName, EmailAddress = @EmailAddress, Gender = @Gender
--WHERE StudentID = @StudentID

--END

--CREATE PROC usp_DeleteStudentRecord
--(
--@StudentID int
--)
--AS

--BEGIN

--Delete FROM Students
--WHERE StudentID = @StudentID

--END

CREATE PROC [dbo].[usp_GetStudentsRecord]
AS
BEGIN

SELECT StudentID, FirstName, LastName, EmailAddress, Gender, CreatedOn
FROM Students

END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateStudentRecord]    Script Date: 18-04-2023 16:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE PROC usp_AddNewStudent
--(
--@FirstName nvarchar(150),
--@LastName nvarchar(150),
--@EmailAddress nvarchar(150),
--@Gender nvarchar(10)
--)
--AS

--BEGIN

--INSERT INTO Students (FirstName, LastName, EmailAddress, Gender, CreatedOn) values (@FirstName, @LastName, @EmailAddress, @Gender, GetDate())

--END

CREATE PROC [dbo].[usp_UpdateStudentRecord]
(
@StudentID int,
@FirstName nvarchar(150),
@LastName nvarchar(150),
@EmailAddress nvarchar(150),
@Gender nvarchar(10)
)
AS

BEGIN

Update
Students
SET FirstName = @FirstName, LastName = @LastName, EmailAddress = @EmailAddress, Gender = @Gender
WHERE StudentId = @StudentID

END
GO
USE [master]
GO
ALTER DATABASE [BlazorCRUD] SET  READ_WRITE 
GO
