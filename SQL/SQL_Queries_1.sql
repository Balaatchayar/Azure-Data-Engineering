---Database creation and deletion, database selection, table creation, data insertion, reading data using SELECT, inserting partial 
---column values, SQL constraints (NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT), primary key vs unique key, foreign key relationships, 
---filtering data using WHERE and IS NULL, sorting data using ORDER BY, deleting data using DELETE, TRUNCATE, and DROP, updating records, logical operators (AND, OR, IN, NOT IN), and 
---aggregate functions (MAX, MIN, SUM, COUNT, AVG).




---1. to create new database
CREATE DATABASE EMPLOYEE

--2. to use database (go to specific database)
USE EMPLOYEE

--3. to delete database 
DROP DATABASE EMPLOYEE

--4. to create table
CREATE TABLE EMP (
ID INT,
NAME VARCHAR(30),
ADDRESS VARCHAR(30),
SALARY INT
)

---create and Insert statement


--5. create table and insert vales in the tables
create table employee (
id int,
name varchar(28),
address varchar(28),
salary int,
bonus float
)

-- INSERT 

INSERT INTO employee values(1,'Ananya','INDIA',10000,3.5)
INSERT INTO employee values(2,'Rani','INDIA',20000,3.5)

--6. to read any tables
select * from employee

--7. create table and insert only few colmn values in the table

INSERT INTO employee values(3,'Kavya',4.5)

insert into employee(id,name,bonus) values(3,'Kavya',4.5)


--8. SQL constraints 

-- Definition:
--SQL constraints are rules applied to columns in a database table
--to enforce data integrity and ensure the accuracy and reliability of the data.
1. NOT NULL
Definition: Ensures that a column cannot have a NULL value.
2. UNIQUE
Definition: Ensures that all values in a column are unique across the table,
preventing duplicate entries.
3.PRIMARY KEY
Definition: A combination of NOT NULL and UNIQUE.
It uniquely identifies each row in a table and cannot accept NULL values.
4.FOREIGN KEY
Definition: Establishes a relationship between two tables by ensuring that a value in one table
matches a value in another, maintaining referential integrity.
5.CHECK
Definition: Ensures that all values in a column satisfy a specific condition, 
helping to enforce business rules.
6.DEFAULT
definition: Provides a default value for a column when no value is specified during the insertion of a new record.


-- 9. Not Null and UNIQUE CONSTRAINTS

-- table -  email cant be blank 
-- table -  Unique phone nmber 

create table emp1(
id int,
email varchar(128) NOT NULL,
phone varchar(28) UNIQUE
)

SELECT * FROM EMP1

INSERT INTO EMP1 VALUES(1,'ABC@GMAIL.COM',123)

INSERT INTO EMP1(ID,EMAIL,PHONE) VALUES(3,'DEF',234)





--10. check and default constraints 

--1 . create table emp ehere age column should contain value only greater than 18 
--2.  create table emp where country value should automatic take default INDIA.

CREATE TABLE EMP2 (
ID INT,
AGE INT CHECK (AGE>18) ,
COUNTRY VARCHAR(28) DEFAULT 'india'
)

insert into emp2 values(1,19,'india')
select * from emp2

insert into emp2 (id,age) values(2,20)




---11. PRIMARY KEY & UNIQUE KEY

-- PRIMARY KEY - 
-- A PRIMARY KEY is a column (or a set of columns) that uniquely identifies each row in a table.
-- No two rows can have the same primary key value, and it can’t be NULL.

-- IT DOESNT CONTAIN DUPLICATE VALUE   
-- IT CANT BE NULL 
-- WE CAN HAVE ONLY 1 PRIMARY KEY IN THE TABLE

-- DIFFERNCE BETWEEN UNIQUE KEY VS PRIMARY KEY 


CREATE TABLE EMP3 (
ID INT PRIMARY KEY,
EMAIL VARCHAR(28)
)

INSERT INTO EMP3 VALUES(NULL,'DEF')


--12. FOREIGN KEY CONSTRAINTS


CREATE TABLE DEPARTMENT1 (
DEPT_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(28)
)

CREATE TABLE STUDENT1(
ID INT PRIMARY KEY,
NAME VARCHAR(28),
DEPT_ID INT
FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT1(DEPT_ID)
)

CREATE TABLE EMPL (
ID INT,
NAME VARCHAR (17),
SALARY INT,
LOCATION VARCHAR(17),
DEPT VARCHAR(17)
)

