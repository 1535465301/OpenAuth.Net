USE [Workflow.Net]
GO
/****** Object:  Table [dbo].[WorkflowScheme]    Script Date: 09/04/2016 23:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowScheme](
	[Code] [nvarchar](256) NOT NULL,
	[Scheme] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WorkflowScheme] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[WorkflowScheme] ([Code], [Scheme]) VALUES (N'SimpleWF', N'<Process>
  <Designer />
  <Commands>
    <Command Name="Aggree" />
    <Command Name="Reject" />
  </Commands>
  <Activities>
    <Activity Name="物品申请" State="物品申请" IsInitial="True" IsFinal="False" IsForSetState="True" IsAutoSchemeUpdate="True">
      <Designer X="40" Y="170" />
    </Activity>
    <Activity Name="老大批准" State="老大批准" IsInitial="False" IsFinal="False" IsForSetState="True" IsAutoSchemeUpdate="True">
      <Designer X="390" Y="170" />
    </Activity>
    <Activity Name="申请成功" State="申请成功" IsInitial="False" IsFinal="True" IsForSetState="True" IsAutoSchemeUpdate="True">
      <Designer X="670" Y="170" />
    </Activity>
  </Activities>
  <Transitions>
    <Transition Name="Activity_1_Activity_2_1" To="老大批准" From="物品申请" Classifier="Direct" AllowConcatenationType="And" RestrictConcatenationType="And" ConditionsConcatenationType="And" IsFork="false" MergeViaSetState="false" DisableParentStateControl="false">
      <Triggers>
        <Trigger Type="Auto" />
      </Triggers>
      <Conditions>
        <Condition Type="Always" />
      </Conditions>
      <Designer Bending="0.365" />
    </Transition>
    <Transition Name="Activity_2_Activity_3_1" To="申请成功" From="老大批准" Classifier="Direct" AllowConcatenationType="And" RestrictConcatenationType="And" ConditionsConcatenationType="And" IsFork="false" MergeViaSetState="false" DisableParentStateControl="false">
      <Triggers>
        <Trigger Type="Command" NameRef="Aggree" />
      </Triggers>
      <Conditions>
        <Condition Type="Always" />
      </Conditions>
      <Designer />
    </Transition>
    <Transition Name="Activity_2_Activity_1_1" To="物品申请" From="老大批准" Classifier="Reverse" AllowConcatenationType="And" RestrictConcatenationType="And" ConditionsConcatenationType="And" IsFork="false" MergeViaSetState="false" DisableParentStateControl="false">
      <Triggers>
        <Trigger Type="Command" NameRef="Reject" />
      </Triggers>
      <Conditions>
        <Condition Type="Always" />
      </Conditions>
      <Designer Bending="-0.292150030816216" />
    </Transition>
  </Transitions>
</Process>')
/****** Object:  Table [dbo].[WorkflowProcessTransitionHistory]    Script Date: 09/04/2016 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowProcessTransitionHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[ProcessId] [uniqueidentifier] NOT NULL,
	[ExecutorIdentityId] [nvarchar](max) NULL,
	[ActorIdentityId] [nvarchar](max) NULL,
	[FromActivityName] [nvarchar](max) NOT NULL,
	[ToActivityName] [nvarchar](max) NOT NULL,
	[ToStateName] [nvarchar](max) NULL,
	[TransitionTime] [datetime] NOT NULL,
	[TransitionClassifier] [nvarchar](max) NOT NULL,
	[IsFinalised] [bit] NOT NULL,
	[FromStateName] [nvarchar](max) NULL,
	[TriggerName] [nvarchar](max) NULL,
 CONSTRAINT [PK_WorkflowProcessTransitionHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[WorkflowProcessTransitionHistory] ([Id], [ProcessId], [ExecutorIdentityId], [ActorIdentityId], [FromActivityName], [ToActivityName], [ToStateName], [TransitionTime], [TransitionClassifier], [IsFinalised], [FromStateName], [TriggerName]) VALUES (N'74be7112-786d-43e0-9293-ab23662e0119', N'dd7d17ee-6944-4494-9293-854aa7d457e0', NULL, NULL, N'物品申请', N'老大批准', N'老大批准', CAST(0x0000A6770016711F AS DateTime), N'Direct', 0, N'物品申请', NULL)
/****** Object:  Table [dbo].[WorkflowProcessTimer]    Script Date: 09/04/2016 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowProcessTimer](
	[Id] [uniqueidentifier] NOT NULL,
	[ProcessId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[NextExecutionDateTime] [datetime] NOT NULL,
	[Ignore] [bit] NOT NULL,
 CONSTRAINT [PK_WorkflowProcessTimer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkflowProcessScheme]    Script Date: 09/04/2016 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowProcessScheme](
	[Id] [uniqueidentifier] NOT NULL,
	[Scheme] [ntext] NOT NULL,
	[DefiningParameters] [ntext] NOT NULL,
	[DefiningParametersHash] [nvarchar](1024) NOT NULL,
	[SchemeCode] [nvarchar](max) NOT NULL,
	[IsObsolete] [bit] NOT NULL,
	[RootSchemeCode] [nvarchar](max) NULL,
	[RootSchemeId] [uniqueidentifier] NULL,
	[AllowedActivities] [nvarchar](max) NULL,
	[StartingTransition] [nvarchar](max) NULL,
 CONSTRAINT [PK_WorkflowProcessScheme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[WorkflowProcessScheme] ([Id], [Scheme], [DefiningParameters], [DefiningParametersHash], [SchemeCode], [IsObsolete], [RootSchemeCode], [RootSchemeId], [AllowedActivities], [StartingTransition]) VALUES (N'5d038ea9-9c0f-4b19-bb19-7d6265f2bf21', N'<Process>
  <Designer />
  <Commands>
    <Command Name="Aggree" />
    <Command Name="Reject" />
  </Commands>
  <Activities>
    <Activity Name="物品申请" State="物品申请" IsInitial="True" IsFinal="False" IsForSetState="True" IsAutoSchemeUpdate="True">
      <Designer X="40" Y="170" />
    </Activity>
    <Activity Name="老大批准" State="老大批准" IsInitial="False" IsFinal="False" IsForSetState="True" IsAutoSchemeUpdate="True">
      <Designer X="390" Y="170" />
    </Activity>
    <Activity Name="申请成功" State="申请成功" IsInitial="False" IsFinal="True" IsForSetState="True" IsAutoSchemeUpdate="True">
      <Designer X="670" Y="170" />
    </Activity>
  </Activities>
  <Transitions>
    <Transition Name="Activity_1_Activity_2_1" To="老大批准" From="物品申请" Classifier="Direct" AllowConcatenationType="And" RestrictConcatenationType="And" ConditionsConcatenationType="And" IsFork="false" MergeViaSetState="false" DisableParentStateControl="false">
      <Triggers>
        <Trigger Type="Auto" />
      </Triggers>
      <Conditions>
        <Condition Type="Always" />
      </Conditions>
      <Designer Bending="0.365" />
    </Transition>
    <Transition Name="Activity_2_Activity_3_1" To="申请成功" From="老大批准" Classifier="Direct" AllowConcatenationType="And" RestrictConcatenationType="And" ConditionsConcatenationType="And" IsFork="false" MergeViaSetState="false" DisableParentStateControl="false">
      <Triggers>
        <Trigger Type="Command" NameRef="Aggree" />
      </Triggers>
      <Conditions>
        <Condition Type="Always" />
      </Conditions>
      <Designer />
    </Transition>
    <Transition Name="Activity_2_Activity_1_1" To="物品申请" From="老大批准" Classifier="Reverse" AllowConcatenationType="And" RestrictConcatenationType="And" ConditionsConcatenationType="And" IsFork="false" MergeViaSetState="false" DisableParentStateControl="false">
      <Triggers>
        <Trigger Type="Command" NameRef="Reject" />
      </Triggers>
      <Conditions>
        <Condition Type="Always" />
      </Conditions>
      <Designer Bending="-0.292150030816216" />
    </Transition>
  </Transitions>
</Process>', N'{}', N'r4ztHEDMTwYwDqoEyePFlg==', N'SimpleWF', 0, NULL, NULL, N'null', NULL)
/****** Object:  Table [dbo].[WorkflowProcessInstanceStatus]    Script Date: 09/04/2016 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowProcessInstanceStatus](
	[Id] [uniqueidentifier] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Lock] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_WorkflowProcessInstanceStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[WorkflowProcessInstanceStatus] ([Id], [Status], [Lock]) VALUES (N'dd7d17ee-6944-4494-9293-854aa7d457e0', 2, N'2cb6efa9-4c11-47ca-8203-6790233a0f5d')
/****** Object:  Table [dbo].[WorkflowProcessInstancePersistence]    Script Date: 09/04/2016 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowProcessInstancePersistence](
	[Id] [uniqueidentifier] NOT NULL,
	[ProcessId] [uniqueidentifier] NOT NULL,
	[ParameterName] [nvarchar](max) NOT NULL,
	[Value] [ntext] NOT NULL,
 CONSTRAINT [PK_WorkflowProcessInstancePersistence] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkflowProcessInstance]    Script Date: 09/04/2016 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowProcessInstance](
	[Id] [uniqueidentifier] NOT NULL,
	[StateName] [nvarchar](max) NULL,
	[ActivityName] [nvarchar](max) NOT NULL,
	[SchemeId] [uniqueidentifier] NULL,
	[PreviousState] [nvarchar](max) NULL,
	[PreviousStateForDirect] [nvarchar](max) NULL,
	[PreviousStateForReverse] [nvarchar](max) NULL,
	[PreviousActivity] [nvarchar](max) NULL,
	[PreviousActivityForDirect] [nvarchar](max) NULL,
	[PreviousActivityForReverse] [nvarchar](max) NULL,
	[ParentProcessId] [uniqueidentifier] NULL,
	[RootProcessId] [uniqueidentifier] NOT NULL,
	[IsDeterminingParametersChanged] [bit] NOT NULL,
 CONSTRAINT [PK_WorkflowProcessInstance_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[WorkflowProcessInstance] ([Id], [StateName], [ActivityName], [SchemeId], [PreviousState], [PreviousStateForDirect], [PreviousStateForReverse], [PreviousActivity], [PreviousActivityForDirect], [PreviousActivityForReverse], [ParentProcessId], [RootProcessId], [IsDeterminingParametersChanged]) VALUES (N'dd7d17ee-6944-4494-9293-854aa7d457e0', N'老大批准', N'老大批准', N'5d038ea9-9c0f-4b19-bb19-7d6265f2bf21', N'物品申请', N'物品申请', NULL, N'物品申请', N'物品申请', NULL, NULL, N'dd7d17ee-6944-4494-9293-854aa7d457e0', 0)
/****** Object:  Table [dbo].[WorkflowInbox]    Script Date: 09/04/2016 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowInbox](
	[Id] [uniqueidentifier] NOT NULL,
	[ProcessId] [uniqueidentifier] NOT NULL,
	[IdentityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_WorkflowInbox] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkflowGlobalParameter]    Script Date: 09/04/2016 23:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowGlobalParameter](
	[Id] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WorkflowGlobalParameter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedTableType [dbo].[IdsTableType]    Script Date: 09/04/2016 23:37:26 ******/
