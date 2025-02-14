/*TASK0: create and use a database then run statements below*/
create database lab4Th;
use lab4Th;
create table instructor(
i_email varchar(100) unique,
i_fname varchar(50),
i_lname varchar(50),
i_gender char(1),
i_speciality varchar(50),
i_salary real,
i_housing real,
i_yearly_raise real /*in percentage*/
);
insert into instructor values
('amd@uow.com','Asma','Hassan','F','Databases and Data Mining',10000,2000,10),
('aao@uow.com','Abdullah','Omar','M','Cyber Security',13000,2500,5),
('af@uow.com','Afrah','Ahmed','F','Finance and Accounting',12000,3000,5),
('cld@uow.com','Chritine','Diaz','F','Marketing',9000,1250,10),
('cbd@uow.com','Carlos','Artour','M','Game Development',15000,3500,0),
('dma@uow.com','Donia','Akbar','F','Finance and Accounting',12000,3000,5),
('dwj@uow.com','Dani','Junior','M','Databases and Data Mining',13000,2500,10),
('dm@uow.com','Dibu','Martinez','M','Databases and Data Mining',10000,2000,10);

/*subject table and data*/
create table subjects(
su_id char(8) primary key,
su_name varchar(100),
su_cp real, /*credit point*/
su_cat varchar(50), /*subject category*/
su_prereq char(8) /*subject pre requisit*/
);
insert into subjects values
('CSIT115','Database Management',6,'Computer Science',null),
('CSCI317','Database Perfromance',8,'Computer Science','CSIT115'),
('CSCI316','Big Data Applications',8,'Computer Science','CSIT115'),
('CSCI127','Security',6,'Computer Science',Null),
('MARK101','Intro to Marketing',6,'Business',Null),
('MARK303','Market Analysis',8,'Business','MARK101'),
('ACCY101','Intro to Accounting',6,'Finance',Null),
('CSCI015','Intro to Computing',3,'Computer Science',Null),
('FIN015','Intro to Finance',3,'Finance','ACCY101');

create table schedules(
s_id int,
i_email varchar(100) references instructor(i_email),
su_id char(8) references subjects(su_id),
s_dayname varchar(50),
s_stime time, /*start time*/
s_etime time, /*end time*/
s_hours int, /*session duration*/
s_sdate date, /*start date*/
s_edate date not null /*end date*/
);

/*Shchedule of offered acourses*/
insert into schedules values 
(1,'amd@uow.com','CSIT115','Monday','12:30','',2,'2022-10-04','2022-12-13'),
(2,'amd@uow.com','CSIT115','Tuesday','14:30','',2,'2023-01-02','2023-03-13'),
(3,'amd@uow.com','CSCI316','Wednesday','13:30','',3,'2023-02-15','2023-05-17'),
(4,'dwj@uow.com','CSCI317','Wednesday','13:30','',3,'2023-03-01','2023-04-26'),
(5,'cld@uow.com','MARK101','Monday','12:30','',2,'2023-02-06','2023-04-24'),
(6,'cld@uow.com','MARK101','Thursday','12:30','',2,'2024-01-04','2024-03-24'),
(7,'af@uow.com','ACCY101','Tuesday','10:30','',2,'2023-01-02','2023-03-13'),
(8,'dma@uow.com','ACCY101','Tuesday','10:30','',2,'2023-01-02','2023-03-13'),
(9,'cld@uow.com','MARK303','Monday','09:30','',2,'2023-02-07','2023-05-23'),
(10,'aao@uow.com','CSCI127','Wednesday','09:30','',2,'2023-03-22','2023-05-17'),
(11,'dma@uow.com','FIN015','Tuesday','15:30','',1,'2023-01-02','2023-03-13'),
(12,'amd@uow.com','CSCI316','Monday','15:30','',3,'2023-10-02','2024-01-14');

/*SELECT column_names 
FROM tb_name,tb_name2 
WHERE tb_name.pk=tb_name2.fk 
ORDER BY column_name DESC/ASC*/

/*show instructors first name and last name and 
the start and end date of courses they are teaching*/

SELECT i_fname AS fname,i_lname, s_sdate,s_edate
FROM instructor, schedules
WHERE instructor.i_email= schedules.i_email;

SELECT i.i_fname AS fname,i.i_lname, s.s_sdate,s.s_edate
FROM instructor i, schedules s
WHERE i.i_email= s.i_email;


SELECT i.i_fname AS fname,i.i_lname, i.i_email, s.s_sdate,s.s_edate
FROM instructor i, schedules s
WHERE i.i_email= s.i_email;


 SELECT i.*, s.s_sdate,s.s_edate
FROM instructor i, schedules s
WHERE i.i_email= s.i_email;


/*Show instuctor speciality and subject name for all scheduled subjects*/

SELECT i_speciality, su_name
FROM instructor, subjects,scheules
WHERE instructor.i_email=scheules.i_email AND 
subjects.su_id=scheules.su_id;


/*find all instructors who are paid more than average salary*/

SELECT * from instructor where i_salary> 
(select avg(salary) from i_instructor);


/*find all subjects which do not have schedules*/
SELECT * FROM subjects where subjects.su_id  not in
(select su_id from schedules);

desc instructor;


/*Q1. show the fisrt 2 letters of emails and fisrt and last name in a
single column called 'Full name' formated like Asma.Damankesh*/
SELECT substring(i_email,1,2) as whatever,
CONCAT(i_fname,'.',i_lname) As 'Full Name' FROM instructor;

SELECT substring(i_email,1,2) as whatever,
CONCAT_WS('.',i_fname,i_lname,'is pretty') As 'Full Name' FROM instructor;

/*Q2. how many days has passed since each project started fro all projects
started in February*/

select datediff(current_date(),s_sdate)
FROM schedules
WHERE monthname(s_sdate)='February';
/*Q3 Which day will be your birthday in 5 years */
select dayname(date_add('2022-10-04', interval  5 year)) from dual;

/*Q4. show day name, month name of end date for all schedules that have
more than 100 days to be completed*/
SELECT dayname(s_edate),monthname(s_edate)
FROM schedules 
WHERE datediff(s_edate,s_sdate)>100;

/*Q5. Replace com to uae*/

set sql_safe_updates=0;
update instructor set i_email=REPLACE(i_email,'com','UAE');




