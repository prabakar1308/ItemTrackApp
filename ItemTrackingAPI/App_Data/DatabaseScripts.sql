USE [master]
GO
/****** Object:  Database [Backlog]    Script Date: 23-01-2017 09:56:35 ******/
CREATE DATABASE [Backlog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BackLog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\Backlog.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BackLog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\Backlog_log.ldf' , SIZE = 6272KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Backlog] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Backlog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Backlog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Backlog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Backlog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Backlog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Backlog] SET ARITHABORT OFF 
GO
ALTER DATABASE [Backlog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Backlog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Backlog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Backlog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Backlog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Backlog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Backlog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Backlog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Backlog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Backlog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Backlog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Backlog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Backlog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Backlog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Backlog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Backlog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Backlog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Backlog] SET RECOVERY FULL 
GO
ALTER DATABASE [Backlog] SET  MULTI_USER 
GO
ALTER DATABASE [Backlog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Backlog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Backlog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Backlog] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Backlog] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Backlog]
GO
/****** Object:  Table [dbo].[TBK_DEV_STATUS]    Script Date: 23-01-2017 09:56:35 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_JIRA_ITEMS]    Script Date: 23-01-2017 09:56:35 ******/
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
	[JiraStatus] [nvarchar](50) NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_QA_DETAILS]    Script Date: 23-01-2017 09:56:35 ******/
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
/****** Object:  Table [dbo].[TBL_QA_STATUS]    Script Date: 23-01-2017 09:56:35 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_RELEASE]    Script Date: 23-01-2017 09:56:35 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_TEAM]    Script Date: 23-01-2017 09:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_TEAM](
	[EmployeeID] [nvarchar](50) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[TrackID] [int] NOT NULL,
	[IsAdmin] [nchar](1) NULL,
 CONSTRAINT [PK_TBL_TEAM] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_TRACK]    Script Date: 23-01-2017 09:56:35 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[TBK_DEV_STATUS] ([StatusCode], [Status]) VALUES (N'DEV', N'In Development')
INSERT [dbo].[TBK_DEV_STATUS] ([StatusCode], [Status]) VALUES (N'EST', N'Estimated')
INSERT [dbo].[TBK_DEV_STATUS] ([StatusCode], [Status]) VALUES (N'TBE', N'To Be Estimated')
INSERT [dbo].[TBL_JIRA_ITEMS] ([JiraID], [ReleaseID], [TrackID], [Application], [Module], [Priority], [Title], [JiraStatus], [Status], [EstimatedBy], [PlannedBundle], [Developer], [Reviewer], [Tester], [Analysis], [Coding], [UnitTesting], [DeveloperEffort], [LeadEffort], [DevEstimatedEffort], [QAEstimatedEffort], [TotalEffort]) VALUES (N'CME006000', 1, 2, N'CircModel', N'CircModel', N'P1', N'HOT - Change the application title', N'In Development', N'EST', N'M1022169', N'Bundle 1', N'M1022169', N'M1022170', N'M1022173', CAST(1.00 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(6.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(7.00 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(9.00 AS Numeric(18, 2)))
INSERT [dbo].[TBL_JIRA_ITEMS] ([JiraID], [ReleaseID], [TrackID], [Application], [Module], [Priority], [Title], [JiraStatus], [Status], [EstimatedBy], [PlannedBundle], [Developer], [Reviewer], [Tester], [Analysis], [Coding], [UnitTesting], [DeveloperEffort], [LeadEffort], [DevEstimatedEffort], [QAEstimatedEffort], [TotalEffort]) VALUES (N'CME006001', 1, 1, N'CircMan', N'CircMan', N'P2', N'Add Post Card Filter/Groupby to Renewals', N'In Development', N'EST', N'M1022171', N'Bundle 1', N'M1022171', N'M1022170', N'M1022172', CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(4.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(5.00 AS Numeric(18, 2)))
INSERT [dbo].[TBL_JIRA_ITEMS] ([JiraID], [ReleaseID], [TrackID], [Application], [Module], [Priority], [Title], [JiraStatus], [Status], [EstimatedBy], [PlannedBundle], [Developer], [Reviewer], [Tester], [Analysis], [Coding], [UnitTesting], [DeveloperEffort], [LeadEffort], [DevEstimatedEffort], [QAEstimatedEffort], [TotalEffort]) VALUES (N'CME006002', 1, 2, N'DataPortal', N'DataPortal', N'P1', N'Add Save functionality to Portal screen', N'In Development', N'EST', N'M1022170', N'Bundle 1', N'M1022170', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TBL_JIRA_ITEMS] ([JiraID], [ReleaseID], [TrackID], [Application], [Module], [Priority], [Title], [JiraStatus], [Status], [EstimatedBy], [PlannedBundle], [Developer], [Reviewer], [Tester], [Analysis], [Coding], [UnitTesting], [DeveloperEffort], [LeadEffort], [DevEstimatedEffort], [QAEstimatedEffort], [TotalEffort]) VALUES (N'CME006003', 2, 1, N'SSRS', N'SSRS', N'P1', N'CSU - IC Dashboard Report Changes', N'Estimated', N'TBE', N'M1022171', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TBL_QA_DETAILS] ([JiraID], [QAStatus], [Validation], [TestReadyDate], [TestStartedDate], [TestCompletedDate], [TestedBy], [Rounds], [Defects], [TestCasePassed], [TestCaseFailed], [ActualHours], [Comments]) VALUES (N'CME006000', N'DEV', N'DEV', CAST(N'2016-12-17 13:23:44.000' AS DateTime), CAST(N'2016-12-19 13:23:44.000' AS DateTime), NULL, N'M1022173', 1, 0, 5, 0, 10, NULL)
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
INSERT [dbo].[TBL_RELEASE] ([ReleaseID], [ReleaseName]) VALUES (1, N'MTRL-60.0')
INSERT [dbo].[TBL_RELEASE] ([ReleaseID], [ReleaseName]) VALUES (2, N'MTRL-61.0')
INSERT [dbo].[TBL_RELEASE] ([ReleaseID], [ReleaseName]) VALUES (3, N'CircModelPOC')
INSERT [dbo].[TBL_TEAM] ([EmployeeID], [EmployeeName], [TrackID], [IsAdmin]) VALUES (N'M1022169', N'Prabakar', 2, N'T')
INSERT [dbo].[TBL_TEAM] ([EmployeeID], [EmployeeName], [TrackID], [IsAdmin]) VALUES (N'M1022170', N'Shyjith', 2, N'T')
INSERT [dbo].[TBL_TEAM] ([EmployeeID], [EmployeeName], [TrackID], [IsAdmin]) VALUES (N'M1022171', N'Mohan', 1, N'T')
INSERT [dbo].[TBL_TEAM] ([EmployeeID], [EmployeeName], [TrackID], [IsAdmin]) VALUES (N'M1022172', N'Renuka', 3, N'F')
INSERT [dbo].[TBL_TEAM] ([EmployeeID], [EmployeeName], [TrackID], [IsAdmin]) VALUES (N'M1022173', N'Deepak', 3, N'F')
INSERT [dbo].[TBL_TRACK] ([TrackID], [TrackName]) VALUES (1, N'MS Track')
INSERT [dbo].[TBL_TRACK] ([TrackID], [TrackName]) VALUES (2, N'Java Track')
INSERT [dbo].[TBL_TRACK] ([TrackID], [TrackName]) VALUES (3, N'QA Track')
INSERT [dbo].[TBL_TRACK] ([TrackID], [TrackName]) VALUES (4, N'DB Track')
ALTER TABLE [dbo].[TBL_JIRA_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JIRA_ITEMS_TBK_DEV_STATUS] FOREIGN KEY([Status])
REFERENCES [dbo].[TBK_DEV_STATUS] ([StatusCode])
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS] CHECK CONSTRAINT [FK_TBL_JIRA_ITEMS_TBK_DEV_STATUS]
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_RELEASE] FOREIGN KEY([ReleaseID])
REFERENCES [dbo].[TBL_RELEASE] ([ReleaseID])
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS] CHECK CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_RELEASE]
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TEAM] FOREIGN KEY([EstimatedBy])
REFERENCES [dbo].[TBL_TEAM] ([EmployeeID])
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS] CHECK CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TEAM]
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TEAM1] FOREIGN KEY([Developer])
REFERENCES [dbo].[TBL_TEAM] ([EmployeeID])
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS] CHECK CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TEAM1]
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TEAM2] FOREIGN KEY([Reviewer])
REFERENCES [dbo].[TBL_TEAM] ([EmployeeID])
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS] CHECK CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TEAM2]
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TEAM3] FOREIGN KEY([Tester])
REFERENCES [dbo].[TBL_TEAM] ([EmployeeID])
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS] CHECK CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TEAM3]
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TRACK] FOREIGN KEY([TrackID])
REFERENCES [dbo].[TBL_TRACK] ([TrackID])
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS] CHECK CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TRACK]
GO
ALTER TABLE [dbo].[TBL_QA_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_QA_DETAILS_TBL_QA_STATUS] FOREIGN KEY([QAStatus])
REFERENCES [dbo].[TBL_QA_STATUS] ([StatusCode])
GO
ALTER TABLE [dbo].[TBL_QA_DETAILS] CHECK CONSTRAINT [FK_TBL_QA_DETAILS_TBL_QA_STATUS]
GO
ALTER TABLE [dbo].[TBL_QA_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_QA_DETAILS_TBL_TEAM] FOREIGN KEY([TestedBy])
REFERENCES [dbo].[TBL_TEAM] ([EmployeeID])
GO
ALTER TABLE [dbo].[TBL_QA_DETAILS] CHECK CONSTRAINT [FK_TBL_QA_DETAILS_TBL_TEAM]
GO
USE [master]
GO
ALTER DATABASE [Backlog] SET  READ_WRITE 
GO