CREATE TYPE [dbo].[IdsTableType] AS TABLE(
	[Id] [uniqueidentifier] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[DropWorkflowProcesses]    Script Date: 09/04/2016 23:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DropWorkflowProcesses] 
		@Ids  IdsTableType	READONLY
	AS	
	BEGIN
		BEGIN TRAN
	
		DELETE dbo.WorkflowProcessInstance FROM dbo.WorkflowProcessInstance wpi  INNER JOIN @Ids  ids ON wpi.Id = ids.Id 
		DELETE dbo.WorkflowProcessInstanceStatus FROM dbo.WorkflowProcessInstanceStatus wpi  INNER JOIN @Ids  ids ON wpi.Id = ids.Id 
		DELETE dbo.WorkflowProcessInstanceStatus FROM dbo.WorkflowProcessInstancePersistence wpi  INNER JOIN @Ids  ids ON wpi.ProcessId = ids.Id 
	

		COMMIT TRAN
	END
GO
/****** Object:  StoredProcedure [dbo].[DropWorkflowProcess]    Script Date: 09/04/2016 23:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DropWorkflowProcess] 
		@id uniqueidentifier
	AS
	BEGIN
		BEGIN TRAN
	
		DELETE FROM dbo.WorkflowProcessInstance WHERE Id = @id
		DELETE FROM dbo.WorkflowProcessInstanceStatus WHERE Id = @id
		DELETE FROM dbo.WorkflowProcessInstancePersistence  WHERE ProcessId = @id
	
		COMMIT TRAN
	END
GO
/****** Object:  StoredProcedure [dbo].[DropWorkflowInbox]    Script Date: 09/04/2016 23:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DropWorkflowInbox] 
		@processId uniqueidentifier
	AS
	BEGIN
		BEGIN TRAN	
		DELETE FROM dbo.WorkflowInbox WHERE ProcessId = @processId	
		COMMIT TRAN
	END
GO
/****** Object:  StoredProcedure [dbo].[spWorkflowProcessResetRunningStatus]    Script Date: 09/04/2016 23:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spWorkflowProcessResetRunningStatus]
	AS
	BEGIN
		UPDATE [WorkflowProcessInstanceStatus] SET [WorkflowProcessInstanceStatus].[Status] = 2 WHERE [WorkflowProcessInstanceStatus].[Status] = 1
	END
GO
/****** Object:  Default [DF__WorkflowP__IsObs__7F60ED59]    Script Date: 09/04/2016 23:37:26 ******/
ALTER TABLE [dbo].[WorkflowProcessScheme] ADD  DEFAULT ((0)) FOR [IsObsolete]
GO
/****** Object:  Default [DF__WorkflowP__IsDet__023D5A04]    Script Date: 09/04/2016 23:37:26 ******/
ALTER TABLE [dbo].[WorkflowProcessInstance] ADD  DEFAULT ((0)) FOR [IsDeterminingParametersChanged]
GO
