--     INSERTIONS OF TABLES    --
-- 4 informatic 2 engineering 1 business 

use GIU_Job_Portal
GO
---------------------------------------
--- Users ---
--STUDENTS :-
INSERT INTO Users VALUES('Khaled@hotmail.com','Khaled Mohamed','09869');
INSERT INTO Users VALUES('Omar@hotmail.com','Omar Abdullah','97675');
INSERT INTO Users VALUES('Nadine@hotmail.com','Nadine Slim','NoNacw');
INSERT INTO Users VALUES('Youssef@gmail.com','Youssef Mohamed','Youss');
INSERT INTO Users VALUES('Mariam@yahoo.com','Mariam Ahmed','maria');
INSERT INTO Users VALUES('Ashraf@hotmail.com','Ashraf Emad','SHEKO');
INSERT INTO Users VALUES('Yehia@gmail.com','Yehia Soliman','YaYaYoY');
----EMLOYER :-
INSERT INTO Users VALUES('Microsoft@microsoft.com','Microsoft','micr002');
INSERT INTO Users VALUES('Apple@apple.com','Apple','APPLEap');
INSERT INTO Users VALUES('Opel@opel.com','Opel','opelOP');
INSERT INTO Users VALUES('CIB@cib.com','Cib','CIBci');
----ADMIN :-
INSERT INTO Users VALUES('Mohamed@hotmail.com','Mohamed Ehab','POIP');
INSERT INTO Users VALUES('Salma@hotmail.com','Salma Ahmed','SALMAs');
--FACULTY REPRESENTATIVE :-
INSERT INTO Users VALUES('Mai@hotmail.com','Mai Sobhy','memo');
INSERT INTO Users VALUES('Shawky@gmail.com','Shawky Ghareb','shoshom');
INSERT INTO Users VALUES('Karam@yahoo.com','Karam Osama','29839');
--ACADEMIC ADVISOR :-
INSERT INTO Users VALUES('Shaimaa@gmail.com','Shaimaa Abdullah','23rewdw');
INSERT INTO Users VALUES('John@hotmail.com','John Morad','jojomel');
INSERT INTO Users VALUES('Tamer@hotmail.com','Tamer Hosny','23e2d');
--CAREER OFFICE COORDINATOR :-
INSERT INTO Users VALUES('Hamada@yahoo.com','Hamda Mohamed','MOMOm');





