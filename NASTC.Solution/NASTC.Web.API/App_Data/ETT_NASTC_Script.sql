USE [master]
GO
/****** Object:  Database [ETT_NASTC_Local]    Script Date: 6/9/2017 7:51:24 PM ******/
CREATE DATABASE [ETT_NASTC_Local]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ETT_NASTC_Local', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ETT_NASTC_Local.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ETT_NASTC_Local_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ETT_NASTC_Local_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ETT_NASTC_Local] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ETT_NASTC_Local].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ETT_NASTC_Local] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET ARITHABORT OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ETT_NASTC_Local] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ETT_NASTC_Local] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ETT_NASTC_Local] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ETT_NASTC_Local] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ETT_NASTC_Local] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ETT_NASTC_Local] SET  MULTI_USER 
GO
ALTER DATABASE [ETT_NASTC_Local] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ETT_NASTC_Local] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ETT_NASTC_Local] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ETT_NASTC_Local] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ETT_NASTC_Local] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ETT_NASTC_Local]
GO
/****** Object:  Table [dbo].[Nastc_Application]    Script Date: 6/9/2017 7:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nastc_Application](
	[Application_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
	[Description] [varchar](250) NULL,
	[Developer_Id] [bigint] NOT NULL,
	[App_Id] [varchar](25) NOT NULL,
	[Public_Key] [varchar](25) NOT NULL,
	[Private_Key] [varchar](25) NOT NULL,
	[Is_Deleted] [bit] NOT NULL CONSTRAINT [DF_Nastc_Application_Is_Deleted]  DEFAULT ((0)),
	[Created_Time_Stamp] [datetime] NOT NULL CONSTRAINT [DF_Nastc_Application_Created_Time_Stamp]  DEFAULT (getdate()),
	[Updated_Time_Stamp] [datetime] NOT NULL CONSTRAINT [DF_Nastc_Application_Updated_Time_Stamp]  DEFAULT (getdate()),
 CONSTRAINT [PK_Nastc_Application] PRIMARY KEY CLUSTERED 
(
	[Application_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nastc_Member_Details]    Script Date: 6/9/2017 7:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nastc_Member_Details](
	[Member_Details_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Membership_Id] [bigint] NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[Last_Name] [varchar](50) NULL,
	[Business_Name] [varchar](70) NULL,
	[Is_Deleted] [bit] NOT NULL CONSTRAINT [DF_Nastc_Member_Details_Is_Deleted]  DEFAULT ((0)),
	[Create_Time_Stamp] [datetime] NOT NULL CONSTRAINT [DF_Nastc_Member_Details_Create_Time_Stamp]  DEFAULT (getdate()),
	[Update_Time_Stamp] [datetime] NOT NULL CONSTRAINT [DF_Nastc_Member_Details_Update_Time_Stamp]  DEFAULT (getdate()),
 CONSTRAINT [PK_Nastc_Member_Details] PRIMARY KEY CLUSTERED 
(
	[Member_Details_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Nastc_Application] ON 

INSERT [dbo].[Nastc_Application] ([Application_Id], [Name], [Description], [Developer_Id], [App_Id], [Public_Key], [Private_Key], [Is_Deleted], [Created_Time_Stamp], [Updated_Time_Stamp]) VALUES (1, N'Nastc Verification', N'NASTC', 1, N'14A7AD03B16D4658850F8A975', N'tz9z9nbOui4Xm7DjcRlVH4Z', N'pSFlccbTWsvi2KVwuP7anQn3g', 0, CAST(N'2016-04-18 12:05:19.810' AS DateTime), CAST(N'2016-04-18 12:05:19.810' AS DateTime))
SET IDENTITY_INSERT [dbo].[Nastc_Application] OFF
SET IDENTITY_INSERT [dbo].[Nastc_Member_Details] ON 

INSERT [dbo].[Nastc_Member_Details] ([Member_Details_Id], [Membership_Id], [First_Name], [Last_Name], [Business_Name], [Is_Deleted], [Create_Time_Stamp], [Update_Time_Stamp]) VALUES (1, 112536, N'William', N'Osborn', N'Great Land Company', 0, CAST(N'2017-06-09 17:51:36.657' AS DateTime), CAST(N'2017-06-09 17:51:36.657' AS DateTime))
INSERT [dbo].[Nastc_Member_Details] ([Member_Details_Id], [Membership_Id], [First_Name], [Last_Name], [Business_Name], [Is_Deleted], [Create_Time_Stamp], [Update_Time_Stamp]) VALUES (2, 158794, N'Chris', N'Rogers', N'Vincent Traders', 0, CAST(N'2017-06-09 17:52:14.817' AS DateTime), CAST(N'2017-06-09 17:52:14.817' AS DateTime))
INSERT [dbo].[Nastc_Member_Details] ([Member_Details_Id], [Membership_Id], [First_Name], [Last_Name], [Business_Name], [Is_Deleted], [Create_Time_Stamp], [Update_Time_Stamp]) VALUES (3, 215879, N'John', N'Wright', N'Camp Well Trucks', 0, CAST(N'2017-06-09 17:53:16.400' AS DateTime), CAST(N'2017-06-09 17:53:16.400' AS DateTime))
SET IDENTITY_INSERT [dbo].[Nastc_Member_Details] OFF
/****** Object:  StoredProcedure [dbo].[NASTC_MemberVerification]    Script Date: 6/9/2017 7:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NASTC_MemberVerification] 
	(@MemberID BIGINT,
	 @CompanyName VARCHAR(50))
AS
BEGIN
	DECLARE @InputValue VARCHAR(20), @IsMember BIT, @DBValue VARCHAR(20)
	SELECT @InputValue = CONVERT(VARCHAR(10),@MemberID) + SUBSTRING(REPLACE(@CompanyName,' ',''),1,3)	
	DECLARE @IsRecordAvailable INT
	SELECT @IsRecordAvailable = COUNT(*) FROM Nastc_Member_Details WHERE Membership_Id=@MemberID	
	IF  (@IsRecordAvailable > 0) 
		BEGIN
		SELECT @DBValue = (CONVERT(VARCHAR(10),membership_id) + SUBSTRING(REPLACE(business_name,' ',''),1,3)) FROM Nastc_Member_Details WHERE membership_id = @MemberID
		IF (@DBValue = @InputValue)
			BEGIN
			SET @IsMember = 1
			END
		ELSE
			BEGIN
			SET @IsMember = 0
			END
		END	
		ELSE
			BEGIN     
			SET @IsMember = 0
			END	
	SELECT @IsMember AS [Is Member]
END

GO
/****** Object:  StoredProcedure [dbo].[SpMemberVerification]    Script Date: 6/9/2017 7:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpMemberVerification] 
	(@Membership_Id bigint,
	 @Business_Name varchar(50)
	)
AS
BEGIN
    declare @MemberShipValue varchar(20), @IsAvailable bit, @DbValue varchar(20)
	select @MemberShipValue=convert(varchar(10),@Membership_Id)+substring(replace(@Business_Name,' ',''),1,3)
	print convert(varchar(10),@Membership_Id)
	print substring(replace(@Business_Name,' ',''),1,3)
	DECLARE @Test INT
	SELECT @Test=COUNT(*) from Nastc_Member_Details where Membership_Id=@Membership_Id
	
	IF  (@Test>0) 
    BEGIN
		select @DbValue=(convert(varchar(10),membership_id)+substring(replace(business_name,' ',''),1,3)) from Nastc_Member_Details where membership_id=@Membership_Id
		SELECT @MemberShipValue
		IF (@DbValue = @MemberShipValue)
		Begin
			Set @IsAvailable = 1
		End
		ELSE
	BEGIN
		Set @IsAvailable = 0
	END
    END	
    ELSE
    BEGIN     
		Set @IsAvailable = 0
    END	
	select @IsAvailable
END

GO
USE [master]
GO
ALTER DATABASE [ETT_NASTC_Local] SET  READ_WRITE 
GO
