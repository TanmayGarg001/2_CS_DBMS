--See the image to check the DB schema for company. Dropped all the tables.

--A foreign key with "set null on delete" means that if a record in the parent table is deleted, 
--then the corresponding records in the child table will have the foreign key fields set to NULL.

--Cascade : When we create a foreign key using this option, it deletes the referencing rows in the child 
--table when the referenced row is deleted in the parent table which has a primary key.

----EMPLOYEE TABLE----
CREATE TABLE employee(
    emp_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(40),
    last_name Varchar(40),
    birth_date DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);
DROP TABLE employee;
DESCRIBE employee;
-----------------------

----BRANCH TABLE-------
CREATE TABLE branch(
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY (mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);
DROP TABLE branch;
DESCRIBE branch;
-----------------------

ALTER TABLE employee 
ADD FOREIGN KEY (branch_id)
REFERENCES branch(branch_id) ON DELETE SET NULL;

ALTER TABLE employee ADD FOREIGN KEY (super_id) REFERENCES employee(emp_id) ON DELETE SET NULL;

----CLIENT TABLE-------
CREATE TABLE clientT(
    client_id INT PRIMARY KEY,
    client_name varchar(40),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);
DROP TABLE clientT;
DESCRIBE clientT;
-----------------------

---WORKS_WITH TABLE----
CREATE TABLE works_with(
    emp_id INT,
    client_id INT, 
    total_sales INT,
    PRIMARY KEY(emp_id,client_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES clientT(client_id)
);
DROP TABLE works_with;
DESCRIBE works_with;
-----------------------

--BRANCH SUPPLIER TABLE-
CREATE TABLE branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id,supplier_name),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);
DROP TABLE branch_supplier;
DESCRIBE branch_supplier;
-----------------------

SELECT *FROM employee;
SELECT *FROM branch;
SELECT *FROM clientT;
SELECT *FROM works_with;
SELECT *FROM branch_supplier;

-----------------------
--inserting data into the tables--
--branch id is null here coz we can't reference brach_id as we haven't created branch table yet.
INSERT INTO employee VALUES(100,'David','Wallace','1967-11-17','M',250000,NULL,NULL);
INSERT INTO branch VALUES(1,'Corporate',100,'2006-02-09');
UPDATE employee SET branch_id=1 WHERE emp_id=100;
INSERT INTO employee VALUES(101,'Jan','Levinson','1961-05-11','F',110000,100,1);

INSERT INTO employee VALUES (102,'Michael','Scott','1964-03-15','M',75000,100,NULL);
INSERT INTO branch VALUES(2,'Scranton',102,'1992-04-06');
UPDATE employee SET branch_id=2 WHERE emp_id=102;
INSERT INTO employee VALUES(103,'Angela','Martin','1971-06-25','F',63000,102,2);
INSERT INTO employee VALUES(104,'Kelly','Kapoor','1980-08-05','F',55000,102,2);
INSERT INTO employee VALUES(105,'Stanley','Hudson','1958-02-19','M',69000,102,2);

INSERT INTO employee VALUES(106,'Josh','Porter','1969-09-05','M',78000,100,NULL);
INSERT INTO branch VALUES(3,'Stamford',106,'1998-02-13');
UPDATE employee SET branch_id=3 WHERE emp_id=106;
INSERT INTO employee VALUES(107,'Andy','Bernard','1973-07-22','M',65000,106,3);
INSERT INTO employee VALUES(108,'Jim','Halpert','1978-10-01','M',71000,106,3);

UPDATE employee SET birth_date='1980-02-05' WHERE emp_id=104;

INSERT INTO clientT VALUES(400,'Dunmore Highschool',2);
INSERT INTO clientT VALUES(401,'Lackawana Country',2);
INSERT INTO clientT VALUES(402,'FedEx',3);
INSERT INTO clientT VALUES(403,'John Daly Law,LLC',3);
INSERT INTO clientT VALUES(404,'Scranton Whitepages',2);
INSERT INTO clientT VALUES(405,'Times Newspaper',3);
INSERT INTO clientT VALUES(406,'FedEx',2);

INSERT INTO works_with VALUES(105,400,55000);
INSERT INTO works_with VALUES(102,401,267000);
INSERT INTO works_with VALUES(108,402,22500);
INSERT INTO works_with VALUES(107,403,5000);
INSERT INTO works_with VALUES(108,403,12000);
INSERT INTO works_with VALUES(105,404,33000);
INSERT INTO works_with VALUES(107,405,26000);
INSERT INTO works_with VALUES(102,406,15000);
INSERT INTO works_with VALUES(105,406,130000);

INSERT INTO branch_supplier VALUES(2,'Hammer Mill','Paper');
INSERT INTO branch_supplier VALUES(2,'Uni Ball','Writing Utensils');
INSERT INTO branch_supplier VALUES(3,'Patriot Paper','Paper');
INSERT INTO branch_supplier VALUES(2,'J.T. Forms & Labels','Custom Forms');
INSERT INTO branch_supplier VALUES(3,'Uni-Ball','Writing Utensils');
INSERT INTO branch_supplier VALUES(3,'Hammer Mill','Paper');
INSERT INTO branch_supplier VALUES(3,'Stamford Labels','Customer Forms');
-----------------------

-----------------------
SELECT *FROM employee ORDER BY sex,first_name,last_name;

--get all the first and last names of employees and name the column heading as provided.
SELECT first_name AS forename, last_name AS surname FROM employee;
--get the distinct values from the column
SELECT DISTINCT branch_id FROM employee;

--gives the count of non-null entries in the required column
SELECT COUNT(emp_id) FROM employee;
SELECT COUNT(super_id) FROM employee;
SELECT COUNT(super_id) FROM employee WHERE sex='F' AND birth_date>'1970-01-01';

--finding average and sum of the particular column
SELECT AVG(salary) FROM employee WHERE birth_date<'1965-01-01';
SELECT SUM(salary) FROM employee WHERE sex='M';
SELECT COUNT(sex) FROM employee WHERE sex='M';
SELECT COUNT(sex) FROM employee WHERE sex='F';
--in order to group them in one table
SELECT COUNT(sex),sex FROM employee GROUP BY sex;
--find the total sales of an employee
SELECT SUM(total_sales),emp_id FROM works_with GROUP BY emp_id;
-----------------------
