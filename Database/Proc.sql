USE GIU_Job_Portal

GO
CREATE PROC ShowEmployers
	AS
	SELECT Employer.*
	FROM Employer
	INNER JOIN Review_Profile ON Employer.ID = Review_Profile.employer_id
	WHERE s_status = 1
	ORDER BY company_name

GO
CREATE PROC ShowJobs
	AS
	SELECT ID AS 'Job ID', title AS 'Job Title' , decription , department , s_start_date , end_date , duration_in_months , application_deadline , num_of_available_internships , salary_range,
	qualifications , l_location , job_type
	FROM Job
	WHERE visibility = 1

GO
CREATE PROC JobsSearch
	@semester int, @allowed_faculty varchar(20)
	
	AS

	DECLARE @counter int

	SELECT @counter = count(*)
	FROM Job
	INNER JOIN Required_semesters ON Job.ID = Required_semesters.ID
	INNER JOIN Allowed_faculties ON Job.ID = Allowed_faculties.ID
	WHERE (@semester = Required_semesters.semester OR @allowed_faculty = Allowed_faculties.faculty_name) AND visibility = 1;

	IF @counter = 0
		BEGIN
			SELECT ID , title , decription , department , s_start_date , end_date , duration_in_months,
			application_deadline , num_of_available_internships , salary_range,
			qualifications , l_location , job_type
			
			FROM Job
			WHERE visibility = 1
		END
	ELSE
		BEGIN
			SELECT Job.ID , title , decription , department , s_start_date , end_date , duration_in_months,
			application_deadline , num_of_available_internships , salary_range,
			qualifications , l_location , job_type , semester

			FROM Job
			INNER JOIN Required_semesters ON Job.ID = Required_semesters.ID
			INNER JOIN Allowed_faculties ON Job.ID = Allowed_faculties.ID
			WHERE (@semester = Required_semesters.semester OR @allowed_faculty = Allowed_faculties.faculty_name) AND visibility = 1;
		END
	print @counter

GO
CREATE PROC UserRegister

	@usertype varchar(50), @email varchar(50), @username varchar(50), @first_name varchar(20), @middle_name varchar(20),
	@last_name varchar(20), @birth_date datetime, @GIU_id int, @semester int, @faculty varchar(20), @major varchar(20),
	@gpa decimal(4,2), @adress varchar(10), @company_name varchar(20), @company_phone varchar(20),
	@fax varchar(50), @company_website varchar(50), @type_of_business varchar(30), @establishment_year datetime,
	@origin_country varchar(20), @industry varchar(20), @n_current_employees int, @products_services varchar(30),
	@userid int OUTPUT,
	@passcode varchar(8)  OUTPUT

	AS

	DECLARE @curr int
	SET @passcode = SUBSTRING(CAST( NEWID() as char(36)),0,9) 
	INSERT INTO Users VALUES(@email, @username, @passcode)
	SET @curr= CAST(@@IDENTITY as INT)
	IF @usertype = 'student'
		BEGIN
			INSERT INTO Student(ID,first_name,middle_name,last_name,GIU_ID,birth_date,semester,faculty,major,GPA,adress)
			VALUES(@curr,@first_name,@middle_name,@last_name,@GIU_id,@birth_date,@semester,@faculty,@major,@gpa,@adress)	
		END
	ELSE IF @usertype = 'Employer'
		BEGIN
			INSERT INTO Employer(ID,company_name,adress,phone_number,fax,website,type_of_business,establishment_year,country_of_origin,industry,number_of_current_employees,products_or_services)
			VALUES (@curr,@company_name, @adress, @company_phone,@fax,@company_website,@type_of_business,@establishment_year,@origin_country,@industry,@n_current_employees,@products_services)
		END
	ELSE IF @usertype = 'Admin'
		BEGIN
			INSERT INTO Admins VALUES (@curr)
		END
	ELSE IF @usertype LIKE 'Career Office Coordinator'
		BEGIN
			INSERT INTO Career_Office_Coordinator VALUES (@curr)
		END
	ELSE IF @usertype LIKE 'Academic Advisor'
		BEGIN
			INSERT INTO Academic_Advisor VALUES (@curr , @faculty)
		END
	ELSE IF @usertype LIKE 'Faculty Representative'
		BEGIN
			INSERT INTO Faculty_Representative VALUES (@curr , @faculty)
		END
	SET @userid = @curr

