-- SQL is Structured Query Language and we are goinf to use MySQL is RDBMS, it helps us to do that.
-- BASIC AND MAJORLY USED DATATYPES IN SQL
-- INT          -- WHOLE NUMBERS
-- DECIMAL(M,N) -- DECIMAL NUMBERS ; (M,N)-NO. OF TOTAL DIGITS AND NUMBERS AFTER DECIMAL RESP.
-- VARCHAR(L)   -- STRING OF TEXT LENGTH L
-- BLOB         -- BINARY LARGE ONJECT, STORES LARGE DATA
-- DATE         -- 'YYYY-MM-DD'
-- TIMESTAMP    -- 'YYYY-MM-DD HH:MM:SS' - USED FOR RECORDING PURPOSES

-- NOTE : If any command is different for OracleSQL will be denoted by --!!

----Creating Tables----
--primary key is notNull,unique and irreducible 
--customer name can't be null
--unique interest will check if the value entered is unique 
--autoIncrement will increase keep increasing ID itself instead of hard-coding
--!!autoIncrement does not work for Oracle

CREATE TABLE customer(
customerId INT PRIMARY KEY AUTO_INCREMENT,
customerName varchar(20) NOT NULL,        
customerInterest varchar(20) UNIQUE        
);

CREATE TABLE student(
studentId INT DEFAULT(15),
studentName varchar(20),
studentMajor varchar(20) DEFAULT('NEWBIE'),
PRIMARY KEY(studentId)
);

----Showing details related to tables, dropping tables, altering tables----
DESCRIBE customer;
DESCRIBE student;

DROP TABLE customer;
DROP TABLE student;

ALTER TABLE student ADD studentCGPA DECIMAL(3,2);
ALTER TABLE customer DROP COLUMN customerId;

----Inseting data into tables----
INSERT INTO student VALUES(101,'Timmy','Maths');
INSERT INTO student VALUES(102,'TimmySavage','Physics');
INSERT INTO student (studentId,studentName) VALUES(108,'Jack');
INSERT INTO student VALUES(103,'Sarah','Mechanics');
INSERT INTO student(studentId,studentName) VALUES(104,'Alby'); 
INSERT INTO student(studentName) VALUES('Sam'); 
--This will give error if default is not there in primary key, bcoz primary key is NOT NULL

SELECT *FROM student;

INSERT INTO customer(customerName,customerInterest) VALUES("Abigail","Chess");
INSERT INTO customer(customerName,customerInterest) VALUES("Randy","Golf");
INSERT INTO customer(customerName,customerInterest) VALUES("Ashley","Badminton");
--Above line will five error if we don't enter Ashley's interest different from Abigail and Randy. 
INSERT INTO customer(customerName,customerInterest) VALUES("Timmy","Music");
INSERT INTO customer(customerName) VALUES("Yasmin");
INSERT INTO customer(customerName) VALUES("A"),("B");

SELECT *FROM customer;
