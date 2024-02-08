create database SWP6
create table role(
Id_role  int IDENTITY(1,1) PRIMARY KEY,
Role_Name Varchar(20),

)
create table Account(
 ID_account int IDENTITY(1,1) PRIMARY KEY,
 User_name Nvarchar(30),
 Password varchar(30),
 email Nvarchar(50),
 status bit,
 role_project Varchar(20),
 Id_role  int FOREIGN KEY REFERENCES role( Id_role )
)

create table class(
Id_class  int IDENTITY(1,1) PRIMARY KEY,
Class_name Varchar(20),
)
create table [In](
Id_in  int IDENTITY(1,1),
ID_account int FOREIGN KEY REFERENCES Account( ID_account),
ID_class int FOREIGN KEY REFERENCES class(Id_class),
PRIMARY KEY(Id_in,ID_account,ID_class)
)
create table Project(
Id_Project int IDENTITY(1,1) PRIMARY KEY,
Project_name Nvarchar(max) ,
Project_description Nvarchar(max),
Start_date date,
End_date date
)
Create table [Join](
Id_join int IDENTITY(1,1),
ID_account int FOREIGN KEY REFERENCES Account( ID_account),
Id_Project int FOREIGN KEY REFERENCES Project(Id_Project),
Allow_access bit,
 PRIMARY KEY(Id_join,ID_account,Id_Project)
)
create table grade(
Id_grade  int IDENTITY(1,1) PRIMARY KEY,
Grade_Dailyreport varchar(max),
Grade_Code varchar(max),
Grade_Document varchar(max),
Grade_Presentation varchar(max),
Id_Project int FOREIGN KEY REFERENCES Project(Id_Project),
)
create table milestone(
Id_milestone  int IDENTITY(1,1) PRIMARY KEY,
name_milestone nvarchar(max),
Start_date date,
End_date date,
Id_Project int FOREIGN KEY REFERENCES Project(Id_Project)
)

create table Task_type(
taskType_Id int IDENTITY(1,1) PRIMARY KEY,
TaskType_Name nvarchar(50)
)
create table Task(
Id_task int IDENTITY(1,1) PRIMARY KEY,
task_name nvarchar(50),
task_description nvarchar(max),
Start_date date,
End_date date,
code Nvarchar(max),
taskType_Id int FOREIGN KEY REFERENCES Task_type(taskType_Id),
Id_milestone int FOREIGN KEY REFERENCES milestone(Id_milestone)
)
create table Daily_report(
Id_Report int IDENTITY(1,1) PRIMARY KEY,
Date date,
Work_Done Nvarchar(max),
Planning_Tomorrow Nvarchar(max),
issue Nvarchar(max),
Notes Nvarchar(max),
Id_task int FOREIGN KEY REFERENCES Task(Id_task)
)
create table Comment(
Id_comment int IDENTITY(1,1) PRIMARY KEY,
Comment_description  Nvarchar(max),
Id_task int FOREIGN KEY REFERENCES Task(Id_task)
)
insert into role
values('lecture')
insert into role
values('student')
select * from role
insert into Account(User_name,Password,email,status,role_project,Id_role)
values(N'Minh Hằng','ohvCFjsHBfTFW6oeA30pig==','nguyenthiminhhang141205@gmail.com',1,null,1)
insert into class
values('1757'),
('1750'),
('1749')
insert into [In](ID_account,ID_class)
values (1,1),
(1,2),
(1,3)

insert into Account(User_name,Password,email,status,role_project,Id_role)
values
(N'Account1','ohvCFjsHBfTFW6oeA30pig==','Accout1@gmail.com',1,'TL',2),
(N'Account2','ohvCFjsHBfTFW6oeA30pig==','Accout2@gmail.com',1,'Dev',2),
(N'Account3','ohvCFjsHBfTFW6oeA30pig==','Accout3@gmail.com',1,'Dev',2),
(N'Account4','ohvCFjsHBfTFW6oeA30pig==','Accout4@gmail.com',1,'Dev',2),
(N'Account5','ohvCFjsHBfTFW6oeA30pig==','Accout5@gmail.com',1,'Dev',2),
(N'Account6','ohvCFjsHBfTFW6oeA30pig==','Accout6@gmail.com',1,'Dev',2),
(N'Account7','ohvCFjsHBfTFW6oeA30pig==','Accout7@gmail.com',1,'Dev',2),
(N'Account8','ohvCFjsHBfTFW6oeA30pig==','Accout8@gmail.com',1,'Dev',2),
(N'Vuong Trung','ohvCFjsHBfTFW6oeA30pig==','tieupumpum832@gmail.com',0,'Dev',2)


insert into [In](ID_account,ID_class)
values 
(2,2),
(3,2),
(4,2),
(2,3),
(5,3),
(6,3),
(7,2)


INSERT INTO Project (Project_name, Project_description, Start_date, End_date)
VALUES
    ('Project A', 'Description for Project A', '2023-01-01', '2024-01-01'),
    ('Project B', 'Description for Project B', '2023-01-01', '2024-01-01'),
    ('Project C', 'Description for Project C', '2023-01-01', '2024-01-01');


-- Insert sample data into the Join table
INSERT INTO [Join] (ID_account, Id_Project, Allow_access)
VALUES
    (2, 1, 1),  
    (3, 1, 1),  
    (4, 1, 1),
	(5, 2, 1),
	(6, 2, 1),
	(7, 3, 1),
	(8, 3, 1)