GO
CREATE PROC UserLogin
	@email varchar(50) , @password varchar(20) , @success bit Output , @user_id int Output
	
	AS

	set @success = 0

	SELECT @user_id = ID
	FROM Users
	WHERE email = @email AND passcode = @password

	IF @user_id IS NOT NULL
		set @success = 1
	ELSE
		PRINT 'You have entered invalid data'



GO
CREATE PROC ViewProfile
	@user_id int

	AS

	IF EXISTS( 
		SELECT *
		FROM Employer 
		WHERE  Employer.ID=@user_id
		)
		SELECT *
		FROM Users
		INNER JOIN Employer ON Employer.ID = Users.ID
		WHERE  Employer.ID=@user_id
	IF EXISTS( 
		SELECT *
		FROM Student
		WHERE  Student.ID=@user_id
		)
		SELECT *
		FROM Users
		INNER JOIN Student ON Student.ID = Users.ID
		WHERE  Student.ID=@user_id
	IF EXISTS( 
		SELECT *
		FROM Admins 
		WHERE  Admins.ID=@user_id
		)
		SELECT *  
		FROM Users
		INNER JOIN Admins ON Admins.ID = Users.ID
		WHERE  Admins.ID=@user_id
	IF EXISTS( 
		SELECT *
		FROM Academic_Advisor 
		WHERE  Academic_Advisor.ID=@user_id
		)
		SELECT *
		FROM Users
		INNER JOIN Academic_Advisor ON Academic_Advisor.ID = Users.ID
		WHERE  Academic_Advisor.ID=@user_id
	IF EXISTS( 
		SELECT *
		FROM Career_Office_Coordinator 
		WHERE  Career_Office_Coordinator.ID=@user_id
		)
		SELECT *
		FROM Users
		INNER JOIN Career_Office_Coordinator ON Career_Office_Coordinator.ID = Users.ID
		WHERE  Career_Office_Coordinator.ID=@user_id
	IF EXISTS( 
		SELECT *
		FROM Faculty_Representative 
		WHERE  Faculty_Representative.ID=@user_id
		)
		SELECT *
		FROM Users
		INNER JOIN Faculty_Representative ON Faculty_Representative.ID = Users.ID
		WHERE  Faculty_Representative.ID=@user_id

GO
CREATE PROC DeleteProfile
	@user_id int
	
	AS
												
	DELETE FROM Progress_Report	
	Where @user_id = Progress_Report.student_id

	DELETE FROM Review_Profile
	Where @user_id = employer_id OR @user_id = admin_id

	DELETE FROM Eligible
	Where @user_id = student_id

	UPDATE Eligible
	SET coc_id = NULL
	WHERE @user_id = coc_id

	DELETE FROM Applies
	Where @user_id = student_ID

	DELETE FROM CV_Builder
	Where @user_id = student_id

	UPDATE Industrial_Internship
	SET aa_id = NULL
	Where @user_id = aa_id
	
	UPDATE Industrial_Internship
	SET facultyRep_id = NULL
	Where @user_id = facultyRep_id

	UPDATE Job
	SET admin_id = NULL
	Where @user_id = admin_id

	DELETE FROM Users
	WHERE @user_id = ID



GO
CREATE PROC AdminViewEmps
	AS
	SELECT * 
	FROM Employer
	ORDER BY company_name 

