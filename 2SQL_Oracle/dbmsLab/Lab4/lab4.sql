select sysdate from dual;
select to_char(sysdate,'day') as day from dual;
select to_char(sysdate,'MM') as month,to_char(sysdate,'Year') as year from dual;
select to_char(sysdate,'day month ddth year') as spellCurrentDate from dual;
select to_char(sysdate,'am') as timeZone from dual;
select next_day(sysdate,'friday') from dual;
select round(sysdate,'month') from dual;
select trunc(sysdate,'month') from dual;
select round(sysdate,'year') from dual;
select trunc(sysdate,'year') from dual;
select sysdate+3 from dual;

create table emp(
empno number(4) not null,
ename varchar2(12),
job varchar2(9),
joinDate date,
sal number(7,2),
comm number(7,2),
deptNo number(2));

insert into emp values
(5302,'Timmy','CEO',to_date('23-Dec-2007','DD-MON-YYYY'),8500,NULL,12);
insert into emp values
(7863,'Ramsy','Guard',to_date('10-Apr-2010','DD-MON-YYYY'),2500,NULL,17);
insert into emp values
(2334,'Vinay','Clerk',to_date('12-Sep-2015','DD-MON-YYYY'),5000,NULL,10);
insert into emp values
(1288,'Anil','Clerk',to_date('1-Sep-2021','DD-MON-YYYY'),2500,NULL,10);
insert into emp values
(9852,'Krams','Guard',to_date('3-Sep-2021','DD-MON-YYYY'),1350,NULL,15);
insert into emp values
(2370,'Amy','SDE-I',to_date(sysdate),950,NULL,20);

drop table emp;
select*from emp;

select to_char(joinDate,'Day') as Day from dual;
select ename,joinDate from emp;
select ename from emp where to_char(joinDate,'day')='monday';
select ename from emp where to_char(joinDate,'MM')='09';
select ename from emp where joinDate between sysdate-30 and sysdate;

create table train(
tno number(10),
dod date,
tod timestamp,
too timestamp);

insert into train values
(1,'20-mar-21','20-mar-21 11:00:00AM','20-mar-21 12:45:00');
insert into train values
(2,'11-sep-21','11-sep-21 01:00:00PM','11-sep-21 04:15:00PM');
insert into train values
(3,'12-sep-21','12-sep-21 08:30:00AM','12-sep-21 09:25:00PM');
insert into train values
(4,'13-sep-21','13-sep-21 01:00:00PM','14-sep-21 01:45:00PM');
insert into train values
(5,'14-sep-21','14-sep-21 10:00:00AM','14-sep-21 11:30:00AM');

select*from train;

select tod,too from train;
select*from train where to_char(too,'pm')='pm';

select tno from train where to_char(tod,'HH:MM:SS') between
to_char(sysdate,'HH:MM:SS') and to_char(sysdate+0.041,'HH:MM:SS');

