use lab4Th;
/*instructor(i_email  PK,i_fname ,i_lname ,i_gender ,i_speciality ,
i_salary ,i_housing ,i_yearly_raise )

subjects(su_id pk,su_name ,su_cp real, su_cat,su_prereq)

schedules(s_id PK,i_email FK instructor(i_email),
su_id FK subjects(su_id),s_dayname ,
s_stime,s_etime,s_hours,s_sdate,s_edate,
*/

/*SELECT colum_names FROM table_names
WHERE tb1.pk=tb2.fk [AND/OR] more_conditions*/
/*print all subjects details and email address of the subject instructor
for subjects about Compter Science*/

SELECT *, i_email FROM
subjects, schedules
WHERE subjects. su_id=schedules.su_id
AND su_cat='Computer Science';
/*SELECT colum_names FROM
tb1 join tb2 on tb1.pk=tb2.fk1 
	  join tb3 on tb2.fk2=tb3.pk
WHERE conditions
ORDER BY colum_name*/

/*show all details about all instrctors and 
which subjects they are teaching (only subject id)*/


SELECT instructor.*, su_id FROM
instructor INNER JOIN schedules ON instructor.i_email=schedules.i_email;

SELECT instructor.*, su_id FROM
instructor LEFT JOIN schedules ON instructor.i_email=schedules.i_email;

/*hange above code to show instructor who are not teaching*/
SELECT instructor.*, su_id FROM
instructor LEFT JOIN schedules ON instructor.i_email=schedules.i_email
WHERE su_id is null;

/*change above code to show only female instructors who are not teaching*/
SELECT instructor.*, su_id FROM
instructor LEFT JOIN schedules ON instructor.i_email=schedules.i_email
WHERE su_id is null AND i_gender='F';
/*SELECT col1, aggregate_function(column)
FROM table_name
WHERE conditions (conditions to filter rows in the existing tables
Group By(col1) 
HAVING conditions (condition to filter the group resulted from group by stmt*/
/*for subjects with credit point greater than three
show how many subjects do we have for each category,
and what is the maximum credit point for the category,
show only those categories which have more than one subject*/

SELECT su_cat, max(su_cp) as 'max cp', count(*) as 'count_'
FROM subjects
WHERE su_cp>3
group by(su_cat)
HAVING count(*)>1;

/*SELECT col1, aggregate_function(column)
FROM table_name
WHERE conditions (conditions to filter rows in the existing tables
Group By(col1) 
HAVING conditions (condition to filter the group resulted from group by stmt*/

/*for all male instructors show instructor email,
the number of week days and total credit point
of subjects they are teaching*/

SELECT instructor.i_email, count(distinct s_dayname), sum(distinct su_cp)
FROM instructor LEFT JOIN schedules ON instructor.i_email=schedules.i_email
							LEFT JOIN subjects ON schedules.su_id=subjects.su_id
WHERE i_gender='M'
GROUP BY instructor.i_email;