GO
CREATE PROC AdminReviewEmp
	@admin_id int,@emp_id int ,@profile_status bit ,@reason varchar(100)
	AS
	IF @profile_status = 0
		INSERT INTO Review_Profile (employer_id,admin_id,s_status,reason)VALUES (@emp_id,@admin_id,@profile_status,@reason)
	ELSE
		INSERT INTO Review_Profile (employer_id,admin_id,s_status)VALUES (@emp_id,@admin_id,@profile_status)

GO 
CREATE PROC AdminViewJobs
	AS 
	SELECT *
	FROM Job

GO 
CREATE PROC AdminViewFRs
	AS
	SELECT *
	FROM Faculty_Representative

GO
CREATE PROC AddFacultyRepToII
	
	@job_id int, @admin_id int, @facultyRep_id int

	AS
	
	IF EXISTS(
		SELECT *
		FROM Industrial_Internship
		WHERE ID = @job_id
	)
		UPDATE Industrial_Internship
		SET facultyRep_id = @facultyRep_id
		WHERE @job_id = ID

GO
CREATE PROC AdminReviewJob
	@admin_id int, @job_id int, @visibility bit, @reason varchar(100)

	
	AS
	DECLARE @liked BIT
	IF EXISTS(
		SELECT ID 
		FROM Industrial_Internship
		WHERE @job_id = ID AND Industrial_Internship.s_status=1
	) 
	BEGIN
	
		IF @visibility = 1
			UPDATE Job
			Set Job.visibility = 1
			WHERE @job_id = Job.ID AND @admin_id = Job.admin_id
		ELSE
			UPDATE Job
			Set Job.visibility = 0 , Job.reason = @reason
			WHERE @job_id = Job.ID AND @admin_id = Job.admin_id
	END
	ELSE IF NOT EXISTS(
		SELECT ID 
		FROM Industrial_Internship
		WHERE @job_id = ID
	) 
		IF @visibility = 1
			UPDATE Job
			Set Job.visibility = 1
			WHERE @job_id = Job.ID AND @admin_id = Job.admin_id
		ELSE
			UPDATE Job
			Set Job.visibility = 0 , Job.reason = @reason
			WHERE @job_id = Job.ID AND @admin_id = Job.admin_id

GO
CREATE PROC EmpEditProfile
	@id int, @password varchar(8), @adress varchar(10), @company_name varchar(20), @company_phone varchar(20),
	@fax varchar(50), @company_website varchar(50), @type_of_business varchar(30),
	@establishment_year datetime, @origin_country varchar(20), @industry varchar(20),
	@n_current_employees int, @products_services varchar(30)
		
	AS

	UPDATE Employer
	SET adress = @adress, company_name = @company_name, phone_number = @company_phone,
	fax = @fax, website = @company_website, type_of_business =  @type_of_business,
	establishment_year = @establishment_year , country_of_origin = @origin_country, industry = @industry,
	number_of_current_employees = @n_current_employees , products_or_services = @products_services
	WHERE Employer.ID = @id

	UPDATE Users 
	SET passcode = @password
	WHERE Users.ID = @id

GO
CREATE PROC AddContact
	@emp_id int, @name varchar(20), @job_title varchar(30), @email varchar(50), @mobile_number varchar(20), @fax varchar(50)

	AS

	INSERT INTO Contact_person(employer_ID , CPname , job_title , email , mobile_number , fax) VALUES (@emp_id , @name , @job_title , @email , @mobile_number , @fax)

GO
CREATE PROC AddHR
	@emp_id int, @name varchar(20), @email varchar(50)

	AS

	INSERT INTO HR_Director(employer_ID,HRname,email) VALUES (@emp_id , @name , @email)

GO
CREATE PROC ViewProfileStatus
	@emp_id int , @status bit OUTPUT, @reason varchar(100) OUTPUT
	
	AS

	SET @status = (SELECT Review_Profile.s_status
		FROM Review_Profile
		WHERE employer_id = @emp_id)

	SET @reason = (SELECT Review_Profile.reason
		FROM Review_Profile
		WHERE employer_id = @emp_id)

