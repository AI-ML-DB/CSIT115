create database win2025_Lab2;
create database win2025_Lab2_test;

use win2025_Lab2;

/*create table table_name (
	column_name data_type constraints,
    column2 data_type constraints,
    constraint constrain_name constraint_type(column_name)
);*/

create table students(
sid	int,
sname	char(100) NOT NULL,
sgender	char(1),
sage	int,
sgpa	decimal(4, 2) ,
wage  float,
yob	YEAR default 2005,
city ENUM ('DUbai','AbuDhabi'),
email char(100),
constraint sid_pk primary key(sid),
constraint email_ck unique(email)
);

show databases;


insert into students values(123,'Asma','F',4.5,20,200,2000,'DUbai','a.com');

insert into students(sid,sname,sgender,sage,city) values(122,'Ali','M',25,'DUbai');


insert into students values
(111,'Lila','F',4.5,20,200,2000,'DUbai','b.com'),
(121,'Farhad','M',3.5,19,100,1995,'AbuDhabi','c.com'),
(124,'Bilal','M',3.3,23,50,2002,'DUbai','d.com'),
(125,'Asma','F',2.5,22,200,2010,'AbuDhabi','e.com'),
(126,'Farhad','M',4.25,22,100,2020,'AbuDhabi','f.com')
;

/*
SELECT Column_Names_Separated_by_cooma
FROM table_name
*/

SELECT sid from students;

SELECT sid,sage,yob from students;

select * FROM students;

/*create column on the go using math operations*/

select sid, sage, sage+2, wage*2 from students;


select sid as id, sage as age, sage+2 as test from students;

/*create column on the go using aggregate functions*/
select max(sage) max_age, min(sgpa) 'lowest gpa', count(sid) 'num students' from students;

select * from students;

/*
SELECT Column_Names_Separated_by_cooma
FROM table_name
ORDER BY olumn_name order_type (if more than one column separate by comma)
*/

select sid,yob,wage from students
order by wage ASC, yob DESC;

/*
SELECT Column_Names_Separated_by_cooma
FROM table_name
WHERE condistion (column_name operator value)
*/

SELECT *
FROM students
WHERE sgender='F' or wage<100;

select * from students
where email is not null and sgpa between 20 and 22;

select * from students where sname!='Asma';


select sname,sage,wage from students
where sname !='Ali' and sgpa>20
order by wage DESC;

SET SQL_SAFE_UPDATES = 0;

/*update table_name set column_name1=value1, column_name2=value2,..... WHERE condition.*/
update students set wage=wage+10
where wage<100;

select * from students;

update students set wage=wage+10, sage=sage*2
where wage<150;


/*delete from table_name where conditions*/;

select count(sname) from students;

delete from students where sname='Asma' OR sname='Ali';










