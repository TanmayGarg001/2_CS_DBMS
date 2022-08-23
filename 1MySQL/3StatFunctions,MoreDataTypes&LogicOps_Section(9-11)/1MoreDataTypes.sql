#MORE DATA-TYPES (SEC-10)
##########################################
create table dogs
(
    name  char(5),
    breed varchar(10),
    price decimal(6, 3),
    age   float
);

insert into dogs
values ('Timmy', 'German Shepherd', 348.4481, 7.0002);#Gives error/warning depending on IDE/Version of MySQL coz of more chars and more digits then mentioned in decimal
insert into dogs
values ('Rocky', 'Pitbull', 658.525, 3.44);
insert into dogs
values ('Bob', 'Pug', 152.11, 8.84849513544786);
insert into dogs
values ('Price Tom', 'Sausage', 200.00, 5.44);#Gives error/warning depending on IDE/Version of MySQL

select *
from dogs;

select char_length(name)
from dogs;

drop table dogs;
##########################################
create table people
(
    name      varchar(15),
    birthdate date,
    birthtime time,
    birthDT   datetime,
    salary    double
);

insert into people
values ('Tanmay', '2001-04-10', '01:00:00', '2001-04-10 01:00:00', 80000000.50005);
insert into people
values ('Timmy', '2004-08-17', '23:59:50', '2004-08-17 23:59:50', 950000.45950);
insert into people
values ('Leona', curdate(), curtime(), now(), 55000.580);

select *
from people;

select now();

select name,
       birthDT,
       day(birthdate),
       dayname(birthDT),
       month(birthDT),
       monthname(birthDT),
       hour(birthtime)
from people;

select concat(name, ' was born on ', date_format(birthDT, '%D %M %y at: '), date_format(birthDT, '%h %i %s %p'))
from people;

select datediff(now(), birthDT)
from people;
##########################################
#DATA-TYPE CHALLENGE (SEC-10)

#Q1: What's a good use for CHAR?
#soln: When we know that we req. fixed length and memory optimization.

#if number is less than equal to 7 digits we use float more we use double. Best is to use decimal for high accuracies at cost of speed.

#Q2: Diff bw datetime/TimeStamp?
#soln: Both pretty similar but timeStamp uses less memory and has a very limited range compared to datetime.

select curtime();
select curdate();
select date_format(curdate(), '%w , %W');#Current day of the week in number and text
select date_format(now(), '%m/%d/%y');
select date_format(now(), '%M %D %T');

create table tweets
(
    content        varchar(150),
    username       varchar(25),
    timeOfCreation timestamp default now()
);
##########################################