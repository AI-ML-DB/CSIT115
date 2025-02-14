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


/*show all details about instructors, and which day they are teaching for
those teaching on Monday or Wednesday*/

SELECT instructor.*, s_dayname FROM instructor,schedules
WHERE instructor.i_email=schedules.i_email
AND s_dayname in ('Monday','Wednesday');

/*SELECT colum_name 
FROM tb1 JOIN tb2 on tb1.pk=tb2.fk2
				 JOIN tb3 on tb2.fk2=tb3.pk
WHERE conditions*/
/*for all subjects with credit point more than 1 show their id, category, 
and which day they are scheduled for*/
SELECT subjects.su_id, su_cat, s_dayname
FROM subjects LEFT JOIN schedules ON subjects.su_id=schedules.su_id
WHERE su_cp>1;

/*SELECT colum_name 
FROM tb1 JOIN tb2 on tb1.pk=tb2.fk2
				 JOIN tb3 on tb2.fk2=tb3.pk
WHERE conditions*/
/*show email and sid for all instructors who are not having any schedules 
using JOIN or LEFT JOIN or RIGHT JOIN*/

SELECT instructor.i_email, s_id FROM
instructor LEFT JOIN schedules on schedules.i_email=instructor.i_email
WHERE s_id is null;


/*for each speciality show the number of instructors and average salary
for those with yearly raise above 2*/
SELECT i_speciality, count(i_email), avg(i_salary)
FROM instructor 
WHERE i_yearly_raise>1
group by (i_speciality)
HAVING count(i_email)>1;

/*change above code to show only those speciality with more than
1 instructor*/

/*SELECT col1, aggregate_function(col2)
FROM table_name
WHERE condition (conditions to filter rows of existing table)
group by(col1)
HAVING condition (conditions to filter rows/groups resulted from group by*/


/*for subjects taught by male instcutors show subject name,
how many times the subject is offered if they 
are offered more than once and charged above 500 on average*/

SELECT su_name, count(*)
FROM subjects JOIN schedules on subjects.su_id=schedules.su_id
							JOIN instructor on schedules.i_email=instructor.i_email
WHERE i_gender='M'
group by su_name
HAVING count(*)>1 and avg(fees)>500;




















