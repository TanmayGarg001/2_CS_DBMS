--find any client that works in a LLC
--% is used to denote any number of characters, _ is used to denote one character
SELECT *FROM clientT WHERE client_name LIKE '%LLC';
SELECT *FROM employee WHERE sex LIKE 'M';
SELECT *FROM employee WHERE birth_date LIKE '____-02%'
SELECT *FROM clientT WHERE client_name LIKE '%scho%';

--Union is used when we need to combine multiple select statements into one
SELECT first_name FROM employee;
SELECT branch_name FROM branch;
--let's combine them! 
--Note we can combine columns with same count only i.e. 1 column must be combined with 1 and 2 with 2 ,so on..
--Also they need to be of same dataType (not necessary but preffered)
SELECT first_name FROM employee UNION
SELECT branch_name FROM branch; 
--we can keep doinf this any number of times.
SELECT salary AS boom FROM employee UNION
SELECT branch_name FROM branch; 

--Find a list of all clients & branch suppliers name
SELECT supplier_name,branch_id AS myList FROM branch_supplier UNION 
SELECT client_name,clientT.branch_id FROM clientT;

--Joins