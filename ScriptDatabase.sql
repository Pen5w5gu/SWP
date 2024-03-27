
/****** Object:  Table [dbo].[Account]    Script Date: 3/27/2024 10:17:05 PM ******/
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
/****** Object:  Table [dbo].[class]    Script Date: 3/27/2024 10:17:06 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 3/27/2024 10:17:06 PM ******/
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
/****** Object:  Table [dbo].[Daily_report]    Script Date: 3/27/2024 10:17:06 PM ******/
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
/****** Object:  Table [dbo].[grade]    Script Date: 3/27/2024 10:17:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade](
	[Id_grade] [int] IDENTITY(1,1) NOT NULL,
	[Grade_Dailyreport] [int] NULL,
	[Grade_Code] [int] NULL,
	[Grade_Document] [int] NULL,
	[Grade_Presentation] [int] NULL,
	[Id_Project] [int] NULL,
 CONSTRAINT [PK__grade__BE7E2184C7A825B0] PRIMARY KEY CLUSTERED 
(
	[Id_grade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[In]    Script Date: 3/27/2024 10:17:06 PM ******/
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
/****** Object:  Table [dbo].[Issue]    Script Date: 3/27/2024 10:17:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issue](
	[Id_issue] [int] IDENTITY(1,1) NOT NULL,
	[Id_milestone] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[Id_author] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Issue_Id] PRIMARY KEY CLUSTERED 
(
	[Id_issue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Join]    Script Date: 3/27/2024 10:17:06 PM ******/
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
/****** Object:  Table [dbo].[milestone]    Script Date: 3/27/2024 10:17:06 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 3/27/2024 10:17:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[noti_id] [int] IDENTITY(1,1) NOT NULL,
	[ID_account] [int] NOT NULL,
	[User_name] [nvarchar](50) NOT NULL,
	[Id_Project] [int] NOT NULL,
	[notification] [nvarchar](4000) NULL,
	[date] [date] NULL,
	[Id_task] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[noti_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 3/27/2024 10:17:06 PM ******/
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
/****** Object:  Table [dbo].[role]    Script Date: 3/27/2024 10:17:06 PM ******/
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
/****** Object:  Table [dbo].[Task]    Script Date: 3/27/2024 10:17:06 PM ******/
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
	[assign_to] [int] NULL,
	[taskType_Id] [int] NULL,
	[Id_milestone] [int] NULL,
 CONSTRAINT [PK__Task__62972C03DDE98C8F] PRIMARY KEY CLUSTERED 
