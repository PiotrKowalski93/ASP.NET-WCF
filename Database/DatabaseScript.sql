USE [GunPermissions]
GO

/****** Object:  Table [dbo].[Time]    Script Date: 11.01.2018 19:11:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Time](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Day] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [GunPermissions]
GO

/****** Object:  Table [dbo].[Reasons]    Script Date: 11.01.2018 19:12:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reasons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReasonName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Reasons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [GunPermissions]
GO

/****** Object:  Table [dbo].[Ranks]    Script Date: 11.01.2018 19:11:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ranks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RankName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Ranks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [GunPermissions]
GO

/****** Object:  Table [dbo].[Purpouses]    Script Date: 11.01.2018 19:11:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Purpouses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurpouseName] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_Purpouses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [GunPermissions]
GO

/****** Object:  Table [dbo].[Persons]    Script Date: 11.01.2018 19:11:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Persons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[JobId] [int] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[City] [nvarchar](150) NOT NULL,
	[AgeGroupId] [int] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_AgeGroups] FOREIGN KEY([AgeGroupId])
REFERENCES [dbo].[AgeGroups] ([Id])
GO

ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_AgeGroups]
GO

ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
GO

ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Jobs]
GO


USE [GunPermissions]
GO

/****** Object:  Table [dbo].[MedicalReport]    Script Date: 11.01.2018 19:11:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MedicalReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReasonId] [int] NOT NULL,
	[IsPossitive] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MedicalReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[MedicalReport]  WITH CHECK ADD  CONSTRAINT [FK_MedicalReport_Reasons] FOREIGN KEY([ReasonId])
REFERENCES [dbo].[Reasons] ([Id])
GO

ALTER TABLE [dbo].[MedicalReport] CHECK CONSTRAINT [FK_MedicalReport_Reasons]
GO


USE [GunPermissions]
GO

/****** Object:  Table [dbo].[Jobs]    Script Date: 11.01.2018 19:11:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [GunPermissions]
GO

/****** Object:  Table [dbo].[GunTypes]    Script Date: 11.01.2018 19:11:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GunTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_GunTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [GunPermissions]
GO

/****** Object:  Table [dbo].[Guns]    Script Date: 11.01.2018 19:11:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Guns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GunName] [nvarchar](200) NOT NULL,
	[TypeId] [int] NOT NULL,
	[CaliberId] [int] NOT NULL,
	[SerialNumber] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Guns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Guns]  WITH CHECK ADD  CONSTRAINT [FK_Guns_Calibers] FOREIGN KEY([CaliberId])
REFERENCES [dbo].[Calibers] ([Id])
GO

ALTER TABLE [dbo].[Guns] CHECK CONSTRAINT [FK_Guns_Calibers]
GO

ALTER TABLE [dbo].[Guns]  WITH CHECK ADD  CONSTRAINT [FK_Guns_GunTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[GunTypes] ([Id])
GO

ALTER TABLE [dbo].[Guns] CHECK CONSTRAINT [FK_Guns_GunTypes]
GO

USE [GunPermissions]
GO

/****** Object:  Table [dbo].[AgeGroups]    Script Date: 11.01.2018 19:11:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AgeGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AgeGroup] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AgeGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [GunPermissions]
GO

/****** Object:  Table [dbo].[Approvers]    Script Date: 11.01.2018 19:11:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Approvers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApproverName] [nvarchar](200) NOT NULL,
	[RankId] [int] NOT NULL,
 CONSTRAINT [PK_Approvers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Approvers]  WITH CHECK ADD  CONSTRAINT [FK_Approvers_Approvers] FOREIGN KEY([RankId])
REFERENCES [dbo].[Ranks] ([Id])
GO

ALTER TABLE [dbo].[Approvers] CHECK CONSTRAINT [FK_Approvers_Approvers]
GO

USE [GunPermissions]
GO

/****** Object:  Table [dbo].[Calibers]    Script Date: 11.01.2018 19:10:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Calibers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CaliberSize] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Calibers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [GunPermissions]
GO

/****** Object:  Table [dbo].[Examinations]    Script Date: 11.01.2018 19:10:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Examinations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExaminationScore] [int] NOT NULL,
	[isPassed] [bit] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Examinations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

USE [GunPermissions]
GO

/****** Object:  Table [dbo].[GunPermissionApplications]    Script Date: 11.01.2018 19:10:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GunPermissionApplications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GunId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[PoliceApproverId] [int] NOT NULL,
	[DateId] [int] NOT NULL,
	[MedicalReportId] [int] NOT NULL,
	[PurposeId] [int] NOT NULL,
	[ExaminationId] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL,
 CONSTRAINT [PK_GunPermissionApplications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[GunPermissionApplications]  WITH CHECK ADD  CONSTRAINT [FK_GunPermissionApplications_Approvers] FOREIGN KEY([PoliceApproverId])
REFERENCES [dbo].[Approvers] ([Id])
GO

ALTER TABLE [dbo].[GunPermissionApplications] CHECK CONSTRAINT [FK_GunPermissionApplications_Approvers]
GO

ALTER TABLE [dbo].[GunPermissionApplications]  WITH CHECK ADD  CONSTRAINT [FK_GunPermissionApplications_Examinations] FOREIGN KEY([ExaminationId])
REFERENCES [dbo].[Examinations] ([Id])
GO

ALTER TABLE [dbo].[GunPermissionApplications] CHECK CONSTRAINT [FK_GunPermissionApplications_Examinations]
GO

ALTER TABLE [dbo].[GunPermissionApplications]  WITH CHECK ADD  CONSTRAINT [FK_GunPermissionApplications_Guns] FOREIGN KEY([GunId])
REFERENCES [dbo].[Guns] ([Id])
GO

ALTER TABLE [dbo].[GunPermissionApplications] CHECK CONSTRAINT [FK_GunPermissionApplications_Guns]
GO

ALTER TABLE [dbo].[GunPermissionApplications]  WITH CHECK ADD  CONSTRAINT [FK_GunPermissionApplications_MedicalReport] FOREIGN KEY([MedicalReportId])
REFERENCES [dbo].[MedicalReport] ([Id])
GO

ALTER TABLE [dbo].[GunPermissionApplications] CHECK CONSTRAINT [FK_GunPermissionApplications_MedicalReport]
GO

ALTER TABLE [dbo].[GunPermissionApplications]  WITH CHECK ADD  CONSTRAINT [FK_GunPermissionApplications_Persons] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO

ALTER TABLE [dbo].[GunPermissionApplications] CHECK CONSTRAINT [FK_GunPermissionApplications_Persons]
GO

ALTER TABLE [dbo].[GunPermissionApplications]  WITH CHECK ADD  CONSTRAINT [FK_GunPermissionApplications_Purpouses] FOREIGN KEY([PurposeId])
REFERENCES [dbo].[Purpouses] ([Id])
GO

ALTER TABLE [dbo].[GunPermissionApplications] CHECK CONSTRAINT [FK_GunPermissionApplications_Purpouses]
GO

ALTER TABLE [dbo].[GunPermissionApplications]  WITH CHECK ADD  CONSTRAINT [FK_GunPermissionApplications_Time] FOREIGN KEY([DateId])
REFERENCES [dbo].[Time] ([Id])
GO

ALTER TABLE [dbo].[GunPermissionApplications] CHECK CONSTRAINT [FK_GunPermissionApplications_Time]
GO










