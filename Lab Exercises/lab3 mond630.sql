create database lab3win2025;
use lab3win2025;


create table users(
userid int primary key,
name_ char(100)
);

create table coach(
user_id int primary key,
speciality varchar(100),
constraint user_fk foreign key  (user_id)references users(userid)
on delete cascade on update cascade
);

create table habits(
haabit_id int primary key,
hname varchar(100)
);

create table user_habits(
since date,
habit_id int references habits(haabit_id),
user_id int,
foreign key (user_id) references users(user_id),
primary key(user_id,habit_id)
);






create table checkins(
checkin_date date,
habit_checkin_id int primary key,
habit_id int references habits(haabit_id)
);


create table comments(
cid int,
cdate date,
ctext text,
habit_checkin_id int references checkins(habit_checkin_id) on delete cascade on update cascade,
primary key (habit_checkin_id,cid)
);


create table projects(
pid int primary key,
c_name varchar(100),
p_name varchar(100),
pbudgeting varchar(100),
p_mode varchar(100),
unique (c_name,p_name)
);

create table staff23(
sid int primary key,
sname char(100),
gender char(1),
h_rate int,
salary int check (salary between 5000 and 20000),
email varchar(100) unique
);


create table staff_hours(
hours int, 
pid int references projects(pid) on delete cascade,
sid int references staff23(sid),
primary key(sid,pid)
);

ALTER  Table staff23 add test1 int, add test2 int;

ALTER table projects modify pbudgeting real not null;

desc staff23;

desc projects;


/*change staff table as below in a single statement
add a column test3 as number with default value 0,
rename h_rate to hrate
change the gender to take only M and F as value*/


/*make sure one employee is managing any project*/

alter table projects add sid int;

alter table projects add constraint si_fk foreign key(sid) 
references staff23(sid), add constraint check_c check(pbudgeting >100000);


/*for all staff who are 
not male and have hourly rate 
more than 100
show their salary, name and id,
show the ones with highest salary
first*/

SELECT colum names
FROM table name
WHERE condition;



SELECT column_names_separated_comma
FROM table_name1 JOIN table_name2 ON join_condition;

SELECT column_names_separated_comma
FROM table_names_separated_comma
WHERE join_condition;





