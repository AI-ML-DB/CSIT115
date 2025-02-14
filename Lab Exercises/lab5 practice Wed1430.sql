use lab4Th;
/*instructor(i_email  PK,i_fname ,i_lname ,i_gender ,i_speciality ,
i_salary ,i_housing ,i_yearly_raise )

subjects(su_id pk,su_name ,su_cp real, su_cat,su_prereq)

schedules(s_id PK,i_email FK instructor(i_email),
su_id FK subjects(su_id),s_dayname ,
s_stime,s_etime,s_hours,s_sdate,s_edate, fees)
*/

/*SELECT colum_names FROM table_names
WHERE tb1.pk=tb2.fk [AND/OR] more_conditions*/


/*show all details about subjects, and which day they are scheduled for, for
those offered in any day but monday*/

SELECT subjects.*, s_dayname
FROM subjects, schedules
WHERE subjects.su_id=schedules.su_id
AND s_dayname<>'Monday';
/*SELECT colum_names 
FROM tb1 JOIN tb2 on tb1.pk=tb2.fk1
				 JOIN tb3 on tbv2.fk2=tbs.pk
WHERE condition
ORDER BY column_name*/

/*for all male instructors show their email and 
month of start date they have schedules*/

SELECT instructor.i_email, monthname(s_sdate)
FROM schedules RIGHT JOIN instructor on
schedules.i_email=instructor.i_email
WHERE i_gender='M';

/*change above code to show email adress of 
only instructors who are not teaching
USING JOIN/LEFT JOIN/RIGHT JOIN*/

SELECT instructor.i_emai 
FROM schedules RIGHT JOIN instructor on
schedules.i_email=instructor.i_email
WHERE i_gender='M' AND monthname(s_sdate) is null;

/*SELECT col1, aggregate_function(col2) FROM tb_name
WHERE condition --- to filter the rows in the tables before group by
Group By col1
HAVING condition --- filter the groups reulted from group by statement*/

/*for i_speciality with more than one instructor
show total salary and average housing for 
if the instcrtor has i_yearly_raise above 3. 
*/
SELECT i_speciality,sum(i_salary),avg(i_housing)
FROM instructor
WHERE i_yearly_raise>3
group by (i_speciality)
having count(i_email)>1 AND sum(i_salary)>25000;

/*for all months except December and January  (start date)
show how many subjects are offered, and what's the minium credit point
of the subject offered. show month with more subjects first */

count(distinct su_id)
min(su_cp)
ORDER BY count(distinct su_id)

SELECT monthname(s_sdate) ,count(distinct subjects.su_id) as abcd, min(su_cp)
FROM  subjects JOIN schedules on subjects.su_id=schedules.su_id
WHERE monthname(s_sdate) no in ('December','January')
group by monthname(s_sdate)
ORDER BY abcd desc;

SELECT monthname(s_sdate) ,count(distinct subjects.su_id), min(su_cp)
FROM  subjects JOIN schedules on subjects.su_id=schedules.su_id
WHERE monthname(s_sdate) not in ('December','January')
group by monthname(s_sdate)
ORDER BY count(distinct subjects.su_id) desc;





