create database d1;
create 
database 
d2;
use d1;

create table t1(
event_ int primary key,
event_name varchar(100) unique,
singer char(100) not null,
gender ENUM('F','M'),
price decimal(5,2) default 100,   
Year_ YEAR
);

/*INSERT INTO table_name VALUES(col1,col2,....,col6);
INSERT INTO table_name VALUES(col1,col2,....,col6),
(col1,col2,....,col6),
(col1,col2,....,col6);
INSERT INTO table_name(columns you want) VALUES (value for each)*/

insert into t1 values(1,'a','b','F',600,2025);

insert into t1 values(2,'kjhjh','asma','F',900,2023),
(3,'egerg','Ali','M',200,2020),
(4,'tte','abdullah','M',999,2025),
(5,'rthrt','b','F',600,2025);


INSERT INTO t1(event_,singer) VALUES (6,'Sara');


/*SELECT column names separated by comma
FROM table_name;*/

select price,year_,singer
FROM t1;

select *
FROM t1;

select price+100 as 'new price' ,year_,singer
FROM t1;

select avg(price) as average,min(price) as minimum
FROM t1;

select distinct(year_) from t1;

select count(distinct(singer)) from t1;






/*SELECT column names separated by comma
FROM table_name
ORDER BY colum type, column type;*/

SELECT *
FROM t1
ORDER BY year_ desc,price;



/*
col1=200
col1=200
if col1 > 200 or col2=100
WHERE col1 > 200 or col2=100
*/




/*

format of condition:
column operator value

SELECT column names separated by comma
FROM table_name
WHERE condition
ORDER BY colum type, column type;*/


SELECT * FROM t1 WHERE price between 0 and 100;

SELECT * FROM t1 WHERE price>200 and gender='F';

SELECT * FROM t1 WHERE price>200 and gender<>'F';
SELECT * FROM t1 WHERE price>200 and gender!='F';

select * from t1 WHERE year_ is not NULL;

set sql_safe_updates=0;


/*UPDATE table_name SET col=value, col2=value2 WHERE condition*/
update t1 SET price=price-100 where year_=2025;



/*DELETE FROM t1 WHERE condition*/
delete from t1 where year_ is null;


