USE [Backlog]
GO
/****** Object:  Table [dbo].[TBL_JIRA_ITEMS]    Script Date: 04-12-2016 23:15:30 ******/
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
	[Status] [nvarchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[TBL_RELEASE]    Script Date: 04-12-2016 23:15:30 ******/
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
/****** Object:  Table [dbo].[TBL_TEAM]    Script Date: 04-12-2016 23:15:30 ******/
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
/****** Object:  Table [dbo].[TBL_TRACK]    Script Date: 04-12-2016 23:15:30 ******/
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
INSERT [dbo].[TBL_JIRA_ITEMS] ([JiraID], [ReleaseID], [TrackID], [Application], [Module], [Priority], [Title], [Status], [EstimatedBy], [PlannedBundle], [Developer], [Reviewer], [Tester], [Analysis], [Coding], [UnitTesting], [DeveloperEffort], [LeadEffort], [DevEstimatedEffort], [QAEstimatedEffort], [TotalEffort]) VALUES (N'CME006000', 1, 2, N'CircModel', N'CircModel', N'P1', N'HOT - Change the application title', N'Estimated', N'Praba', N'Bundle 1', N'Praba', N'Ramesh', N'Deepak', CAST(1.00 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(6.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(7.00 AS Numeric(18, 2)), CAST(2.00 AS Numeric(18, 2)), CAST(9.00 AS Numeric(18, 2)))
INSERT [dbo].[TBL_JIRA_ITEMS] ([JiraID], [ReleaseID], [TrackID], [Application], [Module], [Priority], [Title], [Status], [EstimatedBy], [PlannedBundle], [Developer], [Reviewer], [Tester], [Analysis], [Coding], [UnitTesting], [DeveloperEffort], [LeadEffort], [DevEstimatedEffort], [QAEstimatedEffort], [TotalEffort]) VALUES (N'CME006001', 1, 1, N'CircMan', N'CircMan', N'P2', N'Add Post Card Filter/Groupby to Renewals', N'Estimated', N'Mohan', N'Bundle 1', N'Mohan', N'Vasanth', N'Renuka', CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(4.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(5.00 AS Numeric(18, 2)))
INSERT [dbo].[TBL_JIRA_ITEMS] ([JiraID], [ReleaseID], [TrackID], [Application], [Module], [Priority], [Title], [Status], [EstimatedBy], [PlannedBundle], [Developer], [Reviewer], [Tester], [Analysis], [Coding], [UnitTesting], [DeveloperEffort], [LeadEffort], [DevEstimatedEffort], [QAEstimatedEffort], [TotalEffort]) VALUES (N'CME006002', 1, 2, N'DataPortal', N'DataPortal', N'P1', N'Add Save functionality to Portal screen', N'Estimated', N'Shyjith', N'Bundle 1', N'Shyjith', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TBL_JIRA_ITEMS] ([JiraID], [ReleaseID], [TrackID], [Application], [Module], [Priority], [Title], [Status], [EstimatedBy], [PlannedBundle], [Developer], [Reviewer], [Tester], [Analysis], [Coding], [UnitTesting], [DeveloperEffort], [LeadEffort], [DevEstimatedEffort], [QAEstimatedEffort], [TotalEffort]) VALUES (N'CME006003', 2, 1, N'SSRS', N'SSRS', N'P1', N'CSU - IC Dashboard Report Changes', N'To Be Estimated', N'Mohan', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TBL_RELEASE] ([ReleaseID], [ReleaseName]) VALUES (1, N'MTRL-60.0')
INSERT [dbo].[TBL_RELEASE] ([ReleaseID], [ReleaseName]) VALUES (2, N'MTRL-61.0')
INSERT [dbo].[TBL_RELEASE] ([ReleaseID], [ReleaseName]) VALUES (3, N'CircModelPOC')
INSERT [dbo].[TBL_TEAM] ([EmployeeID], [EmployeeName], [TrackID], [IsAdmin]) VALUES (N'M1022169', N'Prabakar', 2, N'T')
INSERT [dbo].[TBL_TEAM] ([EmployeeID], [EmployeeName], [TrackID], [IsAdmin]) VALUES (N'M1022170', N'Shyjith', 2, N'T')
INSERT [dbo].[TBL_TEAM] ([EmployeeID], [EmployeeName], [TrackID], [IsAdmin]) VALUES (N'M1022171', N'Mohan', 1, N'T')
INSERT [dbo].[TBL_TRACK] ([TrackID], [TrackName]) VALUES (1, N'MS Track')
INSERT [dbo].[TBL_TRACK] ([TrackID], [TrackName]) VALUES (2, N'Java Track')
INSERT [dbo].[TBL_TRACK] ([TrackID], [TrackName]) VALUES (3, N'QA Track')
INSERT [dbo].[TBL_TRACK] ([TrackID], [TrackName]) VALUES (4, N'DB Track')
ALTER TABLE [dbo].[TBL_JIRA_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_RELEASE] FOREIGN KEY([ReleaseID])
REFERENCES [dbo].[TBL_RELEASE] ([ReleaseID])
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS] CHECK CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_RELEASE]
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TRACK] FOREIGN KEY([TrackID])
REFERENCES [dbo].[TBL_TRACK] ([TrackID])
GO
ALTER TABLE [dbo].[TBL_JIRA_ITEMS] CHECK CONSTRAINT [FK_TBL_JIRA_ITEMS_TBL_TRACK]
GO
