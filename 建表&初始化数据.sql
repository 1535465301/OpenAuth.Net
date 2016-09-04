USE [OpenAuthDB]
GO
/****** Object:  UserDefinedDataType [dbo].[varchar(max)]    Script Date: 09/05/2016 00:01:53 ******/
CREATE TYPE [dbo].[varchar(max)] FROM [varchar](max) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[varchar(50)]    Script Date: 09/05/2016 00:01:53 ******/
CREATE TYPE [dbo].[varchar(50)] FROM [varchar](50) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[varchar(200)]    Script Date: 09/05/2016 00:01:53 ******/
CREATE TYPE [dbo].[varchar(200)] FROM [varchar](200) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[decimal (16,2)]    Script Date: 09/05/2016 00:01:53 ******/
CREATE TYPE [dbo].[decimal (16,2)] FROM [decimal](16, 2) NULL
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/05/2016 00:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Account] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Sex] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[BizCode] [varchar](255) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CrateId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [Type], [BizCode], [CreateTime], [CrateId]) VALUES (N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'admin', N'admin', N'admin', 0, 0, 0, N'', CAST(0x0000A67500E5CD17 AS DateTime), NULL)
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [Type], [BizCode], [CreateTime], [CrateId]) VALUES (N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'test', N'test', N'test', 0, 0, 0, N'', CAST(0x0000A67500E5DB2F AS DateTime), NULL)
INSERT [dbo].[User] ([Id], [Account], [Password], [Name], [Sex], [Status], [Type], [BizCode], [CreateTime], [CrateId]) VALUES (N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'testno', N'testno', N'testno(无任何权限)', 0, 0, 0, N'', CAST(0x0000A67500E6096C AS DateTime), NULL)
/****** Object:  Table [dbo].[Stock]    Script Date: 09/05/2016 00:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Number] [int] NOT NULL,
	[Price] [decimal](10, 1) NOT NULL,
	[Status] [int] NOT NULL,
	[Viewable] [varchar](50) NOT NULL,
	[Time] [datetime] NOT NULL,
	[OrgId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品单价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出库/入库' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可见范围' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Viewable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock', @level2type=N'COLUMN',@level2name=N'OrgId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出入库信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stock'
GO
INSERT [dbo].[Stock] ([Id], [Name], [Number], [Price], [Status], [Viewable], [Time], [OrgId]) VALUES (N'b1d19f2b-2fbf-45fa-9805-04e30cda8597', N'普通产品', 3, CAST(100.0 AS Decimal(10, 1)), 0, N'DEV', CAST(0x0000A5E600000000 AS DateTime), NULL)
INSERT [dbo].[Stock] ([Id], [Name], [Number], [Price], [Status], [Viewable], [Time], [OrgId]) VALUES (N'5deb7f53-850d-4bc5-ab03-5982836ffed3', N'权限管理软件一套', 2, CAST(10000.0 AS Decimal(10, 1)), 0, N'ADMIN', CAST(0x0000A5EF00000000 AS DateTime), NULL)
INSERT [dbo].[Stock] ([Id], [Name], [Number], [Price], [Status], [Viewable], [Time], [OrgId]) VALUES (N'20fe07a1-695f-4ded-bb92-6cf8c0d64173', N'权限管理', 1, CAST(10000.0 AS Decimal(10, 1)), 1, N'', CAST(0x0000A68100000000 AS DateTime), N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
INSERT [dbo].[Stock] ([Id], [Name], [Number], [Price], [Status], [Viewable], [Time], [OrgId]) VALUES (N'6a4ed45e-c7f5-4dd7-84bb-7b7c13dc2f5b', N'打印机', 2, CAST(3333.0 AS Decimal(10, 1)), 1, N'', CAST(0x0000A5EF00000000 AS DateTime), NULL)
INSERT [dbo].[Stock] ([Id], [Name], [Number], [Price], [Status], [Viewable], [Time], [OrgId]) VALUES (N'1b2499a3-c89d-4030-8f1e-c2d6b947f4ea', N'高级权限管理', 1, CAST(999.0 AS Decimal(10, 1)), 0, N'ADMIN', CAST(0x0000A5870098A8DC AS DateTime), NULL)
/****** Object:  Table [dbo].[Role]    Script Date: 09/05/2016 00:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateId] [varchar](64) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'CreateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role'
GO
INSERT [dbo].[Role] ([Id], [Name], [Status], [Type], [CreateTime], [CreateId]) VALUES (N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'集团高层', 0, 0, CAST(0x0000A6780000006A AS DateTime), N'')
INSERT [dbo].[Role] ([Id], [Name], [Status], [Type], [CreateTime], [CreateId]) VALUES (N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'研发主管', 1, 0, CAST(0x0000A677018B6766 AS DateTime), N'')
/****** Object:  Table [dbo].[Resource]    Script Date: 09/05/2016 00:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resource](
	[Id] [uniqueidentifier] NOT NULL,
	[CascadeId] [varchar](255) NOT NULL,
	[Key] [varchar](200) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[SortNo] [int] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[CategoryId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点语义ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Resource'
GO
INSERT [dbo].[Resource] ([Id], [CascadeId], [Key], [Name], [Status], [SortNo], [Description], [ParentId], [CategoryId]) VALUES (N'ec99f670-0eca-465c-9f64-d4d5dc510b83', N'', N'DEV', N'开发可见', 0, 0, N'仅开发维护可见的内容', NULL, N'fa37b322-508b-47ce-b29f-b1dacb82637a')
INSERT [dbo].[Resource] ([Id], [CascadeId], [Key], [Name], [Status], [SortNo], [Description], [ParentId], [CategoryId]) VALUES (N'fdf3aac3-4507-40ad-aa2f-d7f0459de252', N'', N'ADMIN', N'管理层可见', 0, 0, N'仅管理层可见的内容', NULL, N'fa37b322-508b-47ce-b29f-b1dacb82637a')
/****** Object:  Table [dbo].[Relevance]    Script Date: 09/05/2016 00:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Relevance](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Key] [varchar](100) NOT NULL,
	[Status] [int] NOT NULL,
	[OperateTime] [datetime] NOT NULL,
	[OperatorId] [int] NOT NULL,
	[FirstId] [uniqueidentifier] NOT NULL,
	[SecondId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Relevance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'OperateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授权人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'OperatorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第一个表主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'FirstId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第二个表主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance', @level2type=N'COLUMN',@level2name=N'SecondId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多对多关系集中映射' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Relevance'
GO
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1cf19b35-e2c2-436f-99b9-03ac2b232cc6', N'', N'RoleElement', 0, CAST(0x0000A6770180D0ED AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'44075557-496e-4dde-bb75-7b69f51ab4fe')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'dfd5430b-3422-465a-be79-05a1e06deed2', N'', N'RoleElement', 0, CAST(0x0000A6770180C45D AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'c7d7daf0-3669-4a22-8bed-b092617deb9c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6db5666b-6f8c-4e83-bada-0b45054bd9a4', N'', N'RoleElement', 0, CAST(0x0000A6770180B649 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'0d25438e-1436-48e0-aedf-0f1690693282')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'3bcaab20-e096-480e-a9bb-0fdb70686714', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4E AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'cf7388be-2677-427c-ad78-8f00f1062b96')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a051aa08-38da-4b6d-8d90-10b3c2485e4b', N'', N'RoleOrg', 0, CAST(0x0000A6780000006A AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'543a9fcf-4770-4fd9-865f-030e562be238')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a8123b37-ba70-4aab-aef6-1938733b5210', N'', N'RoleElement', 0, CAST(0x0000A6770180B64A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'c0d8505c-061a-467d-862a-c94f27caa208')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2d0fcc88-a7c0-4d33-8a08-1d688e9dde83', N'', N'RoleModule', 0, CAST(0x0000A6750119279A AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'af263192-daa8-4f29-99b9-1efb96e31627', N'', N'RoleElement', 0, CAST(0x0000A6770180B64A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'645b40ac-4223-44a7-aab4-66eb56cf9864')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c14addeb-1812-4a78-9152-1f7115b22d89', N'', N'UserRole', 0, CAST(0x0000A67800003793 AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'db309d88-fd21-4b81-a4d9-ae6276a1d813')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'832f4a8f-7791-4aa6-bcd2-20dcb6f5ef37', N'', N'UserElement', 0, CAST(0x0000A67500F54A2F AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'15a4f88c-4fae-4cab-ba2f-0cbd2cca8736')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9e46a946-6e81-4f61-bcba-21e4f7fac3df', N'', N'RoleModule', 0, CAST(0x0000A67501192799 AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'df2d90b3-4e2e-40e9-b406-220009726460', N'', N'RoleModule', 0, CAST(0x0000A6770180AD2A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'08ff97f7-17fc-4072-b29a-287135898ece', N'', N'RoleResource', 0, CAST(0x0000A67701809F05 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'fdf3aac3-4507-40ad-aa2f-d7f0459de252')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'1873ed85-a88a-4236-bd40-2c416aa2576c', N'', N'RoleModule', 0, CAST(0x0000A67501192770 AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2d15e438-cc3a-41e9-9b13-325bfd5c804a', N'', N'RoleElement', 0, CAST(0x0000A6770180D68A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'84e38920-f6e5-499c-bf52-a3c6f8499ff7')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'715d017a-68b6-468d-aa3f-32ca4cfd4b9e', N'', N'RoleModule', 0, CAST(0x0000A6770180AD28 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9ad706e3-8e6b-4bc7-a502-371b298ef062', N'', N'RoleElement', 0, CAST(0x0000A6770180DB22 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'ef42721f-d223-4a00-a1d9-80b81121f21a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'77bd93da-2c2b-4ba8-bf05-3a1382811a6a', N'', N'RoleModule', 0, CAST(0x0000A67501192799 AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'84a52091-08a0-4a46-b661-3cd206771c29', N'', N'RoleModule', 0, CAST(0x0000A6770180AD28 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'0031262c-689c-4b96-bae2-2c9d67076ade')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'93bcac7a-0ff1-488c-8d1c-3da7e44cbefc', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4C AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'd1ba6a72-ba14-44c0-baba-46d0ad96fe8a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b2edfee4-f980-4aa5-b547-492d677e0674', N'', N'RoleModule', 0, CAST(0x0000A6770180AD29 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'19c9621c-3d23-46b7-a841-54d5c82ec8e8', N'', N'UserOrg', 0, CAST(0x0000A67500E5DB32 AS DateTime), 0, N'3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'92f0b297-96c1-47d4-84dd-571374431bc0', N'', N'RoleElement', 0, CAST(0x0000A6770180D0EC AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'84694ea5-d6e1-4a65-8a59-7b5b779688d4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'80310629-5e52-482c-9a0f-5c5bdfabcd9e', N'', N'RoleOrg', 0, CAST(0x0000A6780000006F AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9edc7b81-2b51-4193-8805-6062e596ccdc', N'', N'UserOrg', 0, CAST(0x0000A67500E6096F AS DateTime), 0, N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'f6367ca1-0486-46a4-b9c6-65c00936a516', N'', N'RoleElement', 0, CAST(0x0000A6770180C462 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'9e2c6754-f258-4b14-96a0-b9d981196a65')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'361feb63-bde2-49c7-86ec-6df3ec6f0fe3', N'', N'RoleElement', 0, CAST(0x0000A6770180DB23 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'1c870438-4260-43a5-8996-a6e1dc8bbf6a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'5167dbcd-3a32-4ae8-827e-6f381cc58fa2', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4E AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'fa816af1-a28d-47b5-9b8b-c46e18f902e9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'4e613188-0387-4d17-a60d-703b4a606d75', N'', N'RoleModule', 0, CAST(0x0000A6770180AD29 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'72bf4729-af60-42f5-b0d7-717362ffad7f', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4C AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'2feefce1-e3d8-42ac-b811-2352679628da')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'332a373c-f485-4f85-9af9-7792f7462bf1', N'', N'RoleModule', 0, CAST(0x0000A6750119308C AS DateTime), 0, N'648b04c4-4ac2-4d69-bef6-07081ef27871', N'89c3bfbe-246f-4112-8eb1-b6789da54202')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'e84f6b9c-716d-4e94-a1aa-7fd0d1a2e23e', N'', N'RoleModule', 0, CAST(0x0000A6750119308B AS DateTime), 0, N'648b04c4-4ac2-4d69-bef6-07081ef27871', N'069475e3-c997-487a-9f29-e6a864c5c1d4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ad267296-5eba-4d59-b821-8148d8cfb3c6', N'', N'RoleModule', 0, CAST(0x0000A6770180AD28 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'6431a464-6f1f-4ffc-8157-89212b70f09a', N'', N'RoleOrg', 0, CAST(0x0000A6780000006F AS DateTime), 0, N'4980a85b-e3db-4607-bc2c-0baf0140d7df', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'620b368a-7b56-4c74-ab85-8bc91d08ddc9', N'', N'RoleElement', 0, CAST(0x0000A6770180B64A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'1c9acc3e-a40d-4d07-b495-6e60eb9b71b9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'340c60fe-8b95-474c-aa04-9197903998d2', N'', N'RoleModule', 0, CAST(0x0000A6770180AD27 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'bee6572d-8fb8-4e0e-af15-93aafc989717', N'', N'RoleElement', 0, CAST(0x0000A6770180B649 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'68fc793f-069f-43e1-a012-42ac2d7c585c')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'54b2e9b6-1f7c-4a39-92c9-98f58429c1fc', N'', N'RoleModule', 0, CAST(0x0000A6750119279A AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'854e0658-ab8a-4869-b157-9941955acdc6', N'', N'RoleElement', 0, CAST(0x0000A6770180D689 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'1a473afd-cbd4-41e9-9471-81f9435aaabe')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'acb4d37f-8b45-4a99-b364-99f3881dfcda', N'', N'RoleElement', 0, CAST(0x0000A6770180DB1A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'f8dde22a-2a37-47c4-8e67-70fb3af5303e')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9fa50449-5d87-4579-9f1f-9cdcd876976b', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4D AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'6839a297-350b-4215-b680-4e5dfdae5615')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c3050d65-d26b-4e46-bece-a212b0cc00ec', N'', N'RoleElement', 0, CAST(0x0000A6770180B648 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'15a4f88c-4fae-4cab-ba2f-0cbd2cca8736')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'66e25fc5-093d-42ab-85dc-a38f6600889b', N'', N'UserOrg', 0, CAST(0x0000A67500E6096F AS DateTime), 0, N'ea25646b-964b-4d41-ab03-d8964e1494fb', N'c36e43df-3a99-45da-80d9-3ac5d24f4014')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'cc55fb90-cddf-43ff-b33b-a537c934aa5a', N'', N'RoleOrg', 0, CAST(0x0000A677018B6771 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'990cb229-cc18-41f3-8e2b-13f0f0110798')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c4771ac5-3375-4de9-adb8-a603398f0d62', N'', N'RoleElement', 0, CAST(0x0000A6770180D68B AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'2d595a2a-5de5-479e-a331-b53c799a6b10')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a9821db0-49bd-49be-a554-afa811c99760', N'', N'RoleResource', 0, CAST(0x0000A67701809F05 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'ec99f670-0eca-465c-9f64-d4d5dc510b83')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'9d568d6d-d78d-47d6-8fb6-b1327cdbe83a', N'', N'RoleModule', 0, CAST(0x0000A6770180AD29 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b7d3c2a7-f86e-4f2d-8c98-b819f8157a3a', N'', N'RoleOrg', 0, CAST(0x0000A677018B6771 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'75340ad3-fb80-4646-b1de-ba801688ddc2', N'', N'RoleElement', 0, CAST(0x0000A6770180D0ED AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'5ed1681c-13d2-4c87-8675-a8d95c0b40ae')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'aa051096-a23a-431d-9053-bb954f9453a7', N'', N'RoleElement', 0, CAST(0x0000A6770180C45E AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'4bfa8ea0-6b0d-426f-8687-b654575ca780')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'2ca288a6-d222-4328-951e-c01c3e77a0c7', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4D AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'7f071c63-1620-4486-9264-5806b2e63218')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'8b633f3c-965b-4e35-8496-c364890d7760', N'', N'RoleElement', 0, CAST(0x0000A6770180D68A AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'c3d7b478-21e9-4c1e-b866-a3c80be7909b')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c98b3d02-a76b-4ecc-94a5-cfeffd5e29fb', N'', N'RoleModule', 0, CAST(0x0000A67501192798 AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'b08d7763-a725-406f-a7d5-d144f00d716e', N'', N'UserOrg', 0, CAST(0x0000A67500E5CD5F AS DateTime), 0, N'3a95e392-07d4-4af3-b30d-140ca93340f5', N'543a9fcf-4770-4fd9-865f-030e562be238')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a06fe8c6-3f5e-4085-9bbf-e366571a356c', N'', N'RoleElement', 0, CAST(0x0000A6770180D0EB AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'daddf3b9-71b5-45ac-b85d-5a11c522f2f4')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'c58cb482-6ab7-49eb-b5b0-e45424b6e502', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4E AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'34730f5a-d307-457b-9041-5f7de30abfa9')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'a0904102-e26a-4bc5-9c95-ed5ef977586b', N'', N'RoleModule', 0, CAST(0x0000A6750119279A AS DateTime), 0, N'211e12c7-e466-496e-8d26-0660a38e24cc', N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'ad29467e-eeee-494c-ab82-f6be5d2619d5', N'', N'RoleElement', 0, CAST(0x0000A6770180CC4D AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'50c9df24-b233-42cb-9a0d-4ce158c75f86')
INSERT [dbo].[Relevance] ([Id], [Description], [Key], [Status], [OperateTime], [OperatorId], [FirstId], [SecondId]) VALUES (N'88a4c966-d042-4a2e-b133-ff7eded1c5de', N'', N'RoleElement', 0, CAST(0x0000A6770180DB23 AS DateTime), 0, N'db309d88-fd21-4b81-a4d9-ae6276a1d813', N'7b2b1ffb-398b-4f7b-83da-8f484e1bcea0')
/****** Object:  Table [dbo].[Org]    Script Date: 09/05/2016 00:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Org](
	[Id] [uniqueidentifier] NOT NULL,
	[CascadeId] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[HotKey] [varchar](255) NOT NULL,
	[ParentName] [varchar](255) NOT NULL,
	[IsLeaf] [bit] NOT NULL,
	[IsAutoExpand] [bit] NOT NULL,
	[IconName] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[BizCode] [varchar](255) NOT NULL,
	[CustomCode] [varchar](4000) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateId] [int] NOT NULL,
	[SortNo] [int] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Org] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点语义ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'热键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'HotKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否叶子节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'IsLeaf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自动展开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'IsAutoExpand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点图标文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'IconName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务对照码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'BizCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定义扩展码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CustomCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'CreateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Org'
GO
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [Type], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId]) VALUES (N'543a9fcf-4770-4fd9-865f-030e562be238', N'0.1', N'集团总部', N'', N'根节点', 0, 0, N'', 0, 0, N'', N'', CAST(0x0000A56501683E57 AS DateTime), 0, 0, NULL)
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [Type], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId]) VALUES (N'990cb229-cc18-41f3-8e2b-13f0f0110798', N'0.1.3', N'研发部', N'', N'集团总部', 0, 1, N'', 0, 0, N'', N'', CAST(0x0000A5EA00D73ED8 AS DateTime), 0, 0, N'543a9fcf-4770-4fd9-865f-030e562be238')
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [Type], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId]) VALUES (N'08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', N'0.1.3.1', N'研发1组', N'', N'研发部', 0, 0, N'', 0, 0, N'', N'', CAST(0x0000A5EE0127ABF2 AS DateTime), 0, 1, N'990cb229-cc18-41f3-8e2b-13f0f0110798')
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [Type], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId]) VALUES (N'c36e43df-3a99-45da-80d9-3ac5d24f4014', N'0.2', N'汇丰', N'', N'根节点', 0, 0, N'', 0, 0, N'', N'', CAST(0x0000A61200FA1EF5 AS DateTime), 0, 1, NULL)
INSERT [dbo].[Org] ([Id], [CascadeId], [Name], [HotKey], [ParentName], [IsLeaf], [IsAutoExpand], [IconName], [Status], [Type], [BizCode], [CustomCode], [CreateTime], [CreateId], [SortNo], [ParentId]) VALUES (N'86449128-d5ac-44bf-b999-f7735b7458fd', N'0.2.1', N'汇丰软件部', N'', N'汇丰', 0, 0, N'', 0, 0, N'', N'', CAST(0x0000A61200FA3A14 AS DateTime), 0, 1, N'c36e43df-3a99-45da-80d9-3ac5d24f4014')
/****** Object:  Table [dbo].[ModuleElement]    Script Date: 09/05/2016 00:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ModuleElement](
	[Id] [uniqueidentifier] NOT NULL,
	[DomId] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Attr] [varchar](500) NOT NULL,
	[Script] [varchar](500) NOT NULL,
	[Icon] [varchar](255) NOT NULL,
	[Class] [varchar](255) NOT NULL,
	[Remark] [varchar](200) NOT NULL,
	[Sort] [int] NOT NULL,
	[ModuleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ModuleElement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DOM ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'DomId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素附加属性' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Attr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素调用脚本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Script'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'元素样式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块元素表(需要权限控制的按钮)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ModuleElement'
GO
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'38109ca0-32ec-44bd-a243-017e591b532b', N'btnEditStock', N'编辑', N'button', N' ', N'edit()', N'pencil', N'btn-primary', N'编辑进出库', 0, N'89c3bfbe-246f-4112-8eb1-b6789da54202')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'15a4f88c-4fae-4cab-ba2f-0cbd2cca8736', N'btnAssignRes', N'为角色分配资源', N'button', N'', N'openRoleReourceAccess(this)', N'pencil', N'btn-green', N'为角色分配资源', 3, N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'0d25438e-1436-48e0-aedf-0f1690693282', N'btnAccessModule', N'为角色分配模块', N'button', N'', N'assignRoleModule(this)', N'pencil', N'btn-green', N'为角色分配模块', 4, N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'2feefce1-e3d8-42ac-b811-2352679628da', N'btnDel', N'删除', N'button', N'', N'del()', N'trash', N'btn-red', N'刪除用戶', 2, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'816b12b3-e916-446d-a2fa-329cfd13c831', N'btnDetail', N'进度详情', N'button', N'', N'detail()', N'bar', N'btn-green', N'', 4, N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'68484265-7802-4f06-b024-33e8b2f2edcf', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-green', N'申请物品', 0, N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'68fc793f-069f-43e1-a012-42ac2d7c585c', N'btnDel', N'删除', N'button', N'', N'del()', N'trash', N'btn-red', N'删除角色', 2, N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'd1ba6a72-ba14-44c0-baba-46d0ad96fe8a', N'btnRefresh', N'刷新', N'button', N'', N'refresh()', N'refresh', N'btn-green', N'刷新用户', 3, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'50c9df24-b233-42cb-9a0d-4ce158c75f86', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-green', N'添加用戶', 0, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'6839a297-350b-4215-b680-4e5dfdae5615', N'btnAssignReource', N'为用户分配资源', N'button', N'', N'openUserReourceAccess(this)', N'pencil', N'btn-green', N'为用户分配资源', 4, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'7f071c63-1620-4486-9264-5806b2e63218', N'btnAccessRole', N'为用户分配角色', N'button', N'', N'openUserRoleAccess(this)', N'pencil', N'btn-green', N'为用户分配角色', 5, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'daddf3b9-71b5-45ac-b85d-5a11c522f2f4', N'btnDel', N'删除', N'button', N' ', N'del()', N'pencil', N'btn-red', N'删除模块', 0, N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'34730f5a-d307-457b-9041-5f7de30abfa9', N'btnEdit', N'编辑', N'button', N'', N'edit()', N'pencil', N'btn-primary', N'编辑用户', 1, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'645b40ac-4223-44a7-aab4-66eb56cf9864', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-green', N'添加角色', 0, N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'1c9acc3e-a40d-4d07-b495-6e60eb9b71b9', N'btnEdit', N'编辑', N'button', N'', N'edit()', N'pencil', N'btn-primary', N'编辑角色', 1, N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'f8dde22a-2a37-47c4-8e67-70fb3af5303e', N'btnRefresh', N'刷新', N'button', N'', N'refresh()', N'refresh', N'btn-green', N'刷新部门', 0, N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'584c7a3b-d28a-47b4-8648-7797d05d83d1', N'btnDel', N'删除', N'button', N'', N'del()', N'trash', N'btn-danger', N'', 3, N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'84694ea5-d6e1-4a65-8a59-7b5b779688d4', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn btn-green ', N'添加模块', 0, N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'44075557-496e-4dde-bb75-7b69f51ab4fe', N'btnEdit', N'编辑', N'button', N'', N'edit()', N'pencil', N'btn-primary', N'编辑模块', 0, N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'ef42721f-d223-4a00-a1d9-80b81121f21a', N'btnEdit', N'编辑', N'button', N' ', N'edit()', N'pencil', N'btn-primary', N'编辑部门', 0, N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'1a473afd-cbd4-41e9-9471-81f9435aaabe', N'btnEdit', N'编辑', N'button', N' ', N'edit()', N'pencil', N'btn-green', N'编辑分类', 0, N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'6db928fe-93df-460f-9472-8bb0b6cae52c', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-green', N'添加进出库', 0, N'89c3bfbe-246f-4112-8eb1-b6789da54202')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'25023cf0-c823-48b9-807f-8bf978098160', N'btnEdit', N'编辑', N'button', N'', N'edit()', N'pencil', N'btn-primary', N'', 2, N'9486ff22-b696-4d7f-8093-8a3e53c45453')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'cf7388be-2677-427c-ad78-8f00f1062b96', N'btnAssignElement', N'为用户分配菜单', N'button', N'', N'openAssignUserElement(this)', N'pencil', N'btn-green', N'为用户分配菜单', 7, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'7b2b1ffb-398b-4f7b-83da-8f484e1bcea0', N'btnDel', N'删除', N'button', N'', N'del()', N'del', N'btn-red', N'删除部门', 0, N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'84e38920-f6e5-499c-bf52-a3c6f8499ff7', N'btnDelStock', N'删除', N'button', N' ', N'del()', N'trash', N'btn-red', N'删除分类', 0, N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'c3d7b478-21e9-4c1e-b866-a3c80be7909b', N'btnRefresh', N'刷新', N'button', N'', N'refresh()', N'refresh', N'btn-green', N'刷新分类', 0, N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'1c870438-4260-43a5-8996-a6e1dc8bbf6a', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-green', N'添加部门', 0, N'6a9e1346-0c01-44d2-8eb1-f929fdab542a')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'5ed1681c-13d2-4c87-8675-a8d95c0b40ae', N'btnAssign', N'为模块分配按钮', N'button', N'', N'assignButton()', N'bar', N'btn-red', N'为模块分配按钮', 0, N'bc80478d-0547-4437-9cff-be4b40144bdf')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'c7d7daf0-3669-4a22-8bed-b092617deb9c', N'btnDel', N'删除', N'button', N'', N'del()', N'trash', N'btn-red', N'删除资源', 3, N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'2d595a2a-5de5-479e-a331-b53c799a6b10', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-green', N'添加分类', 0, N'a94d5648-c2a9-405e-ba6f-f1602ec9b807')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'4bfa8ea0-6b0d-426f-8687-b654575ca780', N'btnEdit', N'编辑', N'button', N'', N'edit()', N'pencil', N'btn-primary', N'编辑资源', 2, N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'362d1eda-c85e-4b14-a80a-b923291e08de', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-primary', N'添加', 0, N'f0f06b8f-0a86-487c-8b0e-0a12573ccd46')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'9e2c6754-f258-4b14-96a0-b9d981196a65', N'btnAdd', N'添加', N'button', N'', N'add()', N'plus', N'btn-green', N'添加资源', 0, N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'fa816af1-a28d-47b5-9b8b-c46e18f902e9', N'btnAccessModule', N'为用户分配模块', N'button', N'', N'openUserModuleAccess(this)', N'pencil', N'btn-green', N'为用户分配模块', 6, N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'c0d8505c-061a-467d-862a-c94f27caa208', N'btnAssignElement', N'为角色分配菜单', N'button', N'', N'assignRoleElement(this)', N'bar', N'btn-green', N'为角色分配菜单', 5, N'bedb41a2-f310-4775-af99-01be08adda93')
INSERT [dbo].[ModuleElement] ([Id], [DomId], [Name], [Type], [Attr], [Script], [Icon], [Class], [Remark], [Sort], [ModuleId]) VALUES (N'c4c1acbb-9cbf-4b1e-9cc0-ccf5ff544ec2', N'btnDel', N'删除', N'button', N'', N'del()', N'trash', N'btn-danger', N'删除进出库', 0, N'89c3bfbe-246f-4112-8eb1-b6789da54202')
/****** Object:  Table [dbo].[Module]    Script Date: 09/05/2016 00:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Module](
	[Id] [uniqueidentifier] NOT NULL,
	[CascadeId] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Url] [varchar](255) NOT NULL,
	[HotKey] [varchar](255) NOT NULL,
	[IsLeaf] [bit] NOT NULL,
	[IsAutoExpand] [bit] NOT NULL,
	[IconName] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[ParentName] [varchar](255) NOT NULL,
	[Vector] [varchar](255) NOT NULL,
	[SortNo] [int] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模块流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点语义ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模块名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主页面URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'热键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'HotKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否叶子节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IsLeaf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自动展开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IsAutoExpand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点图标文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'IconName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'ParentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'矢量图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'Vector'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能模块表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Module'
GO
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'bedb41a2-f310-4775-af99-01be08adda93', N'0.1.7', N'角色管理', N'/RoleManager/Index', N'', 1, 0, N'', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'0031262c-689c-4b96-bae2-2c9d67076ade', N'0.4.10', N'流程设计', N'/Designer/Index', N'', 1, 1, N'', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'e8dc5db6-4fc4-4795-a1cc-681cbcceec91', N'0.1.6', N'资源管理', N'/ResourceManager/Index', N'', 0, 0, N'', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', N'0.4.9', N'用户管理', N'/UserManager/Index', N'', 0, 0, N'', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'9486ff22-b696-4d7f-8093-8a3e53c45453', N'0.5.2', N'申请物品【流程】', N'/GoodsApplies/Index', N'', 1, 1, N'', 0, N'应用功能', N'', 0, N'069475e3-c997-487a-9f29-e6a864c5c1d4')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'7580672f-a390-4bb6-982d-9a4570cb5199', N'0.4', N'基础配置', N' ', N' ', 1, 0, N' ', 1, N'根节点', N' ', 0, NULL)
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'89c3bfbe-246f-4112-8eb1-b6789da54202', N'0.2.1', N'进出库管理', N'/StockManager/Index', N'ctrl', 0, 0, N'', 0, N'应用功能', N'', 0, N'069475e3-c997-487a-9f29-e6a864c5c1d4')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'bc80478d-0547-4437-9cff-be4b40144bdf', N'0.4.8', N'模块管理', N'/ModuleManager/Index', N' ', 1, 0, N' ', 0, N'基础配置', N' ', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'069475e3-c997-487a-9f29-e6a864c5c1d4', N'0.5', N'应用功能', N'/', N'c', 0, 0, N'home', 0, N'根节点', N'', 0, NULL)
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'a94d5648-c2a9-405e-ba6f-f1602ec9b807', N'0.1.5', N'分类管理', N'/CategoryManager/Index', N'', 0, 0, N'', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
INSERT [dbo].[Module] ([Id], [CascadeId], [Name], [Url], [HotKey], [IsLeaf], [IsAutoExpand], [IconName], [Status], [ParentName], [Vector], [SortNo], [ParentId]) VALUES (N'6a9e1346-0c01-44d2-8eb1-f929fdab542a', N'0.1.3', N'部门管理', N'/OrgManager/Index', N'', 0, 0, N'', 0, N'基础配置', N'', 0, N'7580672f-a390-4bb6-982d-9a4570cb5199')
/****** Object:  Table [dbo].[GoodsApply]    Script Date: 09/05/2016 00:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsApply](
	[Id] [uniqueidentifier] NOT NULL,
	[Sort] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[State] [nvarchar](1024) NOT NULL,
	[StateName] [nvarchar](1024) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ControllerUserId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_GOODSAPPLY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GoodsApply] ON
INSERT [dbo].[GoodsApply] ([Id], [Sort], [Number], [Name], [Comment], [State], [StateName], [UserId], [ControllerUserId]) VALUES (N'dd7d17ee-6944-4494-9293-854aa7d457e0', 3, 1, N'权限系统', N'', N'老大批准', N'老大批准', N'7b485e81-bf8d-4c3b-b95a-29c21015661c', NULL)
SET IDENTITY_INSERT [dbo].[GoodsApply] OFF
/****** Object:  Table [dbo].[DicIndex]    Script Date: 09/05/2016 00:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DicIndex](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Key] [varchar](100) NOT NULL,
	[SortNo] [int] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[CategoryId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_DicIndex] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicIndex', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicIndex', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicIndex', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicIndex', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicIndex', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicIndex'
GO
/****** Object:  Table [dbo].[DicDetail]    Script Date: 09/05/2016 00:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DicDetail](
	[Id] [uniqueidentifier] NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[Text] [nvarchar](100) NOT NULL,
	[SortNo] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[DicId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DicDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文本描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'Text'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属字典ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail', @level2type=N'COLUMN',@level2name=N'DicId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据字典详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DicDetail'
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09/05/2016 00:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [uniqueidentifier] NOT NULL,
	[CascadeId] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[SortNo] [int] NOT NULL,
	[RootKey] [varchar](100) NOT NULL,
	[RootName] [varchar](200) NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点语义ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'CascadeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'SortNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类所属科目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'RootKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类所属科目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'RootName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父节点流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category'
GO
INSERT [dbo].[Category] ([Id], [CascadeId], [Name], [Status], [SortNo], [RootKey], [RootName], [ParentId]) VALUES (N'899dbea5-668b-4869-a330-87f1b71334bc', N'0.4', N'角色类型', 0, 0, N'SYSTEM', N'系统', NULL)
INSERT [dbo].[Category] ([Id], [CascadeId], [Name], [Status], [SortNo], [RootKey], [RootName], [ParentId]) VALUES (N'fa37b322-508b-47ce-b29f-b1dacb82637a', N'0.3', N'机密资源', 0, 0, N'STOCK', N'进出库管理', NULL)
/****** Object:  Default [DF_User_Id]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__User__Account__0B9CA70C]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Account__0B9CA70C]  DEFAULT (' ') FOR [Account]
GO
/****** Object:  Default [DF__User__Password__0C90CB45]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Password__0C90CB45]  DEFAULT (' ') FOR [Password]
GO
/****** Object:  Default [DF__User__Name__0D84EF7E]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Name__0D84EF7E]  DEFAULT (' ') FOR [Name]
GO
/****** Object:  Default [DF__User__Sex__0E7913B7]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Sex__0E7913B7]  DEFAULT ((0)) FOR [Sex]
GO
/****** Object:  Default [DF__User__Status__0F6D37F0]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Status__0F6D37F0]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF__User__Type__10615C29]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Type__10615C29]  DEFAULT ((0)) FOR [Type]
GO
/****** Object:  Default [DF__User__BizCode__11558062]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__BizCode__11558062]  DEFAULT (' ') FOR [BizCode]
GO
/****** Object:  Default [DF__User__CreateTime__1249A49B]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__CreateTime__1249A49B]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF_Stock_Id]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__Stock__Name__04EFA97D]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Name__04EFA97D]  DEFAULT (' ') FOR [Name]
GO
/****** Object:  Default [DF__Stock__Number__05E3CDB6]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Number__05E3CDB6]  DEFAULT ((0)) FOR [Number]
GO
/****** Object:  Default [DF__Stock__Price__06D7F1EF]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Price__06D7F1EF]  DEFAULT ((0)) FOR [Price]
GO
/****** Object:  Default [DF__Stock__Status__07CC1628]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Status__07CC1628]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF__Stock__User__08C03A61]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__User__08C03A61]  DEFAULT (' ') FOR [Viewable]
GO
/****** Object:  Default [DF__Stock__Time__09B45E9A]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF__Stock__Time__09B45E9A]  DEFAULT (getdate()) FOR [Time]
GO
/****** Object:  Default [DF_Role_Id]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__Role__Name__7D4E87B5]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__Name__7D4E87B5]  DEFAULT (' ') FOR [Name]
GO
/****** Object:  Default [DF__Role__Status__7E42ABEE]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__Status__7E42ABEE]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF__Role__Type__7F36D027]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__Type__7F36D027]  DEFAULT ((0)) FOR [Type]
GO
/****** Object:  Default [DF__Role__CreateTime__002AF460]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__CreateTime__002AF460]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF__Role__CreateId__011F1899]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF__Role__CreateId__011F1899]  DEFAULT (' ') FOR [CreateId]
GO
/****** Object:  Default [DF_Resource_Id]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF_Resource_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__Resource__Cascad__75AD65ED]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__Cascad__75AD65ED]  DEFAULT (' ') FOR [CascadeId]
GO
/****** Object:  Default [DF__Resource__Key__76A18A26]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__Key__76A18A26]  DEFAULT (' ') FOR [Key]
GO
/****** Object:  Default [DF__Resource__Name__7795AE5F]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__Name__7795AE5F]  DEFAULT (' ') FOR [Name]
GO
/****** Object:  Default [DF__Resource__Status__797DF6D1]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__Status__797DF6D1]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF__Resource__SortNo__7A721B0A]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__SortNo__7A721B0A]  DEFAULT ((0)) FOR [SortNo]
GO
/****** Object:  Default [DF__Resource__Descri__7C5A637C]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Resource] ADD  CONSTRAINT [DF__Resource__Descri__7C5A637C]  DEFAULT (' ') FOR [Description]
GO
/****** Object:  Default [DF_Relevance_Id]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Relevance] ADD  CONSTRAINT [DF_Relevance_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__Relevance__Descr__70E8B0D0]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Relevance] ADD  CONSTRAINT [DF__Relevance__Descr__70E8B0D0]  DEFAULT (' ') FOR [Description]
GO
/****** Object:  Default [DF__Relevance__Key__71DCD509]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Relevance] ADD  CONSTRAINT [DF__Relevance__Key__71DCD509]  DEFAULT (' ') FOR [Key]
GO
/****** Object:  Default [DF__Relevance__Statu__72D0F942]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Relevance] ADD  CONSTRAINT [DF__Relevance__Statu__72D0F942]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF__Relevance__Opera__73C51D7B]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Relevance] ADD  CONSTRAINT [DF__Relevance__Opera__73C51D7B]  DEFAULT (getdate()) FOR [OperateTime]
GO
/****** Object:  Default [DF__Relevance__Opera__74B941B4]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Relevance] ADD  CONSTRAINT [DF__Relevance__Opera__74B941B4]  DEFAULT ((0)) FOR [OperatorId]
GO
/****** Object:  Default [DF_Org_Id]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF_Org_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__Org__CascadeId__5AF96FB1]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__CascadeId__5AF96FB1]  DEFAULT (' ') FOR [CascadeId]
GO
/****** Object:  Default [DF__Org__Name__5BED93EA]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__Name__5BED93EA]  DEFAULT (' ') FOR [Name]
GO
/****** Object:  Default [DF__Org__HotKey__5CE1B823]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__HotKey__5CE1B823]  DEFAULT (' ') FOR [HotKey]
GO
/****** Object:  Default [DF__Org__ParentName__5ECA0095]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__ParentName__5ECA0095]  DEFAULT (' ') FOR [ParentName]
GO
/****** Object:  Default [DF__Org__IsLeaf__5FBE24CE]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__IsLeaf__5FBE24CE]  DEFAULT ((1)) FOR [IsLeaf]
GO
/****** Object:  Default [DF__Org__IsAutoExpan__60B24907]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__IsAutoExpan__60B24907]  DEFAULT ((0)) FOR [IsAutoExpand]
GO
/****** Object:  Default [DF__Org__IconName__61A66D40]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__IconName__61A66D40]  DEFAULT (' ') FOR [IconName]
GO
/****** Object:  Default [DF__Org__Status__629A9179]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__Status__629A9179]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF__Org__Type__638EB5B2]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__Type__638EB5B2]  DEFAULT ((0)) FOR [Type]
GO
/****** Object:  Default [DF__Org__BizCode__6482D9EB]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__BizCode__6482D9EB]  DEFAULT (' ') FOR [BizCode]
GO
/****** Object:  Default [DF__Org__CustomCode__6576FE24]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__CustomCode__6576FE24]  DEFAULT (' ') FOR [CustomCode]
GO
/****** Object:  Default [DF__Org__CreateTime__666B225D]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__CreateTime__666B225D]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF__Org__CreateId__675F4696]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__CreateId__675F4696]  DEFAULT ((0)) FOR [CreateId]
GO
/****** Object:  Default [DF__Org__SortNo__68536ACF]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Org] ADD  CONSTRAINT [DF__Org__SortNo__68536ACF]  DEFAULT ((0)) FOR [SortNo]
GO
/****** Object:  Default [DF_ModuleElement_Id]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF_ModuleElement_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__ModuleEle__DomId__51700577]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleEle__DomId__51700577]  DEFAULT (' ') FOR [DomId]
GO
/****** Object:  Default [DF__ModuleElem__Name__526429B0]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleElem__Name__526429B0]  DEFAULT (' ') FOR [Name]
GO
/****** Object:  Default [DF__ModuleElem__Type__53584DE9]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleElem__Type__53584DE9]  DEFAULT (' ') FOR [Type]
GO
/****** Object:  Default [DF__ModuleElem__Attr__5540965B]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleElem__Attr__5540965B]  DEFAULT (' ') FOR [Attr]
GO
/****** Object:  Default [DF__ModuleEle__Scrip__5634BA94]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleEle__Scrip__5634BA94]  DEFAULT (' ') FOR [Script]
GO
/****** Object:  Default [DF__ModuleElem__Icon__5728DECD]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleElem__Icon__5728DECD]  DEFAULT (' ') FOR [Icon]
GO
/****** Object:  Default [DF__ModuleEle__Class__581D0306]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleEle__Class__581D0306]  DEFAULT (' ') FOR [Class]
GO
/****** Object:  Default [DF__ModuleEle__Remar__5911273F]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleEle__Remar__5911273F]  DEFAULT (' ') FOR [Remark]
GO
/****** Object:  Default [DF__ModuleElem__Sort__5A054B78]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[ModuleElement] ADD  CONSTRAINT [DF__ModuleElem__Sort__5A054B78]  DEFAULT ((0)) FOR [Sort]
GO
/****** Object:  Default [DF_Module_Id]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF_Module_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__Module__CascadeI__45FE52CB]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__CascadeI__45FE52CB]  DEFAULT (' ') FOR [CascadeId]
GO
/****** Object:  Default [DF__Module__Name__46F27704]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__Name__46F27704]  DEFAULT (' ') FOR [Name]
GO
/****** Object:  Default [DF__Module__Url__47E69B3D]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__Url__47E69B3D]  DEFAULT (' ') FOR [Url]
GO
/****** Object:  Default [DF__Module__HotKey__48DABF76]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__HotKey__48DABF76]  DEFAULT (' ') FOR [HotKey]
GO
/****** Object:  Default [DF__Module__IsLeaf__4AC307E8]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__IsLeaf__4AC307E8]  DEFAULT ((1)) FOR [IsLeaf]
GO
/****** Object:  Default [DF__Module__IsAutoEx__4BB72C21]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__IsAutoEx__4BB72C21]  DEFAULT ((0)) FOR [IsAutoExpand]
GO
/****** Object:  Default [DF__Module__IconName__4CAB505A]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__IconName__4CAB505A]  DEFAULT (' ') FOR [IconName]
GO
/****** Object:  Default [DF__Module__Status__4D9F7493]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__Status__4D9F7493]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF__Module__ParentNa__4E9398CC]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__ParentNa__4E9398CC]  DEFAULT (' ') FOR [ParentName]
GO
/****** Object:  Default [DF__Module__Vector__4F87BD05]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__Vector__4F87BD05]  DEFAULT (' ') FOR [Vector]
GO
/****** Object:  Default [DF__Module__SortNo__507BE13E]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Module] ADD  CONSTRAINT [DF__Module__SortNo__507BE13E]  DEFAULT ((0)) FOR [SortNo]
GO
/****** Object:  Default [DF_GoodsApply_Id]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[GoodsApply] ADD  CONSTRAINT [DF_GoodsApply_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_GoodsApply_Number]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[GoodsApply] ADD  CONSTRAINT [DF_GoodsApply_Number]  DEFAULT ((0)) FOR [Number]
GO
/****** Object:  Default [DF_DicIndex_Id]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[DicIndex] ADD  CONSTRAINT [DF_DicIndex_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__DicIndex__Name__41399DAE]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[DicIndex] ADD  CONSTRAINT [DF__DicIndex__Name__41399DAE]  DEFAULT (' ') FOR [Name]
GO
/****** Object:  Default [DF__DicIndex__Key__422DC1E7]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[DicIndex] ADD  CONSTRAINT [DF__DicIndex__Key__422DC1E7]  DEFAULT (' ') FOR [Key]
GO
/****** Object:  Default [DF__DicIndex__SortNo__4321E620]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[DicIndex] ADD  CONSTRAINT [DF__DicIndex__SortNo__4321E620]  DEFAULT ((0)) FOR [SortNo]
GO
/****** Object:  Default [DF__DicIndex__Descri__450A2E92]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[DicIndex] ADD  CONSTRAINT [DF__DicIndex__Descri__450A2E92]  DEFAULT ('0') FOR [Description]
GO
/****** Object:  Default [DF_DicDetail_Id]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[DicDetail] ADD  CONSTRAINT [DF_DicDetail_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__DicDetail__Value__3B80C458]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[DicDetail] ADD  CONSTRAINT [DF__DicDetail__Value__3B80C458]  DEFAULT (' ') FOR [Value]
GO
/****** Object:  Default [DF__DicDetail__Text__3C74E891]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[DicDetail] ADD  CONSTRAINT [DF__DicDetail__Text__3C74E891]  DEFAULT ('0') FOR [Text]
GO
/****** Object:  Default [DF__DicDetail__SortN__3E5D3103]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[DicDetail] ADD  CONSTRAINT [DF__DicDetail__SortN__3E5D3103]  DEFAULT ((0)) FOR [SortNo]
GO
/****** Object:  Default [DF__DicDetail__Statu__3F51553C]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[DicDetail] ADD  CONSTRAINT [DF__DicDetail__Statu__3F51553C]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF__DicDetail__Descr__40457975]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[DicDetail] ADD  CONSTRAINT [DF__DicDetail__Descr__40457975]  DEFAULT (' ') FOR [Description]
GO
/****** Object:  Default [DF_Category_Id]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__Category__Cascad__34D3C6C9]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__Cascad__34D3C6C9]  DEFAULT (' ') FOR [CascadeId]
GO
/****** Object:  Default [DF__Category__Name__35C7EB02]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__Name__35C7EB02]  DEFAULT (' ') FOR [Name]
GO
/****** Object:  Default [DF__Category__Status__37B03374]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__Status__37B03374]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF__Category__SortNo__38A457AD]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__SortNo__38A457AD]  DEFAULT ((0)) FOR [SortNo]
GO
/****** Object:  Default [DF__Category__RootKe__39987BE6]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__RootKe__39987BE6]  DEFAULT (' ') FOR [RootKey]
GO
/****** Object:  Default [DF__Category__RootNa__3A8CA01F]    Script Date: 09/05/2016 00:01:54 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF__Category__RootNa__3A8CA01F]  DEFAULT (' ') FOR [RootName]
GO
