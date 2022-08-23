create table dept(
deptno int,
dname varchar(15),
constraint deptKey primary key(deptno),
constraint checkDept check(dname='Acc' or dname='comp' or dname='elect' )
);
drop table dept;
select*from user_cons_columns
where table_name = 'dept';

create table emp(
empno int,
ename varchar(15),
designation varchar(15),
sal number not null,
deptno int,
constraint empKey primary key(empno),
constraint fkeyDept foreign key (deptno) references dept(deptno),
constraint checkDesig check(designation='Prof' or designation='AP' or designation='Lect'),
constraint uniqueEname unique(ename)
);
drop table emp;
select*from user_cons_columns
where table_name = 'emp';

create table S(
sno int primary key,
sname varchar(15),
city varchar(15)
);

create table P(
pno int primary key,
pname varchar(15),
color varchar(15)
);

create table J(
jno int primary key,
jname varchar(15),
city varchar(15)
);

create table SPJ(
qty int,
sno int,
pno int,
jno int,
constraint sKey foreign key(sno) references S(sno),
constraint pKey foreign key(pno) references P(pno),
constraint jKey foreign key(jno) references J(jno)
);
-- 
-- 
-- 
insert into dept values
(1,'Acc');
insert into dept values
(2,'comp');
insert into dept values
(3,'elect');
select*from dept;

insert into emp values
(100,'Tim','Lect',200000,2);
insert into emp values
(110,'Sam','AP',150000,1);
insert into emp values
(132,'Danny','AP',125000,1);
insert into emp values
(111,'Biggie','Lect',200000,2);
insert into emp values
(155,'Josh','Prof',250000,3);
select*from emp;

insert into S values
(1,'Raj','Patiala');
insert into S values
(2,'Sasha','Delhi');
insert into S values
(3,'Eric','Hyderabad');
select*from S;

insert into P values
(4,'Ethan','Chandigarh');
insert into P values
(5,'Harry','Kanpur');
insert into P values
(6,'Kenny','Chennai');
select*from P;

insert into J values
(7,'Sandra','Rajpura');
insert into J values
(8,'Alex','Bangalore');
insert into J values
(9,'Boppie','Dispur');
select*from J;

insert into SPJ values
(4500,3,4,8);
insert into SPJ values
(3250,1,5,7);
insert into SPJ values
(2300,2,6,9);
select*from SPJ;
-- 
-- 
-- 
desc dept;
desc emp;
desc S;
desc P;
desc J;
desc SPJ;
-- 
-- 
-- 
-- select*from user_cons_columns //equivalent to all the single instructions does the same thing anyways
select*from user_constraints
where table_name = 'DEPT';
select*from user_cons_columns
where table_name = 'EMP';
select*from user_cons_columns
where table_name = 'S';
select*from user_cons_columns
where table_name = 'P';
select*from user_cons_columns
where table_name = 'J';
select*from user_cons_columns
where table_name = 'SPJ';
-- 
-- 
-- 
alter table emp
drop constraint empKey;

alter table emp
drop constraint fkeyDept;

alter table emp
add constraint fkeyDept foreign key(deptno) references dept(deptno);

truncate table emp
alter table emp
modify ename int;

desc emp;

alter table dept
modify dname varchar(40);

desc dept;

alter table emp
add comm int;

alter table J
drop column city;

create table dupEmp as
select*from emp;

desc dupEmp;

create table dupDept(dno,dame) as 
select*from dept;

desc dupDept;

update emp
set ename='Rajul',designation='AP'
where empno=100;
select*from emp;

alter table emp
drop constraint fkeyDept;

alter table emp
add constraint fkeyDept foreign key(deptno) references dept(deptno) on delete set null;

delete from dept
where dname='comp';

select*from dept;

drop table dept cascade constraints;
drop table dupEmp;
