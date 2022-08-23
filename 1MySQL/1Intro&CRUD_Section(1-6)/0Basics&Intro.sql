#BASICS (SEC-1 to 4)
###########################################
create table cats
(
    name varchar(50),
    age  int
);

insert into cats (name, age)
values ('Blue', 1);

insert into cats (name, age)
values ('Draco', 11);

insert into cats(name, age)
VALUES ('Butter', 7),
       ('Timmy', 4);

select *
from cats;
###########################################
create table people
(
    first_name varchar(20) NOT NULL,
    last_name  varchar(20)          DEFAULT 'No_LastName',
    age        int         NOT NULL DEFAULT -1
);

insert into people(first_name, last_name, age)
values ('Linda', 'Belcher', 45),
       ('Phillip', 'Frond', 38),
       ('Calvin', 'Fischoeder', 70);

insert into people(first_name)
values ('Sam');

insert into people(first_name)
values ('');

select*
from people;

describe people;
show tables;
drop table people;

show warnings;
###########################################
create table students
(
    cat_id INT AUTO_INCREMENT,
    name   varchar(15),
    batch  varchar(10),
    cgpa   float,
    PRIMARY KEY (cat_id)
);
describe students;
###########################################
#CHALLENGE (SEC-4)
create table employees
(
    id             int AUTO_INCREMENT PRIMARY KEY,
    last_name      varchar(255) NOT NULL,
    first_name     varchar(255) NOT NULL,
    middle_name    varchar(255),
    age            int          NOT NULL,
    current_status varchar(255) NOT NULL DEFAULT 'Employed'
);
INSERT INTO employees(last_name, first_name, age)
VALUES ('Garg', 'Tanmay', 21);

select *
from employees;

describe employees;
drop table employees;
###########################################