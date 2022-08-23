create database School;
use School;

create table Tanmay101915001(
Rno int,
Name varchar(30),
DOB date,
Gender varchar(10),
Class varchar(5),
College varchar(40),
City varchar(15),
Marks int,
);

insert into Tanmay101915001
values
(1,'Paul','2001-05-25','Male','ENC 3','TIET','Patiala',40),
(2,'Rahul','2001-09-15','Male','COE 5','TIET','Surat',25),
(3,'Seema','2001-07-02','Female','CHE 7','TIET','Delhi',90),
(5,'Vaibhav','2001-01-20','Male','ME 4','TIET','Amritsar',10),
(9,'Debra','2002-12-25','Female','CIV 2','TIET','Patiala',69);

select *from Tanmay101915001/*displays the enire table*/
select *from Tanmay101915001 where City='Patiala'/*displays the enire data of the row where city = patiala*/
exec sp_columns Tanmay101915001/*describes the detail structure of provided table*/

truncate table Tanmay101915001/*Clears the provided table*/
drop table Tanmay101915001/*Deletes the preovided table*/

select Rno,Name,Class 
from Tanmay101915001 where City='Patiala'

select *from Tanmay101915001
order by Marks asc;/*desc for descending order*/
/*order by City,Marks asc = this will sort fist on the basis of City then following parameters*/

update Tanmay101915001
set Marks=89
where Rno = 5;

update Tanmay101915001
set Name = 'Ash',City='Mumbai'
where Rno = 9;

delete from Tanmay101915001
where City = 'Amritsar'

delete from Tanmay101915001
where Marks<30;


create table emp(
empno int,
ename varchar(20),
job varchar(20),
sal int,
deptno int
);

select *from emp;
insert into emp values
(12,'Arman','CEO',250000,1),
(10,'Sage','SDE',250000,10),
(10,'Milo','SDE',NULL,20),
(10,'Zucc','SDE',1500,30),
(13,'Chard','Guard',2500,30),
(18,'Timmy','SDE',250000,10),
(2,'Abhishek','Clerk',250000,7),
(1,'Vinay','Guard',250000,5),
(1,'Sam','Salesman',50000,7),
(102,'Anil','Intern',250000,3);

truncate table emp/*Clears the provided table*/
select empno,ename from emp
where deptno=10;

select ename from emp
where sal>2000;

select ename,sal from emp 
where job in('Salesman','Clerk');

select ename from emp
where sal between 2000 and 3000;

select *from emp
where deptno in (10,20,30);


select *from emp
where sal is NULL;

select deptno,sal from emp 
order by deptno asc,sal desc; 

select ename from emp 
where ename	like 'C%' or ename	like 'c%'


select ename from emp 
where ename	like '%C' or ename	like '%c'


select *from emp
select ename from emp 
where ename	like 'A%a%' or ename like '%a%a'

select ename from emp 
where ename	like '_b%' or ename like '_B%'

select ename from emp 
where ename	like 'A%a'