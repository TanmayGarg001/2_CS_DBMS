create table customerTable(
	customerName varchar(15),
	customerStreet varchar(15),
	customerCity varchar(15),
);

create table branchTable(
branchName varchar(15),
branchCity varchar(15),
assets int,
);

create table accountTable(
accountNumber int,
branchName varchar(15),
balance int,
dateA date,
);

create table loanTable(
loanNumber int,
loan int,
branchName varchar(16),
amount int,
);

create table customerName(
customerName varchar(15),
accountNumber int,
);

create table borrowerTable(
customerName varchar(15),
loanNumber int,
);





create table Persons(
Id int not null,
First_Name varchar(200) not null,
Last_Name varchar(200) not null,
Addresses varchar(200) not null,
City varchar(200)
);
select*from Persons;

alter table Persons
add Age int;

alter table Persons
drop column City;

create table Employee(
Emp_Id int,
Emp_Name varchar(20) not null,
Designation varchar(20) not null,
Salary int
Primary Key(Emp_Id)
);

alter table Employee
add Age char(3);

alter table Employee
alter column Age int;

alter table Persons
drop column City;

alter table Persons
alter column id int not null;
alter table Persons
add primary key(Id);
alter table Persons
alter column First_Name varchar(20) not null;
alter table Persons
alter column Last_Name varchar(20) not null;
alter table Persons
add unique(Addresses);

alter table Persons
add constraint df_City
default 'Patiala' for City 

insert into Persons
values(5,'abcde','abcd','abc','');

alter table Employee
add check(Age>=20);

select*from Persons;


drop table Persons;
drop table Employee;