/*TASK0: create and use a database then run statements below*/
create database tt1;
use tt1;

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


/*show instructor name, subject name and schedule s_dayname for all
subjects*/

select i_fname, su_name, s_dayname FROM
instructor,subjects, schedules
WHERE  instructor.i_email=schedules.i_email AND
subjects.su_id=schedules.su_id;

/*show all subjects details along with the instructor name*/
select inst.i_fname AS 'fisrt name', sub.su_name FROM
instructor inst,subjects sub, schedules sch
WHERE  sub.su_id=sch.su_id AND inst.i_email=sch.i_email;


/*show all subjects that have the highest credit point*/
select su_name from subjects where su_cp=(select max(su_cp) from subjects);

/*show subject  names for all subjects that are not offered*/


select su_name from subjects where su_id not in (select su_id from schedules);



/*show the fisrt 4 letters of subject code*/
select substring(su_id,1,4) as code FROM subjects;


/*show instructor email and their gender in a single column
formatted like email: gender */

SELECT concat(i_email,': ',i_gender)
FROM instructor;

SELECT concat_ws(',', i_fname,i_lname,i_email)
FROM instructor;


/*for schedule start date  show which day, year it was started
for those schedules ending in January*/

SELECT s_sdate, dayname(s_sdate), dayofmonth(s_sdate), dayofweek(s_sdate), year(s_sdate)
FROM schedules 
WHERE monthname(s_edate)='January';


/*what will be a new deadline if we add one year to all end dates*/
select s_edate, date_add(s_edate, interval 20 month) as 'new deadline' from schedules;

/*how many days each schedule lasts*/
select datediff(s_edate,s_sdate) as days from schedules;

select datediff(now(),s_edate) as days from schedules;



/*TASK3: list subject name, subject pre-requist name*/

select sub.su_name, pre_req.su_name
FROM subjects sub, subjects pre_req
WHERE sub.pre_req  = pre_req.su_id