GO
CREATE PROC PostJob

	@emp_id int, @title varchar(30), @description varchar(50), @department varchar(20), @start_date datetime,
	@end_date datetime, @application_deadline datetime, @n_available_internships int,
	@salary_range varchar(20), @qualifications varchar(100), @location varchar(20), @application_link varchar(50),
	@application_email varchar(50), @job_type varchar(30), @workdays int , @job_id int Output

	AS

	IF EXISTS(
		SELECT *
		FROM Review_Profile
		WHERE employer_id = @emp_id AND s_status = 1
	)

	INSERT INTO Job(title,decription,department,s_start_date,end_date,application_deadline,num_of_available_internships,salary_range,qualifications,
	l_location,application_link,application_email,job_type,employer_id)
	VALUES(@title, @description , @department , @start_date , @end_date, @application_deadline, @n_available_internships,
	@salary_range, @qualifications, @location, @application_link,@application_email, @job_type, @emp_id)

	SET @job_id = CAST(@@IDENTITY AS INT)

	IF @job_type = 'Part Time'
		BEGIN
			INSERT INTO Part_time(ID , workdays) VALUES (@job_id , @workdays)
		END

	IF @job_type = 'Industrial Internship'
		BEGIN
			INSERT INTO Industrial_Internship(ID,s_status) VALUES (@job_id,0)
		END

	IF @job_type = 'Freelance'
		BEGIN
			INSERT INTO Freelance(ID) VALUES (@job_id)
		END

	IF @job_type = 'Summer Internship'
		BEGIN
			INSERT INTO Summer_internship(ID) VALUES (@job_id)
		END

	IF @job_type = 'Full Time'
		BEGIN
			INSERT INTO Full_time(ID) VALUES (@job_id)
		END
	IF @job_type = 'Project Based'
		BEGIN
			INSERT INTO Project_based(ID) VALUES (@job_id)
		END

GO
CREATE PROC AddFaculty
	@job_id int,@allowed_faculty varchar(20)

	AS

	INSERT INTO Allowed_faculties(ID , faculty_name) VALUES (@job_id , @allowed_faculty)

GO
CREATE PROC AddSemester
	@job_id int,@semester int

	AS

	INSERT INTO Required_semesters(ID , semester) VALUES (@job_id , @semester)

GO
CREATE PROC EmpViewJobs
	@emp_id int

	AS

	SELECT *
	FROM Job
	WHERE employer_id = @emp_id --AND visibility = 1
	ORDER BY s_start_date

GO
CREATE PROC EmpViewApplicants
	@emp_id int, @job_id int
	AS
	SELECT Student.* , Applies.application_status
	FROM Student
	INNER JOIN Applies ON Student.ID=Applies.student_ID
	INNER JOIN Job ON Job.ID = Applies.job_ID
	WHERE @emp_id = Job.employer_id AND @job_id = Applies.job_ID

GO
CREATE PROC EmpUpdateApplicant
	@student_id int, @job_id int, @application_status varchar(20)

	AS

	IF EXISTS(
		SELECT *
		FROM Job
		WHERE job_type = 'Industrial Internship' AND ID = @job_id
	)
	BEGIN
		IF EXISTS(
			SELECT *
			FROM Eligible
			WHERE student_id = @student_id AND II_id = @job_id AND eligibility = 1
		)
		Update Applies
		SET application_status = @application_status
		WHERE student_ID = @student_id AND Applies.job_ID = @job_id

		ELSE IF EXISTS(
			SELECT *
			FROM Eligible
			WHERE student_id = @student_id AND II_id = @job_id AND eligibility = 0
		)
		Update Applies
		SET application_status = 'rejected'
		WHERE student_ID = @student_id AND Applies.job_ID = @job_id
	END

	ELSE
		BEGIN
			UPDATE Applies
			SET application_status = @application_status
			WHERE Applies.student_ID = @student_id AND Applies.job_ID = @job_id
		END

