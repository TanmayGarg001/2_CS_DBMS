CREATE TABLE SalesPeople(
 Snum INT PRIMARY KEY,
 Sname VARCHAR(20) UNIQUE,
 City VARCHAR(20),
 Comm DEC(2,2)
);

INSERT INTO SalesPeople VALUES(1001,'Peel','London',.12);
INSERT INTO SalesPeople VALUES(1002,'Serres','Sanjose',.13);
INSERT INTO SalesPeople VALUES(1004,'Motika','Landon',.11);
INSERT INTO SalesPeople VALUES(1007,'Rifkin','Barcelona',.15);
INSERT INTO SalesPeople VALUES(1003,'Axelrod','Newyork',.10);

SELECT *FROM SalesPeople;

CREATE TABLE Customers(
 Cnum INT PRIMARY KEY,
 Cname VARCHAR(20),
 City VARCHAR(25) NOT NULL,
 Grade INT,
 Snum INT,
 FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum) 
);

INSERT INTO Customers VALUES (2001, 'Hoffman', 'London', 100, 1001);
INSERT INTO Customers VALUES (2002, 'Giovanni', 'Rome', 200, 1003);
INSERT INTO Customers VALUES (2003, 'Liu', 'Sanjose', 200, 1002);
INSERT INTO Customers VALUES (2004, 'Grass', 'Berlin', 300, 1002);
INSERT INTO Customers VALUES (2006, 'Clemens', 'London', 300, 1001);
INSERT INTO Customers VALUES (2008, 'Cisneros', 'Sanjose', 100, 1007);
INSERT INTO Customers VALUES (2007, 'Pereira', 'Rome', null, 1004);

SELECT *FROM Customers; 

CREATE TABLE Orders(
Onum INT PRIMARY KEY,
Amt DEC(6,2),
Odate DATE,
Cnum INT,
Snum INT
);
ALTER TABLE Orders ADD FOREIGN KEY (Cnum) REFERENCES Customers(Cnum); 
ALTER TABLE Orders ADD FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum);

INSERT INTO Orders VALUES (3001,18.69,to_date('03-10-1990','DD-MM-YYYY'),2008,1007);
INSERT INTO Orders VALUES (3003,767.19,to_date('03-10-1990','DD-MM-YYYY'),2001,1001);
INSERT INTO Orders VALUES (3002,1900.10,to_date('03-10-1990','DD-MM-YYYY'),2007,1004);
INSERT INTO Orders VALUES (3005,5160.45,to_date('03-10-1990','DD-MM-YYYY'),2003,1002);
INSERT INTO Orders VALUES (3006,1098.16,to_date('03-10-1990','DD-MM-YYYY'),2008,1007);
INSERT INTO Orders VALUES (3009,1713.23,to_date('04-10-1990','DD-MM-YYYY'),2002,1003);
INSERT INTO Orders VALUES (3007,75.75,to_date('04-10-1990','DD-MM-YYYY'), 2004,1002);
INSERT INTO Orders VALUES (3008,4273.00,to_date('05-10-1990','DD-MM-YYYY'),2006,1001);
INSERT INTO Orders VALUES (3010,1309.95,to_date('06-10-1990','DD-MM-YYYY'),2004,1002);
INSERT INTO Orders VALUES (3011,9891.88,to_date('06-10-1990','DD-MM-YYYY'),2006,1001);

SELECT *FROM Orders; 

SELECT COUNT(Sname) FROM SalesPeople WHERE Sname LIKE 'a%' OR Sname LIKE 'A%';

SELECT COUNT(Snum) FROM SalesPeople WHERE City = 'Newyork';

SELECT COUNT(Snum) FROM SalesPeople WHERE City = 'Landon' OR City='Paris';

SELECT COUNT(Odate),Odate FROM Orders GROUP BY Odate;

SELECT DISTINCT Sname FROM SalesPeople;
SELECT DISTINCT COUNT(Sname) FROM SalesPeople;

SELECT SUM(Amt),Snum FROM Orders WHERE Amt>2000 GROUP BY Snum;


SELECT * FROM (
 (SELECT Snum, Odate FROM Orders) NATURAL JOIN (SELECT Snum, COUNT (*) FROM Orders GROUP BY Snum)
) ORDER BY Snum;

SELECT MIN(Cname) FROM Customers WHERE Cname LIKE 'G%';

SELECT MAX(Amt),Snum FROM Orders WHERE Snum=1002 OR Snum=1007 GROUP BY Snum;

SELECT MAX(Amt),Odate FROM Orders WHERE Amt>3000 GROUP BY Odate ORDER BY Odate ASC;

SELECT COUNT(Snum),City,Comm FROM SalesPeople GROUP BY City,Comm;

SELECT SUM(Amt) FROM Orders;

SELECT AVG(Amt) FROM Orders;

SELECT COUNT(Grade) FROM Customers; 

SELECT MAX(Grade),City FROM Customers GROUP BY City;

SELECT MAX(Amt),Cnum FROM Orders GROUP BY Cnum ORDER BY Cnum ASC;

SELECT MAX(Amt),Odate FROM Orders GROUP BY Odate ORDER BY Odate ASC;

SELECT MAX(Amt),Snum FROM Orders WHERE Odate=to_date('04-10-1990','DD-MM_YYYY') GROUP BY Snum ORDER BY Odate ASC;

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

SELECT O.Onum, C.Cname, C.City, O.Amt FROM Customers C
INNER JOIN Orders O ON O.Cnum = C.Cnum
WHERE O.Amt >= 500 AND O.Amt <= 2000
ORDER BY O.Onum;

SELECT C.Cname, C.City, S.Sname FROM Customers C
INNER JOIN SalesPeople S ON C.Snum = S.Snum
WHERE S.Comm >= 0.12;

SELECT C.Cname, C.City "Customer City", S.Sname, S.city "Salesman City", S.Comm FROM Customers C
INNER JOIN SalesPeople S ON C.Snum = S.Snum
WHERE C.City != S.City AND S.Comm >= 0.12;

SELECT Sname FROM SalesPeople WHERE Snum IN (SELECT Snum FROM Customers WHERE grade > 100);

SELECT Sname, City FROM SalesPeople WHERE Snum IN (SELECT Snum FROM Orders GROUP BY Snum HAVING SUM(Amt) >= 2000);

SELECT Cname, City FROM Customers WHERE Cnum NOT IN (SELECT DISTINCT Cnum FROM Orders);

SELECT Sname FROM SalesPeople WHERE City IN (SELECT DISTINCT City FROM Customers);

SELECT S.Sname, C.Cname FROM SalesPeople S INNER JOIN Customers C ON S.City = C.City;

SELECT S.Sname, C.Cname FROM SalesPeople S RIGHT OUTER JOIN Customers C ON S.Snum = C.Snum;

SELECT Cname FROM Customers C WHERE Snum IS NULL;

SELECT S.Sname, SubQuery.HighestOrder FROM SalesPeople S
INNER JOIN (SELECT Snum, MAX(Amt) HighestOrder FROM Orders GROUP BY Snum) SubQuery
ON S.Snum = SubQuery.Snum;

SELECT Snum, Amt FROM Orders O WHERE Amt > (SELECT AVG(Amt) FROM Orders WHERE Snum = O.Snum) ORDER BY Snum;

SELECT *FROM SalesPeople S WHERE Snum = (SELECT Snum FROM Customers WHERE Snum = S.Snum GROUP BY Snum HAVING COUNT(Snum) >= 2);

