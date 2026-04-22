USE [company_database_analysis]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 20-Apr-26 4:09:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[dept_id] [int] NOT NULL,
	[dept_name] [varchar](50) NULL,
	[location] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[employees]    Script Date: 20-Apr-26 4:09:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[emp_id] [int] NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[email_id] [varchar](50) NULL,
	[phone] [varchar](15) NULL,
	[hire_date] [date] NULL,
	[job_id] [int] NULL,
	[dept_id] [int] NULL,
	[salary_id] [int] NULL,
	[manager_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[employees_project]    Script Date: 20-Apr-26 4:09:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees_project](
	[emp_id] [int] NOT NULL,
	[project_id] [int] NOT NULL,
	[role] [varchar](50) NULL,
	[assigned_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC,
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[jobs]    Script Date: 20-Apr-26 4:09:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[job_id] [int] NOT NULL,
	[job_title] [varchar](50) NULL,
	[min_salary] [int] NULL,
	[max_salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[projects]    Script Date: 20-Apr-26 4:09:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projects](
	[project_id] [int] NOT NULL,
	[project_name] [varchar](50) NULL,
	[project_date] [date] NULL,
	[end_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[salaries]    Script Date: 20-Apr-26 4:09:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salaries](
	[salary_id] [int] NOT NULL,
	[emp_id] [int] NULL,
	[salary] [int] NULL,
	[effective_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[salary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([dept_id])
REFERENCES [dbo].[departments] ([dept_id])
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([job_id])
REFERENCES [dbo].[jobs] ([job_id])
GO
ALTER TABLE [dbo].[employees_project]  WITH CHECK ADD FOREIGN KEY([emp_id])
REFERENCES [dbo].[employees] ([emp_id])
GO
ALTER TABLE [dbo].[employees_project]  WITH CHECK ADD FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([project_id])
GO
ALTER TABLE [dbo].[salaries]  WITH CHECK ADD FOREIGN KEY([emp_id])
REFERENCES [dbo].[employees] ([emp_id])
GO