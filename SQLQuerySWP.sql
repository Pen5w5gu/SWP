create database SWP6

ALTER DATABASE [SWP6] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP6] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP6] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP6] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP6] SET  MULTI_USER 
GO
ALTER DATABASE [SWP6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP6] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP6', N'ON'
GO
ALTER DATABASE [SWP6] SET QUERY_STORE = OFF
GO
USE [SWP6]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID_account] [int] IDENTITY(1,1) NOT NULL,
	[User_name] [nvarchar](30) NULL,
	[Password] [varchar](30) NULL,
	[email] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[role_project] [varchar](20) NULL,
	[Id_role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[Id_class] [int] IDENTITY(1,1) NOT NULL,
	[Class_name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id_comment] [int] IDENTITY(1,1) NOT NULL,
	[Comment_description] [nvarchar](max) NULL,
	[Id_task] [int] NULL,
	[id_Account] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_comment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Daily_report]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_report](
	[Id_Report] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Work_Done] [nvarchar](max) NULL,
	[Planning_Tomorrow] [nvarchar](max) NULL,
	[issue] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[Id_task] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Report] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade](
	[Id_grade] [int] IDENTITY(1,1) NOT NULL,
	[Grade_Dailyreport] [varchar](max) NULL,
	[Grade_Code] [varchar](max) NULL,
	[Grade_Document] [varchar](max) NULL,
	[Grade_Presentation] [varchar](max) NULL,
	[Id_Project] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_grade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[In]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[In](
	[Id_in] [int] IDENTITY(1,1) NOT NULL,
	[ID_account] [int] NOT NULL,
	[ID_class] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_in] ASC,
	[ID_account] ASC,
	[ID_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Join]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Join](
	[Id_join] [int] IDENTITY(1,1) NOT NULL,
	[ID_account] [int] NOT NULL,
	[Id_Project] [int] NOT NULL,
	[Allow_access] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_join] ASC,
	[ID_account] ASC,
	[Id_Project] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[milestone]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[milestone](
	[Id_milestone] [int] IDENTITY(1,1) NOT NULL,
	[name_milestone] [nvarchar](max) NULL,
	[Start_date] [date] NULL,
	[End_date] [date] NULL,
	[Id_Project] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_milestone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[norifi_id] [int] NOT NULL,
	[account_id] [int] NULL,
	[notification] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id_Project] [int] IDENTITY(1,1) NOT NULL,
	[Project_name] [nvarchar](max) NULL,
	[Project_description] [nvarchar](max) NULL,
	[Start_date] [date] NULL,
	[End_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Project] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[Id_role] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[Id_task] [int] IDENTITY(1,1) NOT NULL,
	[task_name] [nvarchar](50) NULL,
	[task_description] [nvarchar](max) NULL,
	[Start_date] [date] NULL,
	[End_date] [date] NULL,
	[assign_to] [nvarchar](max) NULL,
	[taskType_Id] [int] NULL,
	[Id_milestone] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_task] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task_type]    Script Date: 3/2/2024 3:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task_type](
	[taskType_Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskType_Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[taskType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1, N'Minh Hằng', N'ohvCFjsHBfTFW6oeA30pig==', N'nguyenthiminhhang141205@gmail.com', 1, NULL, 1)
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (2, N'Account1', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout1@gmail.com', 1, N'TL', 2)
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (3, N'Account2', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout2@gmail.com', 1, N'Dev', 2)
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (4, N'Account3', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout3@gmail.com', 1, N'Dev', 2)
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (5, N'Account4', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout4@gmail.com', 1, N'Dev', 2)
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (6, N'Account5', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout5@gmail.com', 1, N'TL', 2)
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (7, N'Account6', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout6@gmail.com', 1, N'TL', 2)
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (8, N'Account7', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout7@gmail.com', 1, N'Dev', 2)
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (9, N'Account8', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout8@gmail.com', 1, N'Dev', 2)
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (10, N'Vuong Trung', N'ohvCFjsHBfTFW6oeA30pig==', N'tieupumpum832@gmail.com', 0, N'Dev', 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[class] ON 

INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (1, N'1757')
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (2, N'1750')
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (3, N'1749')
SET IDENTITY_INSERT [dbo].[class] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id_comment], [Comment_description], [Id_task], [id_Account]) VALUES (3, N'asdasdasdasd', 3, 7)
INSERT [dbo].[Comment] ([Id_comment], [Comment_description], [Id_task], [id_Account]) VALUES (4, N'asdavdfsdf', 3, 1)
INSERT [dbo].[Comment] ([Id_comment], [Comment_description], [Id_task], [id_Account]) VALUES (5, N'asdasfsdsgsf', 3, 7)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[In] ON 

INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1, 1, 1)
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (2, 1, 2)
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (3, 1, 3)
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (4, 2, 2)
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (5, 3, 2)
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (6, 4, 2)
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (7, 2, 3)
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (8, 5, 3)
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (9, 6, 3)
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (10, 7, 2)
SET IDENTITY_INSERT [dbo].[In] OFF
GO
SET IDENTITY_INSERT [dbo].[Join] ON 

INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1, 2, 1, 1)
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (2, 3, 1, 1)
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (3, 4, 1, 1)
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (4, 5, 2, 1)
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (5, 6, 1, 1)
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (6, 7, 1, 1)
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (7, 8, 3, 1)
SET IDENTITY_INSERT [dbo].[Join] OFF
GO
SET IDENTITY_INSERT [dbo].[milestone] ON 

INSERT [dbo].[milestone] ([Id_milestone], [name_milestone], [Start_date], [End_date], [Id_Project]) VALUES (1, N'interaction1', CAST(N'2022-02-02' AS Date), CAST(N'2022-02-02' AS Date), 1)
INSERT [dbo].[milestone] ([Id_milestone], [name_milestone], [Start_date], [End_date], [Id_Project]) VALUES (2, N'Interaction2', CAST(N'2024-02-28' AS Date), CAST(N'2024-03-05' AS Date), 1)
INSERT [dbo].[milestone] ([Id_milestone], [name_milestone], [Start_date], [End_date], [Id_Project]) VALUES (3, N'asdasd', CAST(N'2024-02-27' AS Date), CAST(N'2024-02-27' AS Date), 1)
SET IDENTITY_INSERT [dbo].[milestone] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1, N'Project A', N'Description for Project A', CAST(N'2023-01-01' AS Date), CAST(N'2024-01-01' AS Date))
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (2, N'Project B', N'Description for Project B', CAST(N'2023-01-01' AS Date), CAST(N'2024-01-01' AS Date))
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (3, N'Project C', N'Description for Project C', CAST(N'2023-01-01' AS Date), CAST(N'2024-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([Id_role], [Role_Name]) VALUES (1, N'lecture')
INSERT [dbo].[role] ([Id_role], [Role_Name]) VALUES (2, N'student')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (3, N'test1', N'test1', CAST(N'2022-01-01' AS Date), CAST(N'2023-01-01' AS Date), N'1', 2, 1)
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (4, N'Task 1', N'Description of Task 1', CAST(N'2024-02-26' AS Date), CAST(N'2024-03-05' AS Date), N'ABC123', 4, 1)
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (5, N'Sample Task', N'This is a sample task description.', CAST(N'2024-02-26' AS Date), CAST(N'2024-03-05' AS Date), N'ABC123', 4, 1)
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (6, N'task 3', N'des', CAST(N'2022-02-02' AS Date), CAST(N'2022-02-02' AS Date), N'dsfsd', 4, 2)
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (7, N'task4', N'des', CAST(N'2022-02-02' AS Date), CAST(N'2022-02-02' AS Date), N'asdasd', 4, 2)
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (8, N'sdfsdf', N'sdf', CAST(N'2024-01-31' AS Date), CAST(N'2024-02-04' AS Date), N'', 4, 1)
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
SET IDENTITY_INSERT [dbo].[Task_type] ON 

INSERT [dbo].[Task_type] ([taskType_Id], [TaskType_Name]) VALUES (1, N'To Do')
INSERT [dbo].[Task_type] ([taskType_Id], [TaskType_Name]) VALUES (2, N'Doing')
INSERT [dbo].[Task_type] ([taskType_Id], [TaskType_Name]) VALUES (3, N'Done')
INSERT [dbo].[Task_type] ([taskType_Id], [TaskType_Name]) VALUES (4, N'Cancel')
SET IDENTITY_INSERT [dbo].[Task_type] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([Id_role])
REFERENCES [dbo].[role] ([Id_role])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([Id_task])
REFERENCES [dbo].[Task] ([Id_task])
GO
ALTER TABLE [dbo].[Daily_report]  WITH CHECK ADD FOREIGN KEY([Id_task])
REFERENCES [dbo].[Task] ([Id_task])
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD FOREIGN KEY([Id_Project])
REFERENCES [dbo].[Project] ([Id_Project])
GO
ALTER TABLE [dbo].[In]  WITH CHECK ADD FOREIGN KEY([ID_account])
REFERENCES [dbo].[Account] ([ID_account])
GO
ALTER TABLE [dbo].[In]  WITH CHECK ADD FOREIGN KEY([ID_class])
REFERENCES [dbo].[class] ([Id_class])
GO
ALTER TABLE [dbo].[Join]  WITH CHECK ADD FOREIGN KEY([ID_account])
REFERENCES [dbo].[Account] ([ID_account])
GO
ALTER TABLE [dbo].[Join]  WITH CHECK ADD FOREIGN KEY([Id_Project])
REFERENCES [dbo].[Project] ([Id_Project])
GO
ALTER TABLE [dbo].[milestone]  WITH CHECK ADD FOREIGN KEY([Id_Project])
REFERENCES [dbo].[Project] ([Id_Project])
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([Id_milestone])
REFERENCES [dbo].[milestone] ([Id_milestone])
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([taskType_Id])
REFERENCES [dbo].[Task_type] ([taskType_Id])
GO
USE [master]
GO
ALTER DATABASE [SWP6] SET  READ_WRITE 
GO