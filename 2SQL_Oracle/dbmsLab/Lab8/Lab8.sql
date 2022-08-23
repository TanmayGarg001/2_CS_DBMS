SELECT CHR(84) FROM dual;

SELECT concat('Tanmay','Garg') FROM dual;

SELECT instr('Timmy','mmy') FROM dual;

SELECT length('Tanmay') FROM dual; 

SELECT lpad('Tanmay', 10, '#') FROM dual;   

SELECT ltrim('Tanmay', 'Tan') FROM dual;

SELECT rpad('Tanmay', 8, '#') FROM dual;

SELECT rtrim('Tanmay', 'may') FROM dual;

SELECT replace('Random Text', 'Random', 'Some') FROM dual;

SELECT substr('Tanmay', 1, 4) FROM dual;

SELECT initcap('thapar institute of engineering and technology') FROM dual;

SELECT lower('TANmaY') FROM dual;

SELECT upper('TaNmAy') FROM dual;

SELECT translate('Tanmsy', 's', 'a') FROM dual;

SELECT abs(-69) FROM dual;

SELECT ceil(419.68) FROM dual;

SELECT cos(0) FROM dual;

SELECT exp(3) FROM dual;

SELECT floor(55.574) FROM dual;

SELECT mod(29,5) FROM dual;

SELECT power(7,3) FROM dual;

SELECT round(62.765,1) FROM dual;

SELECT sign(-321321) FROM dual;

SELECT sqrt(1000000) FROM dual;

SELECT trunc(84.123456, 4) FROM dual;

SELECT sysdate FROM dual;

SELECT ADD_MONTHS('22-October-2021',17) FROM dual;

SELECT LAST_DAY('17-FEB-1854') FROM dual;

SELECT MONTHS_BETWEEN('12-October-2015', '1-Feb-2021') FROM dual;

SELECT NEXT_DAY('09-OCT-2021', 'friday') FROM dual;

SELECT greatest(512.5,45.44) FROM dual;

SELECT least(13,-5.48) FROM dual;

SELECT to_char(sysdate,'hh:mm:ss') FROM dual;

--Same code from previously submitted assignment-4
--but added commisions values instead of NULL
create table emp(
empno number(4) not null,
ename varchar2(12),
job varchar2(9),
joinDate date,
sal number(7,2),
comm number(7,2),
deptNo number(2));

insert into emp values
(5302,'Timmy','CEO',to_date('23-Dec-2007','DD-MON-YYYY'),8500,1520,12);
insert into emp values
(7863,'Ramsy','Guard',to_date('10-Apr-2010','DD-MON-YYYY'),2500,750,17);
insert into emp values
(2334,'Vinay','Clerk',to_date('12-Sep-2015','DD-MON-YYYY'),5000,1000,10);
insert into emp values
(1288,'Anil','Clerk',to_date('1-Sep-2021','DD-MON-YYYY'),2500,1200,10);
insert into emp values
(9852,'Krams','Guard',to_date('3-Sep-2021','DD-MON-YYYY'),1350,520,15);
insert into emp values
(2370,'Amy','SDE-I',to_date(sysdate),950,50,20);

select*from emp;

SELECT ename,sal+comm FROM emp;

ALTER TABLE emp ADD hire_date DATE;
UPDATE emp SET hire_date = '08-nov-2001' WHERE empno =5302; 
UPDATE emp SET hire_date = '01-april-1980' WHERE empno = 7863; 
UPDATE emp SET hire_date = '25-nov-2009' WHERE empno = 2334;
UPDATE emp SET hire_date = '12-aug-2015' WHERE empno = 4; 
SELECT ename,hire_date FROM emp;

SELECT ename FROM emp WHERE to_char(hire_date,'yyyy') = 2001; 

SELECT ename FROM emp WHERE to_char(hire_date,'yyyy') = to_char(sysdate,'yyyy'); 

drop table emp;