GO
CREATE PROC courseInformation
	@facRep_id int, @job_id int,  @ii_status BIT OUTPUT

	AS
	
	DECLARE @F varchar(20)
	SET @F =  
		(SELECT faculty 
		FROM Faculty_Representative
		WHERE @facRep_id = Faculty_Representative.ID
		)
	IF EXISTS (    
			SELECT * 
			FROM Allowed_faculties
			INNER JOIN Industrial_Internship ON Allowed_faculties.ID = Industrial_Internship.ID
			WHERE @job_id = Industrial_Internship.ID AND @job_id = Allowed_faculties.ID AND @F =Allowed_faculties.faculty_name
	)
		SET @ii_status =1
	ELSE
		SET @ii_status = 0 

GO 
CREATE PROC StudentEditProfile
	@sid int, @email varchar(50),@first_name varchar(20),@middle_name varchar(20), @last_name
	varchar(20), @birth_date datetime,@GIU_id int,@semester int, @faculty varchar(20),@major varchar(
	20),@gpa decimal(4,2),@adress varchar(10)
       
	AS
	
	UPDATE Student
	SET Student.first_name=@first_name,Student.middle_name=@middle_name,Student.last_name=@last_name,Student.birth_date=@birth_date,Student.GIU_ID=@GIU_id,Student.semester=@semester,
	Student.faculty=@faculty,Student.major=@major,Student.GPA=@gpa,Student.adress=@adress
	WHERE @sid = Student.ID

	Update Users
	SET Users.email=@email
	WHERE @sid = Users.ID

	Update CV_Builder
	SET CV_builder.first_name = @first_name , CV_builder.middle_name = @middle_name , CV_builder.last_name = @last_name,
	CV_builder.semester = @semester , CV_builder.faculty = @faculty , CV_builder.major = @major , CV_builder.GPA = @gpa
	WHERE @sid = CV_builder.student_id

GO
CREATE PROC AddMobile
	@sid int,@mobileNumber varchar(20)
	AS
	INSERT INTO Student_Phonenumbers VALUES (@sid,@mobileNumber)

GO 
CREATE PROC CreateCV 
	@s_id int, @personal_mail varchar(50), @education varchar(100), @extracurricular_activities varchar(300),
	@linkedIn_link varchar(30), @github_link varchar(30), @skills varchar(300), @achievements varchar(300)

	AS

	DECLARE @first_name varchar(20)
	DECLARE @middle_name varchar(20)
	DECLARE @last_name varchar(20)
	DECLARE @GIU_mail varchar(50)
	DECLARE @GPA decimal(4,2)
	DECLARE @semester int
	DECLARE @faculty varchar(20)
	DECLARE @major varchar(20)

		

	IF EXISTS(
		SELECT *
		FROM Student 
		WHERE @s_id=Student.ID
	)
		BEGIN 
			SET @first_name = (
				SELECT first_name 
				FROM Student 
				WHERE ID = @s_id
			)
			SET @middle_name = (
				SELECT middle_name 
				FROM Student 
				WHERE ID = @s_id
			)
			SET @last_name = (
				SELECT last_name 
				FROM Student 
				WHERE ID = @s_id
			)
			SET @GIU_mail = (
				SELECT email
				FROM Users 
				WHERE ID = @s_id
			)
			SET @GPA = (
				SELECT GPA 
				FROM Student 
				WHERE ID = @s_id
			)
			SET @semester = (
				SELECT semester
				FROM Student 
				WHERE ID = @s_id
			)
			SET @faculty = (
				SELECT faculty
				FROM Student 
				WHERE ID = @s_id
			)
			SET @major = (
				SELECT major
				FROM Student 
				WHERE ID = @s_id
			)
			IF EXISTS (
				SELECT *
				FROM CV_Builder 
				WHERE @s_id=CV_Builder.student_id
			)
				BEGIN
					UPDATE CV_Builder
						SET CV_builder.achievements = @achievements , CV_builder.skills = @skills , CV_builder.personal_mail = @personal_mail,
							CV_builder.first_name = @first_name , CV_builder.middle_name = @middle_name, CV_builder.last_name = @last_name,
							CV_builder.faculty = @faculty , CV_builder.major = @major, CV_builder.semester = @semester , CV_builder.GPA = @GPA,
							CV_builder.linkedIn_link = @linkedIn_link, CV_builder.githubLink = @github_link , CV_builder.GIU_mail = @GIU_mail,
							CV_builder.education = @education , CV_builder.extracurricular_activities = @extracurricular_activities
						WHERE student_id = @s_id
				END
			ELSE
				BEGIN
					INSERT INTO CV_Builder (personal_mail , education , extracurricular_activities , linkedIn_link , githubLink , skills , achievements,
						student_id , first_name , middle_name , last_name , GIU_mail , GPA , semester , faculty , major)
					VALUES (@personal_mail , @education , @extracurricular_activities , @linkedIn_link , @github_link , @skills , @achievements ,
						@s_id , @first_name , @middle_name , @last_name , @GIU_mail , @GPA , @semester , @faculty , @major)
				END
		END

	ElSE
		PRINT 'Your ID could not be found'

