----Basic operations----
CREATE TABLE employee(
    employeeId INT PRIMARY KEY AUTO_INCREMENT,
    employeePos varchar(25) NOT NULL,
    employeeSalary INT,
    employeeRating INT
);

INSERT INTO employee(employeePos,employeeSalary,employeeRating) VALUES("SDE",100000,4);
INSERT INTO employee(employeePos,employeeSalary,employeeRating) VALUES("Manager",120000,5);
INSERT INTO employee(employeePos,employeeSalary,employeeRating) VALUES("Intern",50000,4);
INSERT INTO employee(employeePos,employeeSalary,employeeRating) VALUES("Watchman",20000,5);
INSERT INTO employee VALUES(55,"Watchman",20000,5);
INSERT INTO employee VALUES(58,"Guard",25000,5);
INSERT INTO employee(employeePos,employeeSalary,employeeRating) VALUES("SDE-2",175000,5);
INSERT INTO employee(employeePos,employeeSalary,employeeRating) VALUES('SED-3',225000,5);
--!!varchar can be written in "" or '' prefer to use single quote coz oracle uses that only.
----* after select means that to select every column in that table(similar to java)----
SELECT *FROM employee;
DROP TABLE employee;

----Conditions and updates/deletions----
SELECT *FROM employee WHERE employeeSalary>=50000;

UPDATE employee SET employeeRating=3 WHERE employeeRating=4;
UPDATE employee SET employeePos="SDE-3",employeeSalary=225000 WHERE employeePos='SDE-2';
UPDATE employee SET employeeRating=5;
SELECT *FROM employee;
DELETE FROM employee WHERE employeePos='Intern';
ALTER TABLE employee DROP COLUMN employeeRating;

SELECT *FROM employee WHERE employeeSalary>=50000 OR employeeSalary<=20000;
SELECT employeeId,employee.employeePos FROM employee;
--orders in ascending order by default
SELECT employeeId,employeeSalary,employeePos FROM employee ORDER BY employeeSalary;
SELECT employeeId,employeeSalary,employeePos FROM employee ORDER BY employeeSalary DESC;
--here it will order first by employeePos and then by employeeId
SELECT employeeId,employeeSalary,employeePos FROM employee ORDER BY employeePos,employeeId ASC;

--!!limits the output to 3 columns, does not work for Oracle
SELECT employeeId,employeeSalary,employeePos FROM employee ORDER BY employeePos,employeeId ASC LIMIT 3;
--comparisons are OR  AND  >  <  =  >=  <=   <>/!=
SELECT *FROM employee WHERE employeeSalary<>225000;
SELECT *FROM employee WHERE employeeSalary!=225000 AND employeeId<=4;

