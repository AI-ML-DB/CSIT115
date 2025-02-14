use lab4Th;
/*instructor(i_email  PK,i_fname ,i_lname ,i_gender ,i_speciality ,
i_salary ,i_housing ,i_yearly_raise )*/

/*subjects(su_id pk,su_name ,su_cp real, su_cat,su_prereq)

schedules(s_id PK,i_email FK instructor(i_email),
su_id FK subjects(su_id),s_dayname ,
s_stime,s_etime,s_hours,s_sdate,s_edate, fees)
*/
/*show email for instructors along with the day name 
for when they are teaching*/
select i.i_email, s_dayname
FROM instrictor i, scheuldes s
WHERE i.i_email=s.i_email
ORDER by s_dayname DESC;

/*show email from the instrctors who are not working */
SELECT i_email from instructor 
WHERE i_email not in (select i_email from schedules);

SELECT i_email from instructor 
WHERE NoT EXISTS (select * from schedules
where schedules.i_email=instructor.i_email);


/*show email for instructors along with the subject name 
and day name for what and when they are teaching*/
select i.i_email, s_dayname, su_id
FROM instrictor i, scheuldes s, subjects su
WHERE i.i_email=s.i_email AND su.su_id=s.su_id
AND i_gender='M' and salary>(select avg(i_salary) from instructor);


/*same as above*/
select i.i_email, s_dayname, su_id
FROM instrictor i JOIN scheuldes ON i.i_email=s.i_email
							JOIN subjects ON su.su_id=s.su_id
WHERE i.i_email=s.i_email AND su.su_id=s.su_id
AND i_gender='M' and salary>(select avg(i_salary) from instructor);


select i.*, s.su_id 
FROM instructor i JOIN schedules s
ON i.i_email=s.i_email;

select i.*, s.su_id 
FROM instructor i JOIN schedules s
ON i.i_email=s.i_email;

/*select categories*/
select distinct su_cat from subjects;

select su_cat from subjects
group by su_cat;

select distinct su_id, i_email from schedules;

select  su_id, i_email from schedules
group by su_id, i_email;

/*show the email, salary of instructors 
along with the subject they are teaching)*/
select i.i_email, s.su_id, i_salary
FROM instructor i JOIN schedules s
ON i.i_email=s.i_email
group by i.i_email, s.su_id;

/*show email, salary and number of sessions */
select i.i_email, i_salary, count(su_id)
FROM instructor i JOIN schedules s
ON i.i_email=s.i_email
group by i.i_email;

/*show email, salary and number of subjects */
select i.i_email, i_salary, count(distinct su_id)
FROM instructor i JOIN schedules s
ON i.i_email=s.i_email
group by i.i_email;

/*show email, number of subjects
for instructors who are 
getting paid more than min salary)*/

select i.i_email, count(distinct su_id)
FROM instructor i JOIN schedules s
ON i.i_email=s.i_email
WHERE i_salary>(select min(i_salary) from instructor)
group by i.i_email;

select i.i_email, i_salary, count(distinct su_id)
FROM instructor i JOIN schedules s
ON i.i_email=s.i_email
group by i.i_email
HAVING i_salary>(select min(i_salary) from instructor);

/*show email, salary, number of subjects
for instructors who are 
getting paid more than min salary), show the ones 
that are doing more than one */
select i.i_email, i.i_salary,count(distinct s.su_id)
FROM instructor i JOIN schedules s
ON i.i_email=s.i_email
WHERE i.i_salary>(select min(i_salary) from instructor)
group by i.i_email
HAVING count(distinct s.su_id)>1;


/*show email, salary, number of subjects
for instructors who are 
getting paid more than min salary), show the ones 
that are doing more than zero subjects
and are paid more than
average salary of each gender*/

select i.i_email, i.i_salary,count(distinct s.su_id)
FROM instructor i JOIN schedules s
ON i.i_email=s.i_email
WHERE i.i_salary>(select min(i_salary) from instructor)
group by i.i_email
HAVING count(distinct s.su_id)>0 AND
				i_salary>ALL (select avg(i_salary) FROM instructor
									group by i_gender);

/*show email, salary, number of subjects
for instructors who are 
getting paid more than min salary), show the ones 
that are doing more than zero subjects
and are paid more than
average salary of all employees*/


select i.i_email, i.i_salary,count(distinct s.su_id)
FROM instructor i JOIN schedules s
ON i.i_email=s.i_email
WHERE i.i_salary>(select min(i_salary) from instructor)
group by i.i_email
HAVING count(distinct s.su_id)>0 AND
				i_salary>(select avg(i_salary) FROM instructor);

/*UINION/INTERSECT/EXCEPT*
A(1,2,3,4,5,6)
B(1,2,7,8)
A UNION B ===> everything --> (1,2,3,4,5,6,7,8)
A INTERSECT B ===> common values ==>(1,2)
A EXCEPT B ==> values in A but not in B ==>(3,4,5,6)
B EXCEPT A ==> values in B but not in A ==(7,8)
*/

/*show all instructors and all
 codes*/
SELECT i.i_email, su_id
FROM instructor i left JOIN schedules s
ON i.i_email=s.i_email
UNION
SELECT s.i_email, su.su_id
FROM subjects su left JOIN schedules s
ON s.su_id=su.su_id;