GO
CREATE PROC ApplyForJob
	@sid int, @job_id int , @success bit OUTPUT

	AS		
	
	DECLARE @stfaculty varchar(20);
	DECLARE @jobf varchar(20);
	SET @stfaculty = (SELECT faculty 
	FROM Student
	WHERE Student.ID=@sid
	)
	
	if EXISTS(
		SELECT *
		FROM Allowed_faculties
		INNER JOIN Job ON Job.ID = Allowed_faculties.ID
		WHERE @job_id= Allowed_faculties.id AND @stfaculty LIKE Allowed_faculties.faculty_name AND visibility = 1
	)
	BEGIN
		INSERT INTO Applies (student_ID,job_ID) VALUES( @sid,@job_id) SET @success = 1
	END

	ELSE
		SET @success = 0;

GO 
CREATE PROC ViewMyStatus
	@sid int, @job_id int,@application_status varchar(20) OUTPUT
	AS
	SET @application_status =(
		SELECT application_status
		FROM Applies
		WHERE @sid = student_ID AND @job_id = job_ID
	)

GO 
CREATE PROC AddProgressReport
	@sid int, @date datetime, @description varchar (100) , @success bit OUTPUT
	
	AS

	Insert Into Progress_Report(student_id , d_date , d_description) VALUES (@sid , @date , @description) SET @success = 1

GO
CREATE PROC ViewMyReports

	@sid int , @nOfReports int OUTPUT
	
	AS

	IF EXISTS(
		SELECT *
		FROM Progress_Report
		WHERE student_id = @sid
	)
		BEGIN
			SET @nOfReports = (SELECT COUNT(*)
				FROM Progress_Report
				WHERE student_id = @sid
			)
		END
	ELSE
		BEGIN
			SET @nOfReports = 0;
		END

	SELECT student_id , d_date , numeric_state , evaluation , d_description
	FROM Progress_Report
	WHERE student_id = @sid

GO
CREATE PROC ViewAdvisors
	
	AS

	SELECT Academic_Advisor.ID , username, faculty
	FROM Academic_Advisor
	INNER JOIN Users ON Users.ID = Academic_Advisor.ID
	WHERE Users.ID = Academic_Advisor.ID

GO
CREATE PROC CocViewStudents

	@ii_id int

	AS

	IF EXISTS(
		SELECT *
		FROM Industrial_Internship
		WHERE ID = @ii_id
	)
		BEGIN
			SELECT Student.ID , Student.first_name , Student.middle_name , Student.last_name , Student.GIU_ID
			FROM Applies
			INNER JOIN Student ON Applies.student_ID = Student.ID
			INNER JOIN Industrial_Internship ON job_ID = Industrial_Internship.ID
			WHERE job_ID = @ii_id
		END
	ELSE
		PRINT 'This is not a valid Industrial Internship ID'