(
	[Id_task] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task_type]    Script Date: 3/27/2024 10:17:06 PM ******/
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
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([Id_role])
REFERENCES [dbo].[role] ([Id_role])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__Id_task__3C69FB99] FOREIGN KEY([Id_task])
REFERENCES [dbo].[Task] ([Id_task])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__Id_task__3C69FB99]
GO
ALTER TABLE [dbo].[Daily_report]  WITH CHECK ADD  CONSTRAINT [FK__Daily_rep__Id_ta__3D5E1FD2] FOREIGN KEY([Id_task])
REFERENCES [dbo].[Task] ([Id_task])
GO
ALTER TABLE [dbo].[Daily_report] CHECK CONSTRAINT [FK__Daily_rep__Id_ta__3D5E1FD2]
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD  CONSTRAINT [FK__grade__Id_Projec__3E52440B] FOREIGN KEY([Id_Project])
REFERENCES [dbo].[Project] ([Id_Project])
GO
ALTER TABLE [dbo].[grade] CHECK CONSTRAINT [FK__grade__Id_Projec__3E52440B]
GO
ALTER TABLE [dbo].[In]  WITH CHECK ADD FOREIGN KEY([ID_account])
REFERENCES [dbo].[Account] ([ID_account])
GO
ALTER TABLE [dbo].[In]  WITH CHECK ADD FOREIGN KEY([ID_class])
REFERENCES [dbo].[class] ([Id_class])
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Author] FOREIGN KEY([Id_author])
REFERENCES [dbo].[Account] ([ID_account])
GO
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Author]
GO
ALTER TABLE [dbo].[Issue]  WITH CHECK ADD  CONSTRAINT [FK_Issue_Milestone] FOREIGN KEY([Id_milestone])
REFERENCES [dbo].[milestone] ([Id_milestone])
GO
ALTER TABLE [dbo].[Issue] CHECK CONSTRAINT [FK_Issue_Milestone]
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
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_milestone] FOREIGN KEY([Id_milestone])
REFERENCES [dbo].[milestone] ([Id_milestone])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_milestone]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Task_type] FOREIGN KEY([taskType_Id])
REFERENCES [dbo].[Task_type] ([taskType_Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Task_type]
GO


--Insert 
SET IDENTITY_INSERT [dbo].[role] ON 
GO
INSERT [dbo].[role] ([Id_role], [Role_Name]) VALUES (1, N'lecture')
GO
INSERT [dbo].[role] ([Id_role], [Role_Name]) VALUES (2, N'student')
GO
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1, N'Minh Hằng', N'ohvCFjsHBfTFW6oeA30pig==', N'nguyenthiminhhang141205@gmail.com', 1, NULL, 1)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (2, N'Account1', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout1@gmail.com', 1, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (3, N'Account2', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout2@gmail.com', 1, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (4, N'Account3', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout3@gmail.com', 1, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (5, N'Account4', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout4@gmail.com', 1, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (6, N'Account5', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout5@gmail.com', 1, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (7, N'Account6', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout6@gmail.com', 1, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (8, N'Account7', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout7@gmail.com', 1, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (9, N'Account8', N'ohvCFjsHBfTFW6oeA30pig==', N'Accout8@gmail.com', 1, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (10, N'Vuong Trung', N'ohvCFjsHBfTFW6oeA30pig==', N'tieupumpum832@gmail.com', 0, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1011, N'Nguyen Van A', N'WAZ7bTTmKKYoRerc/3VJXQ==', N'quannt552003@gmail.com', 0, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1012, N'Nguyen Van Linh', N'J1xWdpMIWhBaA6FmJ4y0mg==', N'linhhoaidoyp@gmail.com', 0, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1013, N'Vu Xuan A', N'+rErlfEYpimR4uiAJAcl9A==', N'Account12@gmail.com', 0, N'Tester', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1014, N'Vu Xuan B', N'MMS3bBMLodd2OWxzCAjVDg==', N'Account13@gmail.com', 0, N'PO', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1015, N'Quan ngu vcl', N'yVdgcTbqZSs5TLVO9mpDDQ==', N'quannt552003@gmail.com', 0, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1016, N'Quan ngu vcl', N'arEBjn3zNhFzrU+qO37HYw==', N'linhhoaidoyp@gmail.com', 0, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1017, N'Quan ngu vcl', N'FFL23GZQc1SasWZFwSpJ5Q==', N'Account12@gmail.com', 0, N'Tester', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1018, N'Quan ngu vcl', N'A+gwsdY3wWdvG72EkG2Vhg==', N'Account13@gmail.com', 0, N'PO', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1019, N'Quan ngu vcl', N'm1Z2YntaQLIz0IZeqxCFqA==', N'abc@gmail.com', 0, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1020, N'Quan ngu vcl', N'9GBejZxNGnarwpio2aYqLw==', N'asd@gmail.com', 0, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1021, N'Quan ngu vcl', N'If9txJO/+VEWwy2qyQDttw==', N'Acco1unt12@gmail.com', 0, N'Tester', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1022, N'Quan ngu vcl', N'/kTmJftoIO0+3Er6v5A7sw==', N'Acco1unt13@gmail.com', 0, N'PO', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1023, N'Quan ngu vcl', N'FwqZi5t1vpDGoxMQI2ysZg==', N'abc1@gmail.com', 0, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1024, N'Quan ngu vcl', N'jzFZRW8Tzyx0Smk6XSg/hA==', N'asd1@gmail.com', 0, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1025, N'Quan ngu vcl', N'ZQLDweiDMy4nGTXJbspWqw==', N'Acco1u1nt12@gmail.com', 0, N'Tester', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1026, N'Quan ngu vcl', N'ktmnwf4Xi/ur/YIdtsAxFQ==', N'Acco1u1nt13@gmail.com', 0, N'PO', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1027, N'Quan ngu vcl', N'ilMVPo7NDifu3b5c/SaRVg==', N'abc11@gmail.com', 0, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1028, N'Quan ngu vcl', N'HKB6/8NxlrDqvWe3y/urGA==', N'asd11@gmail.com', 0, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1029, N'Quan ngu vcl', N'kWj/UuaDM6FOVarU7wrK7g==', N'Acco11u1nt12@gmail.com', 0, N'Tester', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1030, N'Quan ngu vcl', N'qFWiQgeUnUFOH7vqCgqiuw==', N'Acco1u11nt13@gmail.com', 0, N'PO', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1031, N'Quan ngu vcl', N'+NBoo39QgfhIChTPZasYJg==', N'', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1032, N'Quan ngu vcl', N'4XFggaDF/TT6Ri5VXzcdYQ==', N'1abc11@gmail.com', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1033, N'Quan ngu vcl', N'ySnsjiXo1d5J+ApBieUOsA==', N'1abc11@gmail.com', 0, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1034, N'Quan ngu vcl', N'G995F4LXpMsVjRJ9Y1sPew==', N'1abc11@gmail.com', 0, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1035, N'Quan ngu vcl', N'JkoGcdrACy8Ir4VMnUFAAQ==', N'', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1036, N'Quan ngu vcl', N'1tGfoMGFq34Wx8g5UOR+Rg==', N'1asd11@gmail.com', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1037, N'Quan ngu vcl', N'7ts36u2o8M+qm2WQaZaHqQ==', N'1asd11@gmail.com', 0, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1038, N'Quan ngu vcl', N'g1MA2iWFy6Z/xP+Hfs9zHw==', N'1asd11@gmail.com', 0, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1039, N'Quan ngu vcl', N'Hs93ipD+RUh5gcRN9dAk5w==', N'', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1040, N'Quan ngu vcl', N'+yipkmCnD65ZZTsEpT7tEA==', N'A1cco11u1nt12@gmail.com', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1041, N'Quan ngu vcl', N'YXw9UQ1THp9YCz3JLrlfeQ==', N'A1cco11u1nt12@gmail.com', 0, N'Tester', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1042, N'Quan ngu vcl', N'e7SzxJgvVqpdoUeyN/IkoA==', N'A1cco11u1nt12@gmail.com', 0, N'Tester', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1043, N'Quan ngu vcl', N'AKesjT6XnMjJNVw1CfH1ng==', N'', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1044, N'Quan ngu vcl', N'JVM31tJYKHrVe7iCOSYIMQ==', N'A1cco1u11nt13@gmail.com', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1045, N'Quan ngu vcl', N'wMpWa+Sli1wotOijn0ne9Q==', N'A1cco1u11nt13@gmail.com', 0, N'PO', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1046, N'Quan ngu vcl', N'C8Eciks/PUtqi4979AffBg==', N'A1cco1u11nt13@gmail.com', 0, N'PO', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1047, N'Quan ngu vcl1', N'Oef3jB7PlSd6O8JdMTeCUg==', N'', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1048, N'Quan ngu vcl1', N'A2RjIlLx3g2CWpUurp3xxw==', N'1a1bc11@gmail.com', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1049, N'Quan ngu vcl1', N'cpe1ovlTTJlNtnDF/51QLg==', N'1a1bc11@gmail.com', 0, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1050, N'Quan ngu vcl1', N'h6eD7j2JZ3ES/vthzW6v5Q==', N'1a1bc11@gmail.com', 0, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1051, N'Quan ngu vcl2', N'3dzCcoMGIyXZvkbGh4YE7g==', N'', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1052, N'Quan ngu vcl2', N'qnXS/C8U4CJUik4/A8a2tg==', N'1a2sd11@gmail.com', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1053, N'Quan ngu vcl2', N'SrBjTmKaWsjfRqcZBmQz5g==', N'1a2sd11@gmail.com', 0, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1054, N'Quan ngu vcl2', N'odd8gdLn4ZAW9genCGLovQ==', N'1a2sd11@gmail.com', 0, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1055, N'Quan ngu vcl3', N'SuvPekCiUKatD1qmmeS1Nw==', N'', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1056, N'Quan ngu vcl3', N'/FzBMucb7+UK3OH7/ls4OA==', N'A13cco11u1nt12@gmail.com', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1057, N'Quan ngu vcl3', N't4o45SFY0Pmh8VhqExzNxQ==', N'A13cco11u1nt12@gmail.com', 0, N'Tester', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1058, N'Quan ngu vcl3', N'E+rwMC57E9kh97CY7t12Gw==', N'A13cco11u1nt12@gmail.com', 0, N'Tester', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1059, N'Quan ngu vcl4', N'bdRp/DPQZfrGYpR0QAX9HA==', N'', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1060, N'Quan ngu vcl4', N'fxa/TPejfMx0ZJUF5A74wg==', N'A14cco1u11nt13@gmail.com', 0, N'', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1061, N'Quan ngu vcl4', N'UHMtR4nsUsP/qudvx8Va5g==', N'A14cco1u11nt13@gmail.com', 0, N'PO', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1062, N'Quan ngu vcl4', N'Yp4CdLHInh4bTA7OZQN3pg==', N'A14cco1u11nt13@gmail.com', 0, N'PO', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1063, N'Quan ngu vcl1', N'0PVBQ7Bcjxd4YnBA7DsXkQ==', N'1a1bc11@gmail.com', 0, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1064, N'Quan ngu vcl2', N'4bpGVBIwLny2TczmheOrXg==', N'1a2sd11@gmail.com', 0, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1065, N'Quan ngu vcl3', N'GlZP/LhoTwxNBPpyRHkiHQ==', N'A13cco11u1nt12@gmail.com', 0, N'Tester', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1066, N'Quan ngu vcl4', N'vEfrRARLMgI35H/s9Ai9/A==', N'A14cco1u11nt13@gmail.com', 0, N'PO', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1067, N'Quan ngu vcl1', N'teau0JuLK6mxX6Ry+B7vHA==', N'1a1bc11@gmail.com', 0, N'TL', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1068, N'Quan ngu vcl2', N'FgQJbI2H0wh7zodaFdTkiw==', N'1a2sd11@gmail.com', 0, N'Dev', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1069, N'Quan ngu vcl3', N'iBYkU5wGNmyEYTA5ufDsRA==', N'A13cco11u1nt12@gmail.com', 0, N'Tester', 2)
GO
INSERT [dbo].[Account] ([ID_account], [User_name], [Password], [email], [status], [role_project], [Id_role]) VALUES (1070, N'Quan ngu vcl4', N'd8Re6jMQo4WLk1kKrIQUSg==', N'A14cco1u11nt13@gmail.com', 0, N'PO', 2)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1, N'Project A', N'Description for Project A', CAST(N'2023-01-01' AS Date), CAST(N'2024-01-01' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (2, N'Project B', N'Description for Project B', CAST(N'2023-01-01' AS Date), CAST(N'2024-01-01' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (3, N'Project C', N'Description for Project C', CAST(N'2023-01-01' AS Date), CAST(N'2024-01-01' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (4, N'delete', N'delete', CAST(N'2022-02-02' AS Date), CAST(N'2022-02-02' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (5, N'test', NULL, NULL, NULL)
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (6, N'Proecjt 1', NULL, NULL, NULL)
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (7, N'Project 2', NULL, NULL, NULL)
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (8, N'Project 3', NULL, NULL, NULL)
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (9, N'Project 4', NULL, NULL, NULL)
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (10, N'project 5', N'', CAST(N'2024-03-05' AS Date), CAST(N'2024-03-05' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (11, N'Project 6', N'', CAST(N'2024-03-05' AS Date), CAST(N'2024-03-05' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1004, N'', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1005, N'Proecjtabc 1', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1006, N'Test Project', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1007, N'Project 3abc', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1008, N'Projecabct 6', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1009, N'kkk', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1010, N'qqq', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1011, N'jjj', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1012, N'aaa', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1013, N'11.0', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1014, N'22.0', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1015, N'33.0', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Project] ([Id_Project], [Project_name], [Project_description], [Start_date], [End_date]) VALUES (1016, N'44.0', N'', CAST(N'2024-03-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
SET IDENTITY_INSERT [dbo].[milestone] ON 
GO
INSERT [dbo].[milestone] ([Id_milestone], [name_milestone], [Start_date], [End_date], [Id_Project]) VALUES (1, N'interaction1', CAST(N'2022-02-14' AS Date), CAST(N'2022-02-27' AS Date), 1)
GO
INSERT [dbo].[milestone] ([Id_milestone], [name_milestone], [Start_date], [End_date], [Id_Project]) VALUES (2, N'Interaction2', CAST(N'2024-02-28' AS Date), CAST(N'2024-03-05' AS Date), 1)
GO
INSERT [dbo].[milestone] ([Id_milestone], [name_milestone], [Start_date], [End_date], [Id_Project]) VALUES (3, N'interaction4', CAST(N'2024-03-05' AS Date), CAST(N'2024-03-05' AS Date), 4)
GO
INSERT [dbo].[milestone] ([Id_milestone], [name_milestone], [Start_date], [End_date], [Id_Project]) VALUES (5, N'test', CAST(N'2022-02-02' AS Date), CAST(N'2022-02-02' AS Date), 4)
GO
INSERT [dbo].[milestone] ([Id_milestone], [name_milestone], [Start_date], [End_date], [Id_Project]) VALUES (6, N'interaction 1', CAST(N'2024-03-12' AS Date), CAST(N'2024-03-13' AS Date), 4)
GO
SET IDENTITY_INSERT [dbo].[milestone] OFF
GO
SET IDENTITY_INSERT [dbo].[Issue] ON 
GO
INSERT [dbo].[Issue] ([Id_issue], [Id_milestone], [Title], [Content], [Status], [Id_author], [Date]) VALUES (1, 1, N'1', N'sdf', 1, 2, CAST(N'2022-02-02' AS Date))
GO
INSERT [dbo].[Issue] ([Id_issue], [Id_milestone], [Title], [Content], [Status], [Id_author], [Date]) VALUES (3, 2, N'asdasda', N'asdasd', 1, 1, CAST(N'2022-02-02' AS Date))
GO
INSERT [dbo].[Issue] ([Id_issue], [Id_milestone], [Title], [Content], [Status], [Id_author], [Date]) VALUES (4, 2, N'asdasdad', N'Asdasdasd', 1, 4, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Issue] ([Id_issue], [Id_milestone], [Title], [Content], [Status], [Id_author], [Date]) VALUES (5, 1, N'123', N'123', 1, 1, CAST(N'2024-03-22' AS Date))
GO
INSERT [dbo].[Issue] ([Id_issue], [Id_milestone], [Title], [Content], [Status], [Id_author], [Date]) VALUES (6, 1, N'1', N'123', 1, 1, CAST(N'2024-03-22' AS Date))
GO
INSERT [dbo].[Issue] ([Id_issue], [Id_milestone], [Title], [Content], [Status], [Id_author], [Date]) VALUES (7, 1, N'1', N'123', 1, 1, CAST(N'2024-03-22' AS Date))
GO
INSERT [dbo].[Issue] ([Id_issue], [Id_milestone], [Title], [Content], [Status], [Id_author], [Date]) VALUES (8, 1, N'1', N'123', 1, 1, CAST(N'2024-03-22' AS Date))
GO
INSERT [dbo].[Issue] ([Id_issue], [Id_milestone], [Title], [Content], [Status], [Id_author], [Date]) VALUES (9, 1, N'1', N'123', 1, 1, CAST(N'2024-03-22' AS Date))
GO
INSERT [dbo].[Issue] ([Id_issue], [Id_milestone], [Title], [Content], [Status], [Id_author], [Date]) VALUES (10, 1, N'error in task', N'bla bla', 1, 1, CAST(N'2024-03-22' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Issue] OFF
GO
SET IDENTITY_INSERT [dbo].[class] ON 
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (1, N'1757')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (2, N'1750')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (3, N'1749')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (26, N'1777')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (27, N'test123')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (28, N'dfgdfgdfg')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (1004, N'New Class ')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (1005, N'Test add new class')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (1006, N'TESTTTTTT')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (1007, N'Final Test')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (1008, N'sdafsdgsdfgsfdg')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (1009, N'kkkkkkkkkkkkk')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (1010, N'Tung dep trai')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (1011, N'asd')
GO
INSERT [dbo].[class] ([Id_class], [Class_name]) VALUES (1012, N'dgbhxfnxghm')
GO
SET IDENTITY_INSERT [dbo].[class] OFF
GO
SET IDENTITY_INSERT [dbo].[In] ON 
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1, 1, 1)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (2, 1, 2)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (3, 1, 3)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (4, 2, 2)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (5, 3, 2)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (6, 4, 2)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (7, 2, 3)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (8, 5, 3)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (9, 6, 3)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (10, 7, 2)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (11, 6, 2)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1015, 1, 1004)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1016, 1011, 1005)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1017, 1012, 1005)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1018, 1013, 1005)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1019, 1014, 1005)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1020, 1, 1005)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1025, 1, 1006)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1042, 1, 1007)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1059, 1, 1008)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1060, 1031, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1061, 1032, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1062, 1032, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1063, 1032, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1064, 1031, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1065, 1036, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1066, 1036, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1067, 1036, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1068, 1031, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1069, 1040, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1070, 1040, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1071, 1040, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1072, 1031, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1073, 1044, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1074, 1044, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1075, 1044, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1076, 1, 1009)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1077, 1031, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1078, 1048, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1079, 1048, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1080, 1048, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1081, 1031, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1082, 1052, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1083, 1052, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1084, 1052, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1085, 1031, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1086, 1056, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1087, 1056, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1088, 1056, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1089, 1031, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1090, 1060, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1091, 1060, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1092, 1060, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1093, 1, 1010)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1094, 1048, 1011)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1095, 1052, 1011)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1096, 1056, 1011)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1097, 1060, 1011)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1098, 1, 1011)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1099, 1048, 1012)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1100, 1052, 1012)
GO
INSERT [dbo].[In] ([Id_in], [ID_account], [ID_class]) VALUES (1101, 1, 1012)
GO
SET IDENTITY_INSERT [dbo].[In] OFF
GO
SET IDENTITY_INSERT [dbo].[Join] ON 
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1, 2, 1, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (2, 3, 1, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (3, 4, 1, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (4, 5, 2, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (5, 6, 1, 0)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (6, 7, 1, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (7, 8, 3, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (8, 6, 5, 0)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1012, 1011, 6, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1013, 1012, 7, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1014, 1013, 8, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1015, 1014, 11, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1052, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1053, 1032, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1054, 1032, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1055, 1032, 1009, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1056, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1057, 1036, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1058, 1036, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1059, 1036, 1010, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1060, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1061, 1040, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1062, 1040, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1063, 1040, 1011, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1064, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1065, 1044, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1066, 1044, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1067, 1044, 1012, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1068, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1069, 1048, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1070, 1048, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1071, 1048, 1013, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1072, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1073, 1052, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1074, 1052, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1075, 1052, 1014, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1076, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1077, 1056, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1078, 1056, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1079, 1056, 1015, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1080, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1081, 1060, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1082, 1060, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1083, 1060, 1016, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1084, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1085, 1048, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1086, 1048, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1087, 1048, 1013, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1088, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1089, 1052, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1090, 1052, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1091, 1052, 1014, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1092, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1093, 1056, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1094, 1056, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1095, 1056, 1015, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1096, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1097, 1060, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1098, 1060, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1099, 1060, 1016, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1100, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1101, 1048, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1102, 1048, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1103, 1048, 1013, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1104, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1105, 1052, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1106, 1052, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1107, 1052, 1014, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1108, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1109, 1056, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1110, 1056, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1111, 1056, 1015, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1112, 1031, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1113, 1060, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1114, 1060, 1004, 1)
GO
INSERT [dbo].[Join] ([Id_join], [ID_account], [Id_Project], [Allow_access]) VALUES (1115, 1060, 1016, 1)
GO
SET IDENTITY_INSERT [dbo].[Join] OFF
GO
SET IDENTITY_INSERT [dbo].[Task_type] ON 
GO
INSERT [dbo].[Task_type] ([taskType_Id], [TaskType_Name]) VALUES (1, N'To Do')
GO
INSERT [dbo].[Task_type] ([taskType_Id], [TaskType_Name]) VALUES (2, N'Doing')
GO
INSERT [dbo].[Task_type] ([taskType_Id], [TaskType_Name]) VALUES (3, N'Done')
GO
INSERT [dbo].[Task_type] ([taskType_Id], [TaskType_Name]) VALUES (4, N'Cancel')
GO
SET IDENTITY_INSERT [dbo].[Task_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON 
GO
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (3, N'test1', N'test1', CAST(N'2022-01-01' AS Date), CAST(N'2023-01-01' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (4, N'Task 1', N'Description of Task 1', CAST(N'2024-02-26' AS Date), CAST(N'2024-03-05' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (5, N'Sample Task', N'This is a sample task description.', CAST(N'2024-02-26' AS Date), CAST(N'2024-03-05' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (6, N'task 3', N'des', CAST(N'2022-02-02' AS Date), CAST(N'2022-02-02' AS Date), 2, 2, 2)
GO
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (7, N'task4', N'des', CAST(N'2022-02-02' AS Date), CAST(N'2022-02-02' AS Date), 3, 4, 2)
GO
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (8, N'sdfsdf', N'sdf', CAST(N'2024-01-31' AS Date), CAST(N'2024-02-04' AS Date), 0, 4, 1)
GO
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (11, N'1255', N'12355', CAST(N'2024-03-05' AS Date), CAST(N'2024-03-22' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (12, N'1255', N'12355', CAST(N'2024-03-04' AS Date), CAST(N'2024-02-28' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (13, N'ws', N'edfsdf', CAST(N'2024-03-04' AS Date), CAST(N'2024-03-06' AS Date), 2, 2, 1)
GO
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (14, N'task 2', N'12355', CAST(N'2024-03-13' AS Date), CAST(N'2024-03-18' AS Date), 0, 1, 1)
GO
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (15, N'test', N'12355', CAST(N'2024-03-11' AS Date), CAST(N'2024-03-13' AS Date), 0, 1, 6)
GO
INSERT [dbo].[Task] ([Id_task], [task_name], [task_description], [Start_date], [End_date], [assign_to], [taskType_Id], [Id_milestone]) VALUES (16, N'abc', N'sdfsdfsdf', CAST(N'2024-03-06' AS Date), CAST(N'2024-03-21' AS Date), 0, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
SET IDENTITY_INSERT [dbo].[grade] ON 
GO
INSERT [dbo].[grade] ([Id_grade], [Grade_Dailyreport], [Grade_Code], [Grade_Document], [Grade_Presentation], [Id_Project]) VALUES (1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[grade] ([Id_grade], [Grade_Dailyreport], [Grade_Code], [Grade_Document], [Grade_Presentation], [Id_Project]) VALUES (2, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[grade] ([Id_grade], [Grade_Dailyreport], [Grade_Code], [Grade_Document], [Grade_Presentation], [Id_Project]) VALUES (3, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[grade] ([Id_grade], [Grade_Dailyreport], [Grade_Code], [Grade_Document], [Grade_Presentation], [Id_Project]) VALUES (4, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[grade] ([Id_grade], [Grade_Dailyreport], [Grade_Code], [Grade_Document], [Grade_Presentation], [Id_Project]) VALUES (5, 3, 2, 4, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[grade] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 
GO
INSERT [dbo].[Comment] ([Id_comment], [Comment_description], [Id_task], [id_Account]) VALUES (4, N'asdavdfsdf', 3, 1)
GO
INSERT [dbo].[Comment] ([Id_comment], [Comment_description], [Id_task], [id_Account]) VALUES (5, N'asdasfsdsgsf', 3, 7)
GO
INSERT [dbo].[Comment] ([Id_comment], [Comment_description], [Id_task], [id_Account]) VALUES (6, N'asdasd', 3, 7)
GO
INSERT [dbo].[Comment] ([Id_comment], [Comment_description], [Id_task], [id_Account]) VALUES (1007, N'adasdasada', 3, 7)
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 
GO
INSERT [dbo].[Notification] ([noti_id], [ID_account], [User_name], [Id_Project], [notification], [date], [Id_task]) VALUES (1, 7, N'Acout6', 1, N'đã thêm task:', CAST(N'2024-03-05' AS Date), 3)
GO
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO