CREATE DATABASE GIU_Job_Portal

GO
USE GIU_Job_Portal

GO
CREATE TABLE Users(
	ID int PRIMARY KEY IDENTITY NOT NULL,
	email varchar(50) NOT NULL UNIQUE,
	username varchar(20)  UNIQUE,
	passcode varchar(8) NOT NULL,
)

GO
CREATE TABLE Student(
	ID int Primary Key NOT NULL,
	first_name varchar(20) NOT NULL,
	middle_name varchar(20) NOT NULL,
	last_name varchar(20) NOT NULL,
	GIU_ID int NOT NULL,
	birth_date date NOT NULL,
	age AS YEAR (CAST (GETDATE() AS date)) - YEAR (birth_date),
	semester int NOT NULL CHECK(semester >= 1 AND semester <= 10), 
	faculty varchar(20) NOT NULL CHECK(faculty = 'Engineering' OR faculty = 'Informatics & CS' OR faculty  = 'Business' OR faculty = 'Design' OR faculty = 'Architecture' OR faculty = 'Bio Technology' OR faculty = 'Pharmaceutical'),
	major varchar(20), 
	GPA decimal(4,2) CHECK(GPA >= 0.7 AND GPA <= 5),
	adress varchar(10) NOT NULL,
	CV varchar(150),
	coverletter varchar(150),
	Foreign Key(ID) references Users ON DELETE CASCADE,

)
GO
CREATE TABLE Student_Phonenumbers(
	ID int  NOT NULL,
	numbers varchar(20) NOT NULL CHECK(numbers NOT LIKE '%[^0-9]%'),
	Primary Key (ID , numbers),
	Foreign Key(ID) references Student ON DELETE CASCADE
)

GO
CREATE TABLE Employer(
	ID int Primary Key NOT NULL,
	company_name varchar(20) NOT NULL,
	adress varchar(10) NOT NULL,
	phone_number varchar(20) NOT NULL,
	fax varchar(50),
	website varchar(50),
	type_of_business varchar(30) NOT NULL CHECK(type_of_business = 'startup' OR type_of_business = 'company' OR type_of_business = 'government entity'),
	establishment_year date NOT NULL CHECK(YEAR(establishment_year) < YEAR(current_timestamp)),
	country_of_origin varchar(20) NOT NULL,
	industry varchar(20) NOT NULL,
	number_of_current_employees int NOT NULL,
	products_or_services varchar(30),
	Foreign Key(ID) references Users ON DELETE CASCADE
)
GO
CREATE TABLE Contact_person(
	employer_ID int Primary Key NOT NULL,
	CPname varchar(20) NOT NULL,
	job_title varchar(30) NOT NULL,
	email varchar(50) NOT NULL,
	mobile_number varchar(20) NOT NULL,
	fax varchar(50),
	Foreign Key(employer_ID) references Employer ON DELETE CASCADE
)
GO
CREATE TABLE HR_Director(
	employer_ID int Primary Key NOT NULL,
	HRname varchar(20) NOT NULL,
	email varchar(50) NOT NULL,
	Foreign Key(employer_ID) references Employer ON DELETE CASCADE
)

GO
CREATE TABLE Admins(
	ID int Primary Key NOT NULL,
	Foreign Key(ID) references Users ON DELETE CASCADE
)

GO
CREATE TABLE Faculty_Representative(
	ID int Primary Key NOT NULL,
	faculty varchar(20) NOT NULL CHECK(faculty = 'Engineering' OR faculty = 'Informatics & CS' OR faculty  = 'Business' OR faculty = 'Design' OR faculty = 'Architecture' OR faculty = 'Bio Technology' OR faculty = 'Pharmaceutical'),
	Foreign Key(ID) references Users ON DELETE CASCADE
)

GO
CREATE TABLE Academic_Advisor(
	ID int Primary Key NOT NULL,
	faculty varchar(20) NOT NULL CHECK(faculty = 'Engineering' OR faculty = 'Informatics & CS' OR faculty  = 'Business' OR faculty = 'Design' OR faculty = 'Architecture' OR faculty = 'Bio Technology' OR faculty = 'Pharmaceutical'),
	Foreign Key(ID) references Users ON DELETE CASCADE
)

GO
CREATE TABLE Career_Office_Coordinator	(
	ID int Primary Key NOT NULL,
	Foreign Key(ID) references Users ON DELETE CASCADE
)

GO
CREATE TABLE Job(
	ID int Primary Key NOT NULL IDENTITY,
	title varchar(30) NOT NULL,
	decription varchar(50) NOT NULL,
	department varchar(20) NOT NULL,
	s_start_date date NOT NULL,
	end_date date NOT NULL,
	duration_in_months AS MONTH(DATEADD(MM,MONTH(s_start_date),end_date)),
	application_deadline date NOT NULL,
	num_of_available_internships int NOT NULL,
	salary_range varchar(20) NOT NULL,
	qualifications varchar(100) NOT NULL,
	l_location varchar(20) NOT NULL,
	application_link varchar(50) NOT NULL,
	application_email varchar(50) NOT NULL,
	job_type varchar(30) NOT NULL CHECK (job_type = 'Part Time' OR job_type = 'Full Time' OR job_type = 'Freelance' OR job_type = 'Summer Internship' OR job_type = 'Project Based' OR job_type = 'Industrial Internship'),
	employer_id int not null,
	admin_id int,
	visibility bit Default 0,
	reason varchar(100),
	Foreign Key(employer_id) references Employer ON DELETE CASCADE,
	Foreign Key(admin_id) references Admins ON DELETE NO ACTION
)
GO
CREATE TABLE Allowed_faculties(
	ID int NOT NULL,
	faculty_name varchar(30) CHECK(faculty_name = 'Engineering' OR faculty_name = 'Informatics & CS' OR faculty_name = 'Business' OR faculty_name = 'Design' OR faculty_name = 'Architecture' OR faculty_name = 'Bio Technology' OR faculty_name = 'Pharmaceutical'),
	Primary Key(ID , faculty_name),
	Foreign Key(ID) references Job ON DELETE CASCADE
)
GO
CREATE TABLE Required_semesters(
	ID int NOT NULL,
	semester int,
	Primary Key(ID , semester),
	Foreign Key(ID) references Job ON DELETE CASCADE
)
GO
CREATE TABLE Part_time(
	ID int Primary Key NOT NULL,
	workdays int NOT NULL,
	Foreign Key(ID) references Job ON DELETE CASCADE
)
GO
CREATE TABLE Freelance(
	ID int Primary Key NOT NULL,
	Foreign Key(ID) references Job ON DELETE CASCADE
)
GO
CREATE TABLE Summer_internship(
	ID int Primary Key NOT NULL,
	Foreign Key(ID) references Job ON DELETE CASCADE
)
CREATE TABLE Full_time(
	ID int Primary Key NOT NULL,
	Foreign Key(ID) references Job ON DELETE CASCADE
)
CREATE TABLE Project_based(
	ID int Primary Key NOT NULL,
	Foreign Key(ID) references Job ON DELETE CASCADE
)
GO
CREATE TABLE Industrial_Internship(
	ID int Primary Key NOT NULL,
	s_status bit NOT NULL,
	aa_id int,
	facultyRep_id int,
	Foreign Key(ID) references Job ON DELETE CASCADE, 
	Foreign Key(aa_id) references Academic_Advisor ON DELETE NO ACTION ON UPDATE NO ACTION,
	Foreign Key(facultyRep_id) references Faculty_Representative ON DELETE NO ACTION ON UPDATE NO ACTION
)
GO
CREATE TABLE CV_Builder(
	student_id int,
	personal_mail varchar(50),
	education varchar(100),
	extracurricular_activities varchar(300),
	linkedIn_link varchar(30),
	githubLink varchar(30),
	skills varchar(300),
	achievements varchar(300),
	first_name varchar(20),
	middle_name varchar(20),
	last_name varchar(20),
	GIU_mail varchar(50),
	GPA decimal(4,2),
	semester int,
	faculty varchar(20),
	major varchar(20),
	Foreign Key(student_id) references Student (ID) ON DELETE CASCADE
)

GO
CREATE TABLE Applies(
	student_ID int NOT NULL,
	job_ID int NOT NULL,
	application_status VARCHAR(20) DEFAULT  'Pending',
	Primary Key(student_ID , job_ID),
	Foreign Key(student_ID) references Student ON DELETE NO ACTION,
	Foreign Key(job_ID) references Job ON DELETE CASCADE
)

GO
CREATE TABLE Eligible(
	student_id int NOT NULL,
	II_id int NOT NULL,
	coc_id int,
	eligibility bit  NOT NULL,
	Primary Key(student_ID , II_id),
	Foreign Key(student_ID) references Student ON DELETE NO ACTION,
	Foreign Key(II_id) references Industrial_Internship ON DELETE CASCADE,
	Foreign Key(coc_id) references Career_Office_Coordinator ON DELETE NO ACTION
)

GO
CREATE TABLE Review_Profile(
	employer_id int Primary Key NOT NULL,
	admin_id int ,
	s_status bit NOT NULL,
	reason varchar(100),
	Foreign Key(employer_id) references Employer ON DELETE CASCADE,
	Foreign Key(admin_id) references Admins ON DELETE NO ACTION
)

GO
CREATE TABLE Progress_Report(
	student_id int,
	d_date date,
	numeric_state int DEFAULT -1,
	evaluation varchar(100) DEFAULT 'Not Evaluated Yet',
	d_description varchar(100),
	advisor_id int,
	Primary Key(student_id , d_date),
	Foreign Key(student_id) references Student(ID) ON DELETE CASCADE,
	Foreign Key(advisor_id) references Admins ON DELETE NO ACTION
)

GO
--drop database giu_job_portal