GO
CREATE PROC CocUpdateEligibility
	
	@coc_id int, @s_id int, @ii_id int, @eligibility bit

	AS

	UPDATE Eligible
	SET eligibility=@eligibility
	WHERE @coc_id=coc_id AND @s_id=student_id AND @ii_id=II_id

GO
CREATE PROC AAToII
	
	@aa_id int, @ii_id int
	
	AS
	IF EXISTS(
		SELECT *
		FROM Industrial_Internship
		WHERE @ii_id=ID
	)
		IF EXISTS (
			SELECT *
			FROM Academic_Advisor
			WHERE @aa_id=ID
		)
			UPDATE Industrial_Internship
			SET aa_id = @aa_id
			WHERE ID = @ii_id AND s_status = 1
		ELSE
			PRINT 'You have Entered An invalid Academic Advisor'
	ELSE 
		PRINT 'This is an invaild intership id '

GO
CREATE PROC EvalProgressReport
	 
	 @sid int, @date datetime, @numeric_state int, @evaluation varchar(100)
	 
	 AS

	 UPDATE Progress_Report
	 SET numeric_state=@numeric_state , evaluation=@evaluation
	 WHERE @sid = student_id AND @date = d_date

GO 
CREATE PROC ViewProgressReports
	
	@advisor_id int
	
	AS 

	SELECT *
	FROM Progress_Report
	WHERE advisor_id=@advisor_id
	ORDER BY d_date DESC
		
GO
CREATE PROC UserType
	@id INT,
	@user_type VARCHAR(50) OUTPUT
	
	AS
	
	IF EXISTS(SELECT * FROM Student WHERE ID=@id)
		SET @user_type = 'Student'
	IF EXISTS(SELECT * FROM Employer WHERE ID=@id)
		SET @user_type = 'Employer'
	IF EXISTS(SELECT * FROM Academic_Advisor WHERE ID=@id)
		SET @user_type = 'Academic Advisor'
	IF EXISTS(SELECT * FROM Career_Office_Coordinator WHERE ID=@id)
		SET @user_type = 'Career Office Coordinator'
	IF EXISTS(SELECT * FROM Admins WHERE ID=@id)
		SET @user_type = 'Admin'
	IF EXISTS(SELECT * FROM Faculty_Representative WHERE ID=@id)
		SET @user_type = 'Faculty Representative'

GO
CREATE PROC GetJobID
	@sid int , @job_id int , @job_id_out bit OUTPUT

	AS

	IF EXISTS(
		SELECT ID
		FROM Job
		INNER JOIN Applies ON Job.ID = Applies.job_ID
		WHERE ID = @job_id AND @sid = Applies.student_ID
	)
		SET @job_id_out = 1

	ELSE
		SET @job_id_out = 0
		
GO
CREATE PROC ShowJobsAll
	AS
	SELECT ID AS 'Job ID', title AS 'Job Title' , decription , department , s_start_date , end_date , duration_in_months , application_deadline , num_of_available_internships , salary_range,
	qualifications , l_location , job_type , application_email , application_link
	FROM Job
	WHERE visibility = 1

GO
create proc showfacrep
	as

	select u.username from Users u inner join Faculty_Representative f on u.ID = f.ID

GO
create proc FRacrejII
	@Industrial_internshipID int,
	@facrepID int,
	@status bit
	AS

	UPDATE Industrial_Internship
	SET  s_status = @status 
	WHERE @Industrial_internshipID = ID AND @facrepID = facultyRep_id
go
create proc Adminshowfacrep
as

select u.username , f.faculty from Users u inner join Faculty_Representative f on u.ID = f.ID

