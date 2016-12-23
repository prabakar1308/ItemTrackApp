USE [master]
GO
/****** Object:  Database [BackLog]    Script Date: 12/23/2016 14:51:54 ******/
CREATE DATABASE [BackLog] ON  PRIMARY 
( NAME = N'BackLog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BackLog.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BackLog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BackLog_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BackLog] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BackLog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BackLog] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BackLog] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BackLog] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BackLog] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BackLog] SET ARITHABORT OFF
GO
ALTER DATABASE [BackLog] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [BackLog] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BackLog] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BackLog] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BackLog] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BackLog] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BackLog] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BackLog] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BackLog] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BackLog] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BackLog] SET  DISABLE_BROKER
GO
ALTER DATABASE [BackLog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BackLog] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BackLog] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BackLog] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BackLog] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BackLog] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BackLog] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BackLog] SET  READ_WRITE
GO
ALTER DATABASE [BackLog] SET RECOVERY FULL
GO
ALTER DATABASE [BackLog] SET  MULTI_USER
GO
ALTER DATABASE [BackLog] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BackLog] SET DB_CHAINING OFF
GO
USE [BackLog]
GO
/****** Object:  Table [dbo].[TBK_DEV_STATUS]    Script Date: 12/23/2016 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBK_DEV_STATUS](
	[StatusCode] [nvarchar](5) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TBK_DEV_STATUS] PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TBK_DEV_STATUS] ([StatusCode], [Status]) VALUES (N'DEV', N'In Development')
INSERT [dbo].[TBK_DEV_STATUS] ([StatusCode], [Status]) VALUES (N'EST', N'Estimated')
INSERT [dbo].[TBK_DEV_STATUS] ([StatusCode], [Status]) VALUES (N'TBE', N'To Be Estimated')
/****** Object:  Table [dbo].[TBL_TRACK]    Script Date: 12/23/2016 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TRACK](
	[TrackID] [int] NOT NULL,
	[TrackName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TBL_TRACK] PRIMARY KEY CLUSTERED 
(
	[TrackID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TBL_TRACK] ([TrackID], [TrackName]) VALUES (1, N'MS Track')
INSERT [dbo].[TBL_TRACK] ([TrackID], [TrackName]) VALUES (2, N'Java Track')
INSERT [dbo].[TBL_TRACK] ([TrackID], [TrackName]) VALUES (3, N'QA Track')
INSERT [dbo].[TBL_TRACK] ([TrackID], [TrackName]) VALUES (4, N'DB Track')
/****** Object:  Table [dbo].[TBL_TEAM]    Script Date: 12/23/2016 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TEAM](
	[EmployeeID] [nvarchar](50) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[TrackID] [int] NOT NULL,
	[IsAdmin] [nchar](1) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[TBL_TEAM] ([EmployeeID], [EmployeeName], [TrackID], [IsAdmin]) VALUES (N'M1022169', N'Prabakar', 2, N'T')
INSERT [dbo].[TBL_TEAM] ([EmployeeID], [EmployeeName], [TrackID], [IsAdmin]) VALUES (N'M1022170', N'Shyjith', 2, N'T')
INSERT [dbo].[TBL_TEAM] ([EmployeeID], [EmployeeName], [TrackID], [IsAdmin]) VALUES (N'M1022171', N'Mohan', 1, N'T')
/****** Object:  Table [dbo].[TBL_RELEASE]    Script Date: 12/23/2016 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_RELEASE](
	[ReleaseID] [int] NOT NULL,
	[ReleaseName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TBL_RELEASE] PRIMARY KEY CLUSTERED 
(
	[ReleaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TBL_RELEASE] ([ReleaseID], [ReleaseName]) VALUES (1, N'MTRL-60.0')
INSERT [dbo].[TBL_RELEASE] ([ReleaseID], [ReleaseName]) VALUES (2, N'MTRL-61.0')
INSERT [dbo].[TBL_RELEASE] ([ReleaseID], [ReleaseName]) VALUES (3, N'CircModelPOC')
/****** Object:  Table [dbo].[TBL_QA_STATUS]    Script Date: 12/23/2016 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_QA_STATUS](
	[StatusCode] [nvarchar](5) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TBL_QA_STATUS] PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TBL_QA_STATUS] ([StatusCode], [Status]) VALUES (N'AI', N'Analysis Item')
INSERT [dbo].[TBL_QA_STATUS] ([StatusCode], [Status]) VALUES (N'CLOSE', N'Closed')
INSERT [dbo].[TBL_QA_STATUS] ([StatusCode], [Status]) VALUES (N'DEV', N'In Development')
INSERT [dbo].[TBL_QA_STATUS] ([StatusCode], [Status]) VALUES (N'DOC', N'Documentation')
INSERT [dbo].[TBL_QA_STATUS] ([StatusCode], [Status]) VALUES (N'DTI', N'Deploy to Integration')
INSERT [dbo].[TBL_QA_STATUS] ([StatusCode], [Status]) VALUES (N'FAIL', N'Failed')
INSERT [dbo].[TBL_QA_STATUS] ([StatusCode], [Status]) VALUES (N'IP', N'In Progress')
INSERT [dbo].[TBL_QA_STATUS] ([StatusCode], [Status]) VALUES (N'MP', N'Moved to Production')
INSERT [dbo].[TBL_QA_STATUS] ([StatusCode], [Status]) VALUES (N'NIQA', N'Not in QA Scope')
INSERT [dbo].[TBL_QA_STATUS] ([StatusCode], [Status]) VALUES (N'PASS', N'Passed')
INSERT [dbo].[TBL_QA_STATUS] ([StatusCode], [Status]) VALUES (N'RFT', N'Ready For Testing')
/****** Object:  Table [dbo].[TBL_QA_DETAILS]    Script Date: 12/23/2016 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_QA_DETAILS](
	[JiraID] [nvarchar](9) NOT NULL,
	[QAStatus] [nvarchar](5) NULL,
	[Validation] [nvarchar](50) NULL,
	[TestReadyDate] [datetime] NULL,
	[TestStartedDate] [datetime] NULL,
	[TestCompletedDate] [datetime] NULL,
	[TestedBy] [nvarchar](50) NULL,
	[Rounds] [int] NULL,
	[Defects] [int] NULL,
	[TestCasePassed] [int] NULL,
	[TestCaseFailed] [int] NULL,
	[ActualHours] [int] NULL,
	[Comments] [nvarchar](150) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[TBL_QA_DETAILS] ([JiraID], [QAStatus], [Validation], [TestReadyDate], [TestStartedDate], [TestCompletedDate], [TestedBy], [Rounds], [Defects], [TestCasePassed], [TestCaseFailed], [ActualHours], [Comments]) VALUES (N'CME006000', N'DEV', N'DEV', CAST(0x0000A6DF00DCC080 AS DateTime), CAST(0x0000A6E100DCC080 AS DateTime), NULL, N'Deepak', 1, 0, 5, 0, 10, NULL)
/****** Object:  Table [dbo].[TBL_JIRA_ITEMS]    Script Date: 12/23/2016 14:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_JIRA_ITEMS](
	[JiraID] [nvarchar](9) NOT NULL,
	[ReleaseID] [int] NULL,
	[TrackID] [int] NOT NULL,
	[Application] [nvarchar](50) NOT NULL,
	[Module] [nvarchar](50) NOT NULL,
	[Priority] [nvarchar](2) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](5) NOT NULL,
	[EstimatedBy] [nvarchar](50) NULL,
	[PlannedBundle] [nvarchar](50) NULL,
	[Developer] [nvarchar](50) NULL,
	[Reviewer] [nvarchar](50) NULL,
	[Tester] [nvarchar](50) NULL,
	[Analysis] [numeric](18, 2) NULL,
	[Coding] [numeric](18, 2) NULL,
	[UnitTesting] [numeric](18, 2) NULL,
	[DeveloperEffort] [numeric](18, 2) NULL,
	[LeadEffort] [numeric](18, 2) NULL,
	[DevEstimatedEffort] [numeric](18, 2) NULL,
	[QAEstimatedEffort] [numeric](18, 2) NULL,
	[TotalEffort] [numeric](18, 2) NULL,
 CONSTRAINT [PK_TBL_JIRA_ITEMS] PRIMARY KEY CLUSTERED 
(
	[JiraID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TBL_JIRA_ITEMS] ([JiraID], [ReleaseID], [TrackID], [Application], [Module], [Priority], [Title], [Status], [EstimatedBy], [PlannedBundle], [Developer], [Reviewer], [Tester], [Analysis], [Coding], [UnitTesting], [DeveloperEffort], [LeadEffort], [DevEstimatedEffort], [QAEstimatedEffort], [TotalEffort]) VALUES (N'CME006000', 1, 2, N'CircModel', N'CircModel', N'P1', N'HOT - Change the application title', N'EST', N'Praba', N'Bundle 1', N'Praba', N'Ramesh', N'Deepak', CAST(1.00 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(6.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(7.00 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(9.00 AS Numeric(18, 2)))
INSERT [dbo].[TBL_JIRA_ITEMS] ([JiraID], [ReleaseID], [TrackID], [Application], [Module], [Priority], [Title], [Status], [EstimatedBy], [PlannedBundle], [Developer], [Reviewer], [Tester], [Analysis], [Coding], [UnitTesting], [DeveloperEffort], [LeadEffort], [DevEstimatedEffort], [QAEstimatedEffort], [TotalEffort]) VALUES (N'CME006001', 1, 1, N'CircMan', N'CircMan', N'P2', N'Add Post Card Filter/Groupby to Renewals', N'EST', N'Mohan', N'Bundle 1', N'Mohan', N'Vasanth', N'Renuka', CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(4.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(5.00 AS Numeric(18, 2)))
INSERT [dbo].[TBL_JIRA_ITEMS] ([JiraID], [ReleaseID], [TrackID], [Application], [Module], [Priority], [Title], [Status], [EstimatedBy], [PlannedBundle], [Developer], [Reviewer], [Tester], [Analysis], [Coding], [UnitTesting], [DeveloperEffort], [LeadEffort], [DevEstimatedEffort], [QAEstimatedEffort], [TotalEffort]) VALUES (N'CME006002', 1, 2, N'DataPortal', N'DataPortal', N'P1', N'Add Save functionality to Portal screen', N'EST', N'Shyjith', N'Bundle 1', N'Shyjith', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TBL_JIRA_ITEMS] ([JiraID], [ReleaseID], [TrackID], [Application], [Module], [Priority], [Title], [Status], [EstimatedBy], [PlannedBundle], [Developer], [Reviewer], [Tester], [Analysis], [Coding], [UnitTesting], [DeveloperEffort], [LeadEffort], [DevEstimatedEffort], [QAEstimatedEffort], [TotalEffort]) VALUES (N'CME006003', 2, 1, N'SSRS', N'SSRS', N'P1', N'CSU - IC Dashboard Report Changes', N'TBE', N'Mohan', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
/****** Object:  ForeignKey [FK_TBL_QA_DETAILS_TBL_QA_STATUS]    Script Date: 12/23/2016 14:51:55 ******/
ALTER TABLE [dbo].[TBL_QA_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_QA_DETAILS_TBL_QA_STATUS] FOREIGN KEY([QAStatus])
REFERENCES [dbo].[TBL_QA_STATUS] ([StatusCode])
GO
ALTER TABLE [dbo].[TBL_QA_DETAILS] CHECK CONSTRAINT [FK_TBL_QA_DETAILS_TBL_QA_STATUS]
GO
/****** Object:  ForeignKey [FK_TBL_JIRA_ITEMS_TBK_DEV_STATUS]    Script Date: 12/23/2016 14:51:55 ******/
ALTER TABLE [dbo].[TBL_JIRA_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JIRA_ITEMS_TBK_DEV_STATUS] FOREIGN KEY([Status])
REFERENCES [dbo].[TBK_DEV_STATUS] ([StatusCode])
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS] CHECK CONSTRAINT [FK_TBL_JIRA_ITEMS_TBK_DEV_STATUS]
GO
/****** Object:  ForeignKey [FK_TBL_JIRA_ITEMS_TBL_RELEASE]    Script Date: 12/23/2016 14:51:55 ******/
ALTER TABLE [dbo].[TBL_JIRA_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_RELEASE] FOREIGN KEY([ReleaseID])
REFERENCES [dbo].[TBL_RELEASE] ([ReleaseID])
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS] CHECK CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_RELEASE]
GO
/****** Object:  ForeignKey [FK_TBL_JIRA_ITEMS_TBL_TRACK]    Script Date: 12/23/2016 14:51:55 ******/
ALTER TABLE [dbo].[TBL_JIRA_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TRACK] FOREIGN KEY([TrackID])
REFERENCES [dbo].[TBL_TRACK] ([TrackID])
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS] CHECK CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TRACK]
GO
