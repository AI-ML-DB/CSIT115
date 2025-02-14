create database lab3_2;
use lab3_2;

create table users(
userid int primary key,
username varchar(100)
);

create table habits(
hname varchar(100),
hid int primary key
);

create table userhabit(
since date,
hid int references habits(hid),
user_id int ,
primary key (hid,userid),
foreign key (user_id) references user(userid)
);

create table checkins(
cid int primary key,
cdate date,
hid int references habits(hid)
);

create table comments(
cdate date,
commenttext text,
coment_id int,
cid int references checkins(cid) 
			on delete cascade on update cascade,
primary key(cid,coment_id),
hid int references usershabit(hid),
userid int references usershabit(userid)
);

create table coach(
speciality char(100),
userid int primary key,
foreign key(userid) references users (userid) 
on delete cascade on update cascade
);



create table staff(
s_id int primary key,
sname char(100),
sgender char(1),
shrate int,
semail varchar(100) unique
);

create table project(
pid int primary key,
pbudget int,
pname varchar(100),
comp_name varchar(100),
mode_ varchar(100),
unique(pname,comp_name)
);

create table hours(
sid int references staff(sid),
hours int
);




/*ALTER TABLE table_name action_ object what_todo, 
							action_ object what_todo;*/
                            
ALTER TABLE staff ADD salary int, ADD age int,
				  drop sname;


desc staff;

/* only name:rename column
   only type and constraints :  MODIFY
   both: CHANGE
   */
ALTER TABLE project change pbudget budget real, 
					modify  mode_ enum('a','b','c'),
                    rename column comp_name to c_name;
                    
                    
ALTER TABLE hours ADD pid int references projects(pid);
ALTER TABLE project 
		ADD constraint unique_name unique(pname),
		ADD constraint check_budget CHECK (budget>100000);
                
        




/*in staff table gender can be only M or F, 
salary is always between 5000 and 25000,
sgender should be called gender*/


pid int primary key,
pbudget int,
pname varchar(100),
comp_name varchar(100),
mode_ varchar(100),


/*
show all details about projects with budget less than 1000000,
which are not in online mode, 
make sure to show the project with highest budget first*/
 

*/


