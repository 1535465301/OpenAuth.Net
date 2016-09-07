USE [master]
GO
/****** Object:  Database [Workflow.Net]    Script Date: 2016-09-07 17:13:03 ******/
CREATE DATABASE [Workflow.Net]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Workflow.Net', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Workflow.Net.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Workflow.Net_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Workflow.Net_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Workflow.Net] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Workflow.Net].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Workflow.Net] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Workflow.Net] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Workflow.Net] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Workflow.Net] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Workflow.Net] SET ARITHABORT OFF 
GO
ALTER DATABASE [Workflow.Net] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Workflow.Net] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Workflow.Net] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Workflow.Net] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Workflow.Net] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Workflow.Net] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Workflow.Net] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Workflow.Net] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Workflow.Net] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Workflow.Net] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Workflow.Net] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Workflow.Net] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Workflow.Net] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Workflow.Net] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Workflow.Net] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Workflow.Net] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Workflow.Net] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Workflow.Net] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Workflow.Net] SET RECOVERY FULL 
GO
ALTER DATABASE [Workflow.Net] SET  MULTI_USER 
GO
ALTER DATABASE [Workflow.Net] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Workflow.Net] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Workflow.Net] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Workflow.Net] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Workflow.Net', N'ON'
GO
USE [Workflow.Net]
GO
/****** Object:  UserDefinedTableType [dbo].[IdsTableType]    Script Date: 2016-09-07 17:13:03 ******/
CREATE TYPE [dbo].[IdsTableType] AS TABLE(
	[Id] [uniqueidentifier] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[DropWorkflowProcess]    Script Date: 2016-09-07 17:13:03 ******/
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
/****** Object:  StoredProcedure [dbo].[DropWorkflowProcesses]    Script Date: 2016-09-07 17:13:03 ******/
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
/****** Object:  StoredProcedure [dbo].[spWorkflowProcessResetRunningStatus]    Script Date: 2016-09-07 17:13:03 ******/
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
/****** Object:  Table [dbo].[WorkflowGlobalParameter]    Script Date: 2016-09-07 17:13:03 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkflowProcessInstance]    Script Date: 2016-09-07 17:13:03 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkflowProcessInstancePersistence]    Script Date: 2016-09-07 17:13:03 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkflowProcessInstanceStatus]    Script Date: 2016-09-07 17:13:03 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkflowProcessScheme]    Script Date: 2016-09-07 17:13:03 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkflowProcessTimer]    Script Date: 2016-09-07 17:13:03 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkflowProcessTransitionHistory]    Script Date: 2016-09-07 17:13:03 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkflowScheme]    Script Date: 2016-09-07 17:13:03 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[WorkflowScheme] ([Code], [Scheme]) VALUES (N'SimpleWF', N'<Process>
  <Designer />
  <Actors>
    <Actor Name="集团高层" Rule="集团高层" Value="" />
    <Actor Name="研发主管" Rule="研发主管" Value="" />
  </Actors>
  <Commands>
    <Command Name="Aggree" />
    <Command Name="Reject" />
    <Command Name="Submit" />
  </Commands>
  <Activities>
    <Activity Name="编写申请" State="编写申请" IsInitial="True" IsFinal="False" IsForSetState="True" IsAutoSchemeUpdate="True">
      <PreExecutionImplementation>
        <ActionRef Order="1" NameRef="创建流程记录" />
      </PreExecutionImplementation>
      <Designer X="40" Y="130" />
    </Activity>
    <Activity Name="等待主管批准" State="等待主管批准" IsInitial="False" IsFinal="False" IsForSetState="True" IsAutoSchemeUpdate="True">
      <Implementation>
        <ActionRef Order="1" NameRef="更新流程记录" />
      </Implementation>
      <PreExecutionImplementation>
        <ActionRef Order="1" NameRef="创建流程记录" />
      </PreExecutionImplementation>
      <Designer X="400" Y="130" />
    </Activity>
    <Activity Name="等待高层审批" State="等待高层审批" IsInitial="False" IsFinal="False" IsForSetState="True" IsAutoSchemeUpdate="True">
      <Implementation>
        <ActionRef Order="1" NameRef="更新流程记录" />
      </Implementation>
      <PreExecutionImplementation>
        <ActionRef Order="1" NameRef="创建流程记录" />
      </PreExecutionImplementation>
      <Designer X="400" Y="310" />
    </Activity>
    <Activity Name="申请完成" State="申请完成" IsInitial="False" IsFinal="True" IsForSetState="True" IsAutoSchemeUpdate="True">
      <Implementation>
        <ActionRef Order="1" NameRef="更新流程记录" />
      </Implementation>
      <PreExecutionImplementation>
        <ActionRef Order="1" NameRef="创建流程记录" />
      </PreExecutionImplementation>
      <Designer X="660" Y="310" />
    </Activity>
  </Activities>
  <Transitions>
    <Transition Name="Activity_1_Activity_2_1" To="等待主管批准" From="编写申请" Classifier="Direct" AllowConcatenationType="And" RestrictConcatenationType="And" ConditionsConcatenationType="And" IsFork="false" MergeViaSetState="false" DisableParentStateControl="false">
      <Triggers>
        <Trigger Type="Command" NameRef="Submit" />
      </Triggers>
      <Conditions>
        <Condition Type="Always" />
      </Conditions>
      <Designer Bending="0.365" />
    </Transition>
    <Transition Name="Activity_2_Activity_3_1" To="等待高层审批" From="等待主管批准" Classifier="Direct" AllowConcatenationType="And" RestrictConcatenationType="And" ConditionsConcatenationType="And" IsFork="false" MergeViaSetState="false" DisableParentStateControl="false">
      <Restrictions>
        <Restriction Type="Allow" NameRef="研发主管" />
      </Restrictions>
      <Triggers>
        <Trigger Type="Command" NameRef="Aggree" />
      </Triggers>
      <Conditions>
        <Condition Type="Always" />
      </Conditions>
      <Designer />
    </Transition>
    <Transition Name="Activity_2_Activity_1_1" To="编写申请" From="等待主管批准" Classifier="Reverse" AllowConcatenationType="And" RestrictConcatenationType="And" ConditionsConcatenationType="And" IsFork="false" MergeViaSetState="false" DisableParentStateControl="false">
      <Restrictions>
        <Restriction Type="Allow" NameRef="研发主管" />
      </Restrictions>
      <Triggers>
        <Trigger Type="Command" NameRef="Reject" />
      </Triggers>
      <Conditions>
        <Condition Type="Always" />
      </Conditions>
      <Designer Bending="0" />
    </Transition>
    <Transition Name="申请成功_Activity_1_1" To="申请完成" From="等待高层审批" Classifier="Direct" AllowConcatenationType="And" RestrictConcatenationType="And" ConditionsConcatenationType="And" IsFork="false" MergeViaSetState="false" DisableParentStateControl="false">
      <Restrictions>
        <Restriction Type="Allow" NameRef="集团高层" />
      </Restrictions>
      <Triggers>
        <Trigger Type="Command" NameRef="Aggree" />
      </Triggers>
      <Conditions>
        <Condition Type="Always" />
      </Conditions>
      <Designer />
    </Transition>
    <Transition Name="高层审批_物品申请_1" To="编写申请" From="等待高层审批" Classifier="Reverse" AllowConcatenationType="And" RestrictConcatenationType="And" ConditionsConcatenationType="And" IsFork="false" MergeViaSetState="false" DisableParentStateControl="false">
      <Restrictions>
        <Restriction Type="Allow" NameRef="集团高层" />
      </Restrictions>
      <Triggers>
        <Trigger Type="Command" NameRef="Reject" />
      </Triggers>
      <Conditions>
        <Condition Type="Always" />
      </Conditions>
      <Designer />
    </Transition>
  </Transitions>
  <Localization>
    <Localize Type="Command" IsDefault="True" Culture="zh-CN" ObjectName="Aggree" Value="同意" />
    <Localize Type="Command" IsDefault="False" Culture="zh-CN" ObjectName="Reject" Value="拒绝" />
    <Localize Type="Command" IsDefault="False" Culture="zh-CN" ObjectName="Submit" Value="提交" />
  </Localization>
</Process>')
ALTER TABLE [dbo].[WorkflowProcessInstance] ADD  DEFAULT ((0)) FOR [IsDeterminingParametersChanged]
GO
ALTER TABLE [dbo].[WorkflowProcessScheme] ADD  DEFAULT ((0)) FOR [IsObsolete]
GO
USE [master]
GO
ALTER DATABASE [Workflow.Net] SET  READ_WRITE 
GO
