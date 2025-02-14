create database db1;
use db1;


create table users(
userid int primary key,
uname char(100)
);

create table habits(
habitid int primary key,
hname char(100)
);


create table uaerhabits(
since date,
userid int references users(userid),
habitid int,
primary key(userid,habitid),
foreign key(habitid) references users(habitid) on delete no action on update no action
);


create table checkins(
hc_id int primary key,
cdate date,
habitid int,
foreign key(habitid) references habits(habitid)
);

create table comments(
com_date date,
com_text varchar(500),
hc_id int,
commeny_id int,
userid int,
habitid int,
foreign key(userid,habitid) references userhabits(userid,habitid),
foreign key(hc_id) references checkins(hc_id) on delete cascade on update cascade,
primary key (hc_id,commeny_id)
);


create table coach(
speciality varchar(100),
user_id int primary key,
constraint fk1 foreign key(user_id) references users(userid) 
		on delete cascade on update cascade
);









create table staff(
sid int primary key,
ename varchar(100),
sgender char(11),
email varchar(100)  unique,
salary int check(salary between 10000 and 100000)
);


create table project(
pid int primary key,
pname varchar(100),
c_name varchar(100) ,
budget int,
mode_ varchar(100),
unique(pname,c_name)
);


create table newtable(
hours int,
pid int references project(pid) on delete cascade ,
sid int references staff(sid) on delete no action
);

/*actions: ADD/DROP/Change/Modify/Rename
column, constraint

ALTER TABLE table_name action object_name*/
ALTER TABLE newtable ADD constraint c_name primary key(sid,pid);





/*prohect table 
budget must be grreater than 100000,
c_name should be company_name,
mode_ can be online or offline
*/


ALTER TABLE project 
				ADD CONSTRAINT check_budget check(budget>100000),
                RENAME COLUMN c_name TO company_name,
                MODIFY mode_ ENUM('online','offline');
                

/*for staff table
remove staff name, 
add new colum called staff_type that can be full time or part time,
change the name of sgender to gender and the data type to take only F and  M
*/


alter table staff
	drop column sname,
    add column staff_type enum('full time', 'part time'),
    rename column sgender to gender,
    modify column gender enum('F', 'M');
    
alter table staff
	drop column sname,
    add column staff_type enum('full time', 'part time'),
    change column sgender gender enum('F','M') not null;

desc project;




/*

show project name and budget for 
all projects which are not online and have budget beyond 10000
show the project with highest budget first*/

Select p_name, p_budget from Project WHERE p_mode != 'online' and p_budget > 10000 ORDER BY p_budget desc;