-----------------------------------------
-- Student --
INSERT INTO Student VALUES(1,'Khaled','Mohamed','Tawfik',1001000,'1/1/2001',6,'Informatics & CS','Data Science',3.5,'madentity','CV_1','CL_1');
INSERT INTO Student VALUES(2,'Omar','Abdullah','Mohamed',1001001,'1/1/2001',6,'Informatics & CS','SE',0.7,'MasrGdeda','CV_2','CL_2');
INSERT INTO Student VALUES(3,'Nadine','Slim','El-mougy',1001002,'5/4/2001',2,'Bio Technology','Data Science',1,'Maadi','CV_3','CL_3');
INSERT INTO Student VALUES(4,'Youssef','Mohamed','Tawfik',1001003,'1/1/2001',6,'Pharmaceutical','Security',2.1,'madentity','CV_4','CL_4');
INSERT INTO Student VALUES(5,'Mariam','Ahmed','Moustafa',1001004,'6/23/2002',5,'Engineering','Automotive',4.2,'6OfOctober','CV_5','CL_5');
INSERT INTO Student VALUES(6,'Ashraf','Emad','Sobhy',1001005,'8/18/2001',3,'Engineering','Robotics',3.4,'Nasr City','CV_6','CL_6');
INSERT INTO Student VALUES(7,'Yehia','Soliman','Omar',1001006,'4/10/2001',5,'Business','Finance',2.27,'ShroukCity','CV_7','CL_7');
---------------------------------------
-- Student_Phonenumbers --
INSERT INTO Student_Phonenumbers VALUES(1,01101098327);
INSERT INTO Student_Phonenumbers VALUES(2,01131058827);
INSERT INTO Student_Phonenumbers VALUES(3,01001326327);
INSERT INTO Student_Phonenumbers VALUES(4,01195411327);
INSERT INTO Student_Phonenumbers VALUES(5,01564816327);
INSERT INTO Student_Phonenumbers VALUES(6,01254916327);
INSERT INTO Student_Phonenumbers VALUES(7,01501348327);
---------------------------------------
-- Employer --
INSERT INTO Employer VALUES(8,'Microsoft','FifthSett',19678,'1234567890','www.Microsoft.com','company','4/4/1975','USA','Software/Hardware',2362942,'laptops, mobiles, and consoles');
INSERT INTO Employer VALUES(11,'CIB','FifthSett',19666,'1234659490','www.CIB.com','company','1/4/1975','Egypt','Banking',224975,'Deposit and Withdraw');
INSERT INTO Employer VALUES(10,'Opel','FifthSett',19945,'1234561510','www.Opel.com','startup','1/4/1862','Germany','Cars',1362942,'cars, motorcycles, and machine');
INSERT INTO Employer VALUES(9,'Apple','FifthSett',19234,'6245557890','www.Apple.com','government entity','1/4/1975','USA','Software/Hardware',2262362,'laptops, mobiles, and consoles');
---------------------------------------
-- Contact_person --
INSERT INTO Contact_person VALUES(8,'Mohamed','Manager','Mohamed@hotmail.com',01106549298,'1236549878');
INSERT INTO Contact_person VALUES(9,'Ahmed','Manager','Ahmed@gmail.com',01109189298,'1294649878');
INSERT INTO Contact_person VALUES(10,'Selim','Manager','Selim@yahoo.com',01198749298,'6541249878');
INSERT INTO Contact_person VALUES(11,'Omar','Manager','Omar@hotmail.com',01106549876,'4563249878');
---------------------------------------
-- HR_Director --
INSERT INTO HR_Director VALUES(8,'Samer','Samer@hotmail.com');
INSERT INTO HR_Director VALUES(9,'Moustafa','Moustafa@hotmail.com');
INSERT INTO HR_Director VALUES(10,'Slim','Slim@yahoo.com');
INSERT INTO HR_Director VALUES(11,'Caroline','Caroline@hotmail.com');
---------------------------------------
-- Admins --
INSERT INTO Admins VALUES(12);
INSERT INTO Admins VALUES(13);
---------------------------------------
-- Faculty_Representative --
INSERT INTO Faculty_Representative VALUES(14,'Informatics & CS');
INSERT INTO Faculty_Representative VALUES(15,'Engineering');
INSERT INTO Faculty_Representative VALUES(16,'Business');
---------------------------------------
-- Academic_Advisor --
INSERT INTO Academic_Advisor VALUES(17,'Informatics & CS');
INSERT INTO Academic_Advisor VALUES(18,'Engineering');
INSERT INTO Academic_Advisor VALUES(19,'Business');
---------------------------------------
-- Career_Office_Coordinator --
INSERT INTO Career_Office_Coordinator VALUES(20);
---------------------------------------
-- Job --
INSERT INTO Job VALUES('Software Engineer','creating software programs','Informatics & CS','12/30/2021','5/30/2022','12/20/2021',5,'90k-200k','coding skills, Js skills, working with frameworks','fifth settlement','www.Microsoft.com/Apply','Microsoft.Apply@hotmail.com','Industrial Internship',8,12,default,'not expert with web development coding');
INSERT INTO Job VALUES('Software Architecture','creating software structure','Informatics & CS','12/30/2021','5/30/2022','12/20/2021',3,'40k-180k','coding skills, Js skills, working with frameworks, skills with design and architecture','fifth settlement','www.Microsoft.com/Apply','Microsoft.Apply@hotmail.com','Freelance',8,13,default,'lack of design ideas');
INSERT INTO Job VALUES('Software security','secure the system of the software','Informatics & CS','12/30/2021','5/30/2022','12/20/2021',2,'120k-200k','coding skills, Js skills, working with frameworks, expert with security procedures','fifth settlement','www.Microsoft.com/Apply','Microsoft.Apply@hotmail.com','Summer Internship',8,12,default,'Didnt pass interview');
INSERT INTO Job VALUES('AI Engineer','creating software programs','Informatics & CS','12/30/2021','5/30/2022','12/20/2021',1,'150k-300k','coding skills,Python skills, working with frameworks','fifth settlement','www.Apple.com/Apply','Apple.Apply@hotmail.com','Industrial Internship',9,13,default,'Didnt pass interview');
INSERT INTO Job VALUES('Software Engineer','creating software programs','Informatics & CS','12/30/2021','5/30/2022','12/20/2021',7,'90k-230k','coding skills, Js skills, working with frameworks','fifth settlement','www.Apple.com/Apply','Apple.Apply@hotmail.com','Industrial Internship',9,12,default,'not expert with web development coding');
INSERT INTO Job VALUES('Software Architecture','creating software structure','Informatics & CS','12/30/2021','5/30/2022','12/20/2021',3,'40k-180k','coding skills, Js skills, working with frameworks, skills with design and architecture','fifth settlement','www.Apple.com/Apply','Apple.Apply@hotmail.com','Full Time',9,13,default,'lack of design ideas');
INSERT INTO Job VALUES('Accountant','handling monetary transactions','Business','12/30/2021','5/30/2022','12/20/2021',10,'3k-10k','math skills','fifth settlement','www.CIB.com/Apply','CIB.Apply@hotmail.com','Part time',11,12,default,'Didnt pass interview');
INSERT INTO Job VALUES('Teller','completing account transactions','Business','12/30/2021','5/30/2022','12/20/2021',10,'3k-10k','math skills','fifth settlement','www.CIB.com/Apply','CIB.Apply@hotmail.com','Full Time',11,13,default,'Didnt pass interview');
INSERT INTO Job VALUES('Treasury','overseeing company budget and investments','Business','12/30/2021','5/30/2022','12/20/2021',10,'3k-10k','math skills','fifth settlement','www.CIB.com/Apply','CIB.Apply@hotmail.com','Industrial Internship',11,12,default,'Didnt pass interview');
INSERT INTO Job VALUES('Mechanical Engineer','develop and inspect mechanical devices and systems','Engineering','12/30/2021','5/30/2022','12/20/2021',5,'20k-60k','engineering skills','fifth settlement','www.Opel.com/Apply','Opel.Apply@hotmail.com','Industrial Internship',10,13,default,'Didnt pass interview');
INSERT INTO Job VALUES('maintenance engineer','Monitors all equipments on production line','Engineering','12/30/2021','5/30/2022','12/20/2021',5,'15k-60k','engineering skills','fifth settlement','www.Opel.com/Apply','Opel.Apply@hotmail.com','Part Time',10,12,default,'Didnt pass interview');
INSERT INTO Job VALUES('architectural engineer','technical specifications and feasibility studies','Engineering','12/30/2021','5/30/2022','12/20/2021',5,'30-90k','engineering skills','fifth settlement','www.Opel.com/Apply','Opel.Apply@hotmail.com','Project based',10,13,default,'Didnt pass interview');
---------------------------------------
-- Allowed_faculties --
INSERT INTO Allowed_faculties VALUES(1,'Informatics & CS');
INSERT INTO Allowed_faculties VALUES(2,'Informatics & CS');
INSERT INTO Allowed_faculties VALUES(3,'Informatics & CS');
INSERT INTO Allowed_faculties VALUES(4,'Informatics & CS');
INSERT INTO Allowed_faculties VALUES(5,'Informatics & CS');
INSERT INTO Allowed_faculties VALUES(6,'Informatics & CS');
INSERT INTO Allowed_faculties VALUES(7,'Business');
INSERT INTO Allowed_faculties VALUES(8,'Business');
INSERT INTO Allowed_faculties VALUES(9,'Business');
INSERT INTO Allowed_faculties VALUES(10,'Engineering');
INSERT INTO Allowed_faculties VALUES(11,'Engineering');
INSERT INTO Allowed_faculties VALUES(12,'Engineering');
---------------------------------------
-- Required_semesters --
INSERT INTO Required_semesters VALUES(1,2);
INSERT INTO Required_semesters VALUES(2,3);
INSERT INTO Required_semesters VALUES(3,4);
INSERT INTO Required_semesters VALUES(4,5);
INSERT INTO Required_semesters VALUES(5,6);
INSERT INTO Required_semesters VALUES(6,2);
INSERT INTO Required_semesters VALUES(7,3);
INSERT INTO Required_semesters VALUES(8,4);
INSERT INTO Required_semesters VALUES(9,5);
INSERT INTO Required_semesters VALUES(10,6);
INSERT INTO Required_semesters VALUES(11,2);
INSERT INTO Required_semesters VALUES(12,3);
---------------------------------------
-- Part_time --
INSERT INTO Part_time VALUES(7,4);
INSERT INTO Part_time VALUES(11,3);
---------------------------------------
-- Freelance --
INSERT INTO Freelance VALUES(2);
---------------------------------------
-- Summer_internship --
INSERT INTO Summer_internship VALUES(3);
---------------------------------------
-- Full_time --
INSERT INTO  Full_time VALUES(6);
INSERT INTO  Full_time VALUES(8);
---------------------------------------
-- Project_based --
INSERT INTO Project_based VALUES(12);
---------------------------------------
-- Industrial_Internship --
INSERT INTO Industrial_Internship VALUES(1,0,17,14);
INSERT INTO Industrial_Internship VALUES(4,0,18,15);
INSERT INTO Industrial_Internship VALUES(5,0,19,16);
INSERT INTO Industrial_Internship VALUES(9,0,17,14);
INSERT INTO Industrial_Internship VALUES(10,0,18,15);
---------------------------------------
-- CV_Builder --
INSERT INTO CV_Builder VALUES(1,'Khaled@hotmail.com','Undergrad','Art','Khaledlinked@hotmail.com','https://github.com','coding,fast writer, drawing and design','best artist and best coder','Khaled','Mohamed','Tawfik','KhaledMohamed@student.giu-uni.de',3.5,6,'Informatics','Data Science');
INSERT INTO CV_Builder VALUES(2,'Omar@hotmail.com','Undergrad','Art, Sports, Theatre','Omarlinked@hotmail.com','https://github.com','coding,fast writer, drawing and design','best artist and best coder','Omar','Abdullah','Mohamed','OmarAbdullah@student.giu-uni.de',0.7,6,'Informatics','SE');
INSERT INTO CV_Builder VALUES(3,'Nadine@hotmail.com','Undergrad','Cooking baking, dance, yoga, and life skills','Nadinelinked@hotmail.com','https://github.com','coding,fast writer, and design','best artist and best coder','Nadine','Slim','El-mougy','NadineSlim@student.giu-uni.de',1,2,'Informatics','Data Science');
INSERT INTO CV_Builder VALUES(4,'Youssef@gmail.com','Undergrad','Craft and Life skills','Yousseflinked@hotmail.com','https://github.com','coding,fast writer','best coder','Youssef','Mohamed','Tawfik','YoussefMohamed@student.giu-uni.de',2.1,6,'Informatics','Security');
INSERT INTO CV_Builder VALUES(5,'Mariam@yahoo.com','Undergrad','Art, Craft','Mariamlinked@hotmail.com','https://github.com','coding,fast writer, drawing and design','best designer','Mariam','Ahmed','Moustafa','MariamAhmed@student.giu-uni.de',4.2,5,'Engineering','Automotive');
INSERT INTO CV_Builder VALUES(6,'Ashraf@hotmail.com','Undergrad','Craft,Music','Ashraflinked@hotmail.com','https://github.com','fast writer, drawing and design','best designer','Ashraf','Emad','Sobhy','AshrafEmad@student.giu-uni.de',3.4,3,'Engineering','Robotics');
INSERT INTO CV_Builder VALUES(7,'Yehia@gmail.com','Undergrad','Learning web tools, Life skills','Yehialinked@hotmail.com','https://github.com','fast writer, and design','best business idea','Yehia','Soliman','Omar','YehiaSoliman@student.giu-uni.de',2.27,5,'Business','Finance');
---------------------------------------
-- Applies --
INSERT INTO Applies VALUES(1,1,default);
INSERT INTO Applies VALUES(1,2,default);
INSERT INTO Applies VALUES(1,3,default);
INSERT INTO Applies VALUES(1,4,default);
INSERT INTO Applies VALUES(1,5,default);
INSERT INTO Applies VALUES(1,6,default);
INSERT INTO Applies VALUES(2,7,default);
INSERT INTO Applies VALUES(2,8,default);
INSERT INTO Applies VALUES(2,9,default);
INSERT INTO Applies VALUES(2,10,default);
INSERT INTO Applies VALUES(2,11,default);
INSERT INTO Applies VALUES(2,12,default);
INSERT INTO Applies VALUES(4,1,default);
INSERT INTO Applies VALUES(5,2,default);
INSERT INTO Applies VALUES(6,3,default);
INSERT INTO Applies VALUES(7,4,default);
INSERT INTO Applies VALUES(3,5,default);
INSERT INTO Applies VALUES(4,6,default);
INSERT INTO Applies VALUES(5,7,default);
INSERT INTO Applies VALUES(6,8,default);
INSERT INTO Applies VALUES(7,9,default);