go


create proc showtable
as


select * from Industrial_Internship i inner join Job j on i.ID =j.ID
GO
--DECLARE @userid int
--DECLARE @passcode varchar(8)
--DECLARE @user_id int
--Declare @success bit
--DECLARE @job_id int
--Declare @status bit
--Declare @reason varchar(100)
--DECLARE @ii_status BIT
--DECLARE @app varchar(20)
--DECLARE @nofrep int



--Exec ShowEmployers

--Exec ShowJobs

--Exec JobsSearch 5 , 'Informatics and CS'

--Exec UserRegister 'Employer', 'hbkgjzerfvdv','fndrjekilgerr',null,null,null,null,null,null,null,null,null,'frijnjd','fhduiasz','fyiewu','diosdos','rgenvhdwxvn','Company','11/11/2020','uhdsjia','udehuwis',10,'diuasncd',@userid OUTPUT, @passcode OUTPUT
--PRINT @userid 
--PRINT @passcode

--EXEC UserLogin 'Omar@hotmail.com' , 'tgrs' , @success Output , @user_id Output
--PRINT @success
--PRINT @user_id

--EXEC ViewProfile 2

--EXEC DeleteProfile 37

--EXEC AdminViewEmps

--EXEC AdminReviewEmp 13,39,1,'He is amazing'

--EXEC AdminViewJobs

--EXEC AdminViewFRs

--EXEC AddFacultyRepToII 5 , null , 14

--EXEC AdminReviewJob 12 , 9 , 0 , 'hwa 7omar'

--EXEC EmpEditProfile 9 , 'fnojopa' , 'fiosdx' , 'fjodrjdoa' , 'hnidceko' , 'fjdcoa' , 'edoijmkl' , 'company' , '10/10/2020' , 'rfbhudjkes' , 'fdeojsla' , 2000 , 'feujiodvz'

--EXEC AddContact 39 , 'cdijoes' , 'dicjkws' , 'jdeikw' , 'dchnjks' , 'dejsniwks'

--EXEC AddHR 39 , 'cdijoes' , 'dicjkws'

--EXEC ViewProfileStatus 8 , @status Output , @reason Output
--print @status
--print @reason

--EXEC PostJob 9,'us','dsc','sdcc','12/7/2021','3/7/2021','2/22/2021', 2,'qwefd','weewefd','ed','edqewd','qewc','Project Based',5,@job_id OUTPUT
--print @job_id

--EXEC AddFaculty 31 , 'Informatics and CS'

--EXEC AddSemester 31 , 6

--EXEC EmpViewJobs 9

--EXEC EmpViewApplicants 8 , 9

--EXEC EmpUpdateApplicant 7 , 9 , 'accepted'

--EXEC courseInformation 14,1,@ii_status OUTPUT
--PRINT @ii_status

--EXEC StudentEditProfile 7,'gitefddl','yahia','sameh','abbas','1/1/2003',2000876,3,'Informatics and CS','data',3.1,'maadi'

--EXEC AddMobile 1,'1000' 

--exec CreateCV 4 , 'bhjugredfk' , 'd nks' , 'dfnjiajl' , 'frhedjka' , 'e4u3qiweask' , 'frbhueikqla' , 'fbdhugaskhjbfriedo'

--EXEC ApplyForJob 1,2

--EXEC ViewMyStatus 2,11,@app OUTPUT
--PRINT @app

--EXEC AddProgressReport 6 , '5/27/2022' , 'rdyhueiaygfdera'

--EXEC ViewMyReports 4 , @nofrep OUTPUT
--PRINT @nofrep

--EXEC ViewAdvisors

--EXEC CocViewStudents 9

--EXEC CocUpdateEligibility 20,7,9,1

--EXEC AAToII 17 , 9

--EXEC EvalProgressReport 6,'5/27/2022', 5,'Outsanding Effort'

--EXEC ViewProgressReports 12
