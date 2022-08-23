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
