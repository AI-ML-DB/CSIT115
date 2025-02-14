create database d1;
create database d2;

use d1;


create table t11(
e_id	int primary key,
e_title	 varchar(100),
singer	char(50) not null,
gender	ENUM('F','M'),
price	decimal(5,2) default 100,   
year_ YEAR,
email char(10) 
); 

/*
INSERT INTO table_name VALUES(val1, val2...,val7);
INSERT INTO table_name VALUES(val1, val2...,val7),
(val1, val2...,val7),
(val1, val2...,val7);
INSERT INTO table_name (col1,col2) VALUES(val1, val2);
*/

INSERT INTO t11 VALUES(1, 'a','Asma','F',999,2025,'a@a.com');

INSERT INTO t11 VALUES(2, 'a','Yosra','F',500,2020,'a@a.com'),
(3, 'a','Nadir','M',100,2025,'a@a.com'),
(4, 'a','Ahmed','M',500,2025,'a@a.com');

INSERT INTO t11 (e_id,singer) VALUES(5, 'Simon');
/*
if all columns then use *
SELECT column names separated by comma
FROM table_name*/
SELECT * FROM t11;
/*if all columns then use *
SELECT column names separated by comma
FROM table_name
ORDER BY column_name type_ separated by comma*/
SELECT singer,gender,price, year_ FROM t11
ORDER BY year_, price DESC;

SELECT singer,price+100, year_ FROM t11
ORDER BY year_, price DESC;

SELECT singer,price+100 AS 'new price', year_ FROM t11
ORDER BY year_, price DESC;

select avg(price) as average from t11;

select distinct(year_) from t11;

select count(distinct(year_)) from t11;

/*col1=90
col2=100 

IF col1 > 80 

condition : column_name operator value 

SELECT column seperated by ,
FROM tablename
WHERE condition */

SELECT * from t11 
WHERE gender = 'F';

SELECT * from t11 
WHERE gender = 'F' or price<600;

SELECT * from t11 
WHERE price between 0 and 500;

SELECT * from t11 
WHERE gender != 'F' or price<600;

SELECT * from t11 
WHERE gender <> 'F' or price<600;


SELECT * from t11 
WHERE email is not null;


set sql_safe_updates=0;
/*
UPDATE tabke_name SET col=val, col2=val2 WHERE condition

*/
UPDATE t11 SET price=price+100, year_=2026 WHERE gender='F';

/*
DELETE FROM tabke_name WHERE condition
*/

delete from t11 where singer='Asma';