---------------------------------------
-- Eligible --
INSERT INTO Eligible VALUES(1,1,20,0);
INSERT INTO Eligible VALUES(1,4,20,1);
INSERT INTO Eligible VALUES(1,5,20,1);
INSERT INTO Eligible VALUES(2,9,20,0);
INSERT INTO Eligible VALUES(2,10,20,1);
INSERT INTO Eligible VALUES(4,1,20,1);
INSERT INTO Eligible VALUES(7,4,20,1);
INSERT INTO Eligible VALUES(3,5,20,0);
INSERT INTO Eligible VALUES(7,9,20,0);
---------------------------------------
-- Review_Profile --
INSERT INTO Review_Profile VALUES(8,12,0,'Profile is not completed');
INSERT INTO Review_Profile VALUES(9,12,1,'Profile is not completed');
INSERT INTO Review_Profile VALUES(10,13,1,'Profile is not completed');
INSERT INTO Review_Profile VALUES(11,13,1,'Profile is not completed');

---------------------------------------
-- Progress_Report --
INSERT INTO Progress_Report VALUES(1,'2021/12/25',1,'Evaluated','report in which updated informations about a project or applying for a job are included',12);
INSERT INTO Progress_Report VALUES(1,'2021/12/26',1,'Evaluated','report in which updated informations about a project or applying for a job are included',12);
INSERT INTO Progress_Report VALUES(3,'2021/12/25',1,'Evaluated','report in which updated informations about a project or applying for a job are included',12);
INSERT INTO Progress_Report VALUES(4,'2021/12/25',1,'Evaluated','report in which updated informations about a project or applying for a job are included',12);
INSERT INTO Progress_Report VALUES(5,'2021/12/25',1,'Evaluated','report in which updated informations about a project or applying for a job are included',12);
INSERT INTO Progress_Report VALUES(6,'2021/12/25',1,'Evaluated','report in which updated informations about a project or applying for a job are included',12);
INSERT INTO Progress_Report VALUES(7,'2021/12/25',1,'Evaluated','report in which updated informations about a project or applying for a job are included',12);

---------------------------------------