INSERT INTO EMPL VALUES (1,'Ananya', 900000,'INDIA','SDE')
INSERT INTO EMPL VALUES (2,'Rani', 1000000,'INDIA','SDE2')
INSERT INTO EMPL (ID ,NAME,SALARY,DEPT) VALUES (3,'Sneha', 700000,'SALES')
INSERT INTO EMPL(ID ,NAME,SALARY,DEPT) VALUES (4,'Pooja', 600000,'HR')

SELECT * FROM EMPL
--FILTERING AND SORTING 

-- 13. HOW TO FILTER DATA IN SQL 
--FILTER A DATA FROM EMPLOYEE TABLE WHERE SALARY GRETAER THAN 700000
 SELECT * FROM EMPL WHERE SALARY>700000

--FILTER A DATA FROM EMPLOYEE WHERE LOCATION IS NULL
SELECT * FROM EMPL WHERE LOCATION IS NULL

--14 HOW TO SORT THE DATA IN SQL 
--SORT THE DATA BASED ON HIGHEST TO LOWEST SALARY
SELECT * FROM EMPL ORDER BY SALARY DESC

--SORT THE DATA BASED ON LOWEST TO HIGHEST SALARY
SELECT * FROM EMPL ORDER BY SALARY ASC


SELECT * FROM EMPL 
-- 14. DELETE VS DROP VS TRUNCATE IN SQL 

--DELETE - WHEN YOU WANT TO DELETE ANY SPECIOFIC ROW OR COMPLETE DATA FROM TABLE 
DELETE FROM EMPL WHERE ID=4
DELETE FROM EMPL 

--TRUNCATE 
--WE USE WHENEVER WE HAVE TO DELETE COMPLETE DATA FROM TABLE 
TRUNCATE TABLE EMPL 

-- DROP 
DROP TABLE EMPL



CREATE TABLE EMPL (
ID INT,
NAME VARCHAR (17),
SALARY INT,
LOCATION VARCHAR(17),
DEPT VARCHAR(17)
)

INSERT INTO EMPL VALUES (1,'Ananya', 900000,'INDIA','SDE')
INSERT INTO EMPL VALUES (2,'Rani', 1000000,'INDIA','SDE2')
INSERT INTO EMPL (ID ,NAME,SALARY,DEPT) VALUES (3,'Sneha', 700000,'SALES')
INSERT INTO EMPL(ID ,NAME,SALARY,DEPT) VALUES (4,'Pooja', 600000,'HR')
INSERT INTO EMPL(ID ,NAME,DEPT) VALUES (5,'Neha','HR')
INSERT INTO EMPL(ID ,NAME,DEPT) VALUES (6,'Shreya','HR')

select * from empl

-- 15. update in sql 

-- update emplyoee location as INDIA where location is null
UPDATE empl set location ='INDIA'
where location is null


--- update salary as 100000 for shyam 
update empl set salary=100000
where name='Shreya'

--  update salary as 100000 if ist null 
update empl set salary=100000
where salary is null


--16. AND /OR/NOT IN IN SQL 

--AND - IF WE HAVE 2 CONDITION THEN BOTH CONDITION IF ITS MATCHING THEN WE WILL GET RESULT
--OR/IN--IFWE HAVE 2 CONDITION AND IF ANY OF THE CONDITION SATISFY THEN WE WILL GET RESULT
--NOT -- IF CONDITION WE ARE CHECKING WITH NOT CLAUSE 

--AND
-- GIVE THE EMPLOYEE DETAILS WHO ARE FROM HR DEPARTMENT AND ALSO SALARY IS 100000
SELECT * FROM EMPL WHERE DEPT ='HR' AND SALARY=100000

-- GIVE THE EMPLOYEE DETAILS WHO ARE FROM HR DEPARTMENT OR FROM LOCATION USA
SELECT * FROM EMPL WHERE DEPT='HR' OR LOCATION='USA'

--OR/IN

-- GIVE THE EMPLOYEE DETAILS OF EMPLOYEE WHERE ID IS 2,3,4,6
SELECT * FROM EMPL WHERE ID=2OR ID =3 OR ID=4 OR ID=6
SELECT * FROM EMPL WHERE ID IN (4,3,66)

--NOT IN 
-- GIVE THE EMPLOYEE DETAILS WHERE ID NOT (2,3,4,5,6)
SELECT * FROM EMPL WHERE ID NOT IN (2,3,4,5,6)


--17.aggregate in sql 
select * from empl
--17. how to find maximum salary of employee from empl table 
select max(salary) from empl
--18. how to find minimum salary of employee
select min(salary) from empl
--19. total salary of employee 
select sum(salary) from empl
--20. find the total n8umber of employee we have 
select count(id) from empl
-- 21. find avg salary of employee
select avg(salary) from empl

update empl set location ='USA' where location is null

