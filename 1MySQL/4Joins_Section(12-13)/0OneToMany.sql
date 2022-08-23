#ONE TO MANY (SEC-12)
####################################################
CREATE TABLE customers
(
    c_id       INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name  VARCHAR(100),
    email      VARCHAR(100)
);

CREATE TABLE orders
(
    o_id        INT AUTO_INCREMENT PRIMARY KEY,
    order_date  DATE,
    amount      DECIMAL(8, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (c_id)#Here add on delete cascade for easier deletion
);

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

#This will give error as no customer_id of 98 exists in the Customer Table to which orders table is referencing to.
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/06/06', 33.67, 98);

select *
from customers;

select *
from orders;
####################################################
#CROSS-JOIN
select *
from customers,
     orders;

#INNER JOIN (IMPLICIT)
select first_name, last_name, order_date, amount
from customers,
     orders
where c_id = customer_id;

#INNER JOIN (EXPLICIT)
select first_name, last_name, order_date, amount
from customers
         inner join orders on customers.c_id = orders.customer_id;

select first_name, last_name, sum(amount)
from customers
         inner join orders on customers.c_id = orders.customer_id
group by orders.customer_id
order by sum(amount);

#LEFT JOIN
select first_name, last_name, order_date, amount
from customers
         left join orders on customers.c_id = orders.customer_id;

select first_name, last_name, ifnull(sum(amount), 0) as total_amount
from customers
         left join orders on customers.c_id = orders.customer_id
group by customers.c_id
order by total_amount desc;

#RIGHT JOIN
select *
from customers
         right join orders on customers.c_id = orders.customer_id;

#Won't happen coz of foreign key: can be resolved by dropping the order table first i.t. the dependent table first or use ON DELETE CASCADE whilst creating FOREIGN KEY
# delete
# from customers
# where first_name = 'Boy';

select first_name, last_name, ifnull(sum(amount), 0) as total_amount
from customers
         right join orders on customers.c_id = orders.customer_id
group by customers.c_id
order by total_amount desc;
####################################################
#ONE TO MANY CHALLENGE (SEC-12)
create table students
(
    id         int auto_increment,
    first_name varchar(25),
    primary key (id)
);
create table papers
(
    title      varchar(50),
    grade      int,
    student_id int,
    foreign key (student_id) references students (id)
);

insert into students (first_name)
values ('Caleb'),
       ('Samantha'),
       ('Raj'),
       ('Carlos'),
       ('Lisa');

insert into papers (student_id, title, grade)
values (1, 'My First Book Report', 60),
       (1, 'My Second Book Report', 75),
       (2, 'Russian Lit Through The Ages', 94),
       (2, 'De Montaigne and The Art of The Essay', 98),
       (4, 'Borges and Magical Realism', 89);

select *
from papers;

select first_name, title, grade
from students
         inner join papers on students.id = papers.student_id
order by grade desc;

select first_name, title, grade
from students
         left join papers on students.id = papers.student_id;

select first_name, ifnull(title, 'MISSING'), ifnull(grade, 0)
from students
         left join papers on students.id = papers.student_id;

select first_name, ifnull(avg(grade), 0) as average
from students
         left join papers on students.id = papers.student_id
group by students.id
order by average desc;

select first_name,
       ifnull(avg(grade), 0)                      as average,
       IF(avg(grade) >= 75, 'PASSING', 'FAILING') as passing_status
from students
         left join papers on students.id = papers.student_id
group by students.id
order by average desc;
####################################################