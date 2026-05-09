CREATE DATABASE SelectQueries; 


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Age INT,
    City VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);

DROP TABLE Employees;

INSERT INTO Employees VALUES
(101, 'Amith', 'Kumar', 'IT', 60000, 28, 'Bangalore','amith35787@gmail.com','3345678900'),
(102, 'Rahul', 'Sharma', 'HR', 35000, 32, 'Delhi','rahul52@gmail.com','6979553245'),
(103, 'Sneha', 'Iyer', 'Finance', 50000, 26, 'Chennai','sneha767@gmail.com','7986354255'),
(104, 'Arjun', 'Reddy', 'IT', 75000, 35, 'Hyderabad','arjun098@gmail.com','5323468970'),
(105, 'Neha', 'Verma', 'Sales', 42000, 24, 'Mumbai','neha767@gmail.com','7658787420'),
(106, 'Kiran', 'Patil', 'Marketing', 38000, 29, 'Pune','kiran0098@gmail.com','6098866421'),
(107, 'Ananya', 'Das', 'HR', 36000, 31, 'Kolkata','ananya674653@gmail.com','3076433479'),
(108, 'Vikram', 'Singh', 'Sales', 47000, 27, 'Delhi','vikram5434@gmail.com','6986756324'),
(109, 'Pooja', 'Nair', 'Finance', 52000, 33, 'Bangalore','pooja434@gmail.com','6965055432'),
(110, 'Rohan', 'Mehta', 'IT', 68000, 25, 'Mumbai','rohan12345@gmail.com','8543323217'),
(111, 'Amit', 'Joshi', 'Marketing', 39000, 30, 'Jaipur','amit099@gmail.com','4124467890'),
(112, 'Nisha', 'Kapoor', 'Sales', 45000, 23, 'Chandigarh','nisha3454@gmail.com','9087556424');

SELECT * FROM Employees;

SELECT * FROM Employees WHERE Department = 'IT';

SELECT * FROM Employees ORDER BY Salary DESC;

SELECT TOP 5 * FROM Employees;

SELECT FirstName, LastName FROM Employees;

SELECT FirstName, Salary FROM Employees;

SELECT EmpID, Department FROM Employees;

SELECT FirstName, LastName, City FROM Employees;

SELECT * FROM Employees WHERE Salary > 50000;

SELECT * FROM Employees WHERE Salary < 30000;

SELECT * FROM Employees WHERE Salary >= 40000;

SELECT * FROM Employees WHERE Age <= 30;

SELECT * FROM Employees WHERE Department <> 'HR';

SELECT * FROM Employees WHERE Age BETWEEN 25 AND 35;

SELECT * FROM Employees WHERE City IN ('Delhi', 'Mumbai');

SELECT * FROM Employees WHERE FirstName LIKE 'A%';

SELECT * FROM Employees WHERE Salary != 45000;

SELECT * FROM Employees WHERE Age > 25 AND Salary > 40000;

SELECT * FROM Employees WHERE Age < 30 OR Department = 'Sales';

SELECT DISTINCT Department FROM Employees;

SELECT DISTINCT City FROM Employees;

SELECT DISTINCT Department, City FROM Employees;

SELECT DISTINCT Salary FROM Employees;

SELECT * FROM Employees ORDER BY FirstName;

SELECT * FROM Employees ORDER BY Salary DESC;

SELECT FirstName, Salary FROM Employees ORDER BY Salary ASC;

SELECT * FROM Employees ORDER BY Department, Salary DESC;

SELECT * FROM Employees ORDER BY Age DESC;

SELECT TOP 3 * FROM Employees;

SELECT TOP 5 FirstName, Salary FROM Employees;

SELECT TOP 10 * FROM Employees ORDER BY Salary DESC;

SELECT TOP 2 * FROM Employees WHERE Department = 'IT';

SELECT TOP 1 * FROM Employees ORDER BY Age DESC;

SELECT DISTINCT Department FROM Employees ORDER BY Department;

SELECT TOP 5 * FROM Employees WHERE Salary > 40000 ORDER BY Salary DESC;

SELECT FirstName, LastName FROM Employees WHERE City = 'Bangalore';

SELECT TOP 3 FirstName, Salary FROM Employees ORDER BY Salary ASC;

SELECT DISTINCT City FROM Employees ORDER BY City DESC;

SELECT * FROM Employees WHERE FirstName LIKE '%n';



SELECT FirstName, Salary FROM Employees WHERE Salary BETWEEN 30000 AND 60000;

SELECT FirstName AS Name, Salary AS Income FROM Employees;

SELECT Salary AS MonthlySalary FROM Employees;

SELECT FirstName + ' ' + LastName AS FullName FROM Employees;

SELECT MAX(Salary) AS HighestSalary FROM Employees;

SELECT MIN(Salary) AS LowestSalary FROM Employees;

SELECT MAX(Age) AS OldestEmployee FROM Employees;

SELECT MIN(Age) AS YoungestEmployee FROM Employees;

SELECT AVG(Salary) AS AverageSalary FROM Employees;

SELECT AVG(Age) AS AverageAge FROM Employees;

SELECT AVG(Salary) FROM Employees WHERE Department = 'IT';

SELECT SUM(Salary) AS TotalSalary FROM Employees;

SELECT SUM(Salary) FROM Employees WHERE Department = 'Sales';

SELECT SUM(Salary) FROM Employees WHERE City = 'Delhi';

SELECT COUNT(*) AS TotalEmployees FROM Employees;

SELECT COUNT(Department) FROM Employees;

SELECT COUNT(*) FROM Employees WHERE Department = 'IT';

SELECT COUNT(DISTINCT Department) FROM Employees;

SELECT TOP 5 FirstName, Salary FROM Employees ORDER BY Salary ASC;

SELECT TOP 1 * FROM Employees ORDER BY Salary ASC;

SELECT Department, MAX(Salary) AS HighestSalary
FROM Employees
GROUP BY Department;

SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;

SELECT City, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY City;

SELECT * FROM Employees WHERE FirstName LIKE 'A%';

SELECT * FROM Employees WHERE FirstName LIKE '%a';

SELECT * FROM Employees WHERE FirstName LIKE '%mit%';

SELECT * FROM Employees WHERE FirstName LIKE '_m%';

SELECT * FROM Employees WHERE FirstName LIKE '_____';

SELECT * FROM Employees WHERE FirstName LIKE 'A%n';

SELECT * FROM Employees WHERE FirstName LIKE '[A-C]%';

SELECT * FROM Employees WHERE FirstName LIKE '[RK]%';

SELECT * FROM Employees WHERE FirstName LIKE '[^A-C]%';

SELECT * FROM Employees WHERE FirstName LIKE '% %';

SELECT * FROM Employees WHERE Department = 'IT' AND Salary > 50000;

SELECT * FROM Employees WHERE Age > 25 AND City = 'Mumbai';

SELECT FirstName, Salary FROM Employees WHERE Salary >= 40000 AND Age <= 30;

SELECT * FROM Employees WHERE Department = 'HR' OR Department = 'Sales';

SELECT * FROM Employees WHERE City = 'Delhi' OR City = 'Bangalore';

SELECT * FROM Employees WHERE Salary < 30000 OR Salary > 70000;

SELECT * FROM Employees WHERE Department = 'IT' AND (City = 'Mumbai' OR City = 'Delhi');

SELECT * FROM Employees WHERE (Age < 25 OR Age > 35) AND Salary > 40000;

SELECT * FROM Employees WHERE NOT Department = 'HR';

SELECT * FROM Employees WHERE NOT Salary > 50000;

SELECT * FROM Employees WHERE Department NOT IN ('IT', 'Sales');

SELECT * FROM Employees WHERE City IN ('Delhi', 'Mumbai', 'Pune');

SELECT * FROM Employees WHERE Department IN ('IT', 'HR');

SELECT FirstName, Salary FROM Employees WHERE Salary IN (35000, 42000, 60000);

SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 2;

SELECT City, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY City
HAVING COUNT(*) >= 2;

SELECT City, AVG(Age) AS AvgAge
FROM Employees
GROUP BY City
HAVING AVG(Age) < 30;

SELECT * FROM Employees
WHERE Phone LIKE '[6-9]%'
AND LEN(Phone) = 10
AND Phone NOT LIKE '%[^0-9]%';

SELECT *
FROM Employees
WHERE email LIKE '%@%.com';


SELECT TOP 5 *
FROM Employees
WHERE Age % 2 = 0
ORDER BY Salary DESC;





--String Functions--

SELECT FirstName, ASCII(FirstName) AS ASCII_Value
FROM Employees;
SELECT FirstName, ASCII(FirstName) AS Val FROM Employees;
SELECT LastName, ASCII(LastName) AS Val FROM Employees;
SELECT Department, ASCII(Department) AS Val FROM Employees;
SELECT City, ASCII(City) AS Val FROM Employees;
SELECT email, ASCII(email) AS Val FROM Employees;
SELECT FirstName, ASCII(LEFT(FirstName,1)) FROM Employees;
SELECT FirstName, ASCII(RIGHT(FirstName,1)) FROM Employees;


SELECT CHAR(65) AS Character_Value;
SELECT CHAR(97) AS CharVal;
SELECT CHAR(48) AS CharVal;
SELECT CHAR(36) AS CharVal;
SELECT EmpID, CHAR(65) FROM Employees;
SELECT FirstName, CHAR(ASCII(FirstName)) FROM Employees;
SELECT Age, CHAR(Age) FROM Employees;


SELECT email, CHARINDEX('@', email) FROM Employees;
SELECT email, CHARINDEX('gmail', email) FROM Employees;
SELECT FirstName, CHARINDEX('a', FirstName) FROM Employees;
SELECT LastName, CHARINDEX('r', LastName) FROM Employees;
SELECT Department, CHARINDEX('IT', Department) FROM Employees;
SELECT City, CHARINDEX('a', City) FROM Employees;
SELECT email, CHARINDEX('.', email) FROM Employees;


SELECT CONCAT(FirstName, LastName) FROM Employees;
SELECT CONCAT(FirstName,' ',LastName) FROM Employees;
SELECT CONCAT(FirstName,' works in ',Department) FROM Employees;
SELECT CONCAT(FirstName,' - ',City) FROM Employees;
SELECT CONCAT(email,' / ',phone) FROM Employees;
SELECT CONCAT(Department,' Dept') FROM Employees;
SELECT CONCAT('Employee: ',FirstName) FROM Employees;


SELECT FirstName + LastName FROM Employees;
SELECT FirstName + ' ' + LastName FROM Employees;
SELECT FirstName + ' - ' + Department FROM Employees;
SELECT City + ', ' + Department FROM Employees;
SELECT email + ' | ' + phone FROM Employees;
SELECT FirstName + ' (' + City + ')' FROM Employees;
SELECT Department + ' Department' FROM Employees;


SELECT CONCAT_WS(' ', FirstName, LastName) FROM Employees;
SELECT CONCAT_WS(' - ', FirstName, Department, City) FROM Employees;
SELECT CONCAT_WS(', ', City, Department) FROM Employees;
SELECT CONCAT_WS('|', email, phone) FROM Employees;
SELECT CONCAT_WS(': ', FirstName, Salary) FROM Employees;
SELECT CONCAT_WS(' / ', FirstName, Age) FROM Employees;
SELECT CONCAT_WS(' -> ', FirstName, City) FROM Employees;


SELECT email, DATALENGTH(email) FROM Employees;
SELECT FirstName, DATALENGTH(FirstName) FROM Employees;
SELECT LastName, DATALENGTH(LastName) FROM Employees;
SELECT Department, DATALENGTH(Department) FROM Employees;
SELECT City, DATALENGTH(City) FROM Employees;
SELECT phone, DATALENGTH(phone) FROM Employees;
SELECT CONCAT(FirstName,LastName), DATALENGTH(CONCAT(FirstName,LastName)) FROM Employees;


SELECT FirstName, DIFFERENCE(FirstName,'Amith') FROM Employees;
SELECT LastName, DIFFERENCE(LastName,'Kumar') FROM Employees;
SELECT City, DIFFERENCE(City,'Delhi') FROM Employees;
SELECT Department, DIFFERENCE(Department,'IT') FROM Employees;
SELECT FirstName, DIFFERENCE(FirstName,LastName) FROM Employees;
SELECT FirstName, DIFFERENCE(FirstName,'Rahul') FROM Employees;
SELECT FirstName, DIFFERENCE(FirstName,'Rohan') FROM Employees;

SELECT Salary, FORMAT(Salary,'N2') FROM Employees;
SELECT Salary, FORMAT(Salary,'C') FROM Employees;
SELECT Age, FORMAT(Age,'N0') FROM Employees;
SELECT Salary, FORMAT(Salary,'000000') FROM Employees;
SELECT Salary, FORMAT(Salary,'#,##0.00') FROM Employees;
SELECT Salary, FORMAT(Salary,'0.00') FROM Employees;
SELECT Salary, FORMAT(Salary,'N1') FROM Employees;


SELECT FirstName, LEFT(FirstName,2) FROM Employees;
SELECT LastName, LEFT(LastName,3) FROM Employees;
SELECT Department, LEFT(Department,2) FROM Employees;
SELECT City, LEFT(City,4) FROM Employees;
SELECT email, LEFT(email,5) FROM Employees;
SELECT phone, LEFT(phone,3) FROM Employees;
SELECT FirstName, LEFT(FirstName,1) FROM Employees;


SELECT FirstName, LEN(FirstName) FROM Employees;
SELECT LastName, LEN(LastName) FROM Employees;
SELECT Department, LEN(Department) FROM Employees;
SELECT City, LEN(City) FROM Employees;
SELECT email, LEN(email) FROM Employees;
SELECT phone, LEN(phone) FROM Employees;
SELECT CONCAT(FirstName,LastName), LEN(CONCAT(FirstName,LastName)) FROM Employees;


SELECT LOWER(FirstName) FROM Employees;
SELECT LOWER(LastName) FROM Employees;
SELECT LOWER(Department) FROM Employees;
SELECT LOWER(City) FROM Employees;
SELECT LOWER(email) FROM Employees;
SELECT LOWER(CONCAT(FirstName,' ',LastName)) FROM Employees;
SELECT LOWER('SQL SERVER') AS Val;


SELECT LTRIM('   SQL') AS Val;
SELECT FirstName, LTRIM(FirstName) FROM Employees;
SELECT email, LTRIM(email) FROM Employees;
SELECT City, LTRIM(City) FROM Employees;
SELECT LTRIM('   Bangalore');
SELECT LTRIM('   Data');
SELECT LTRIM('   Test');


SELECT NCHAR(9731);
SELECT NCHAR(65);
SELECT NCHAR(8364);
SELECT EmpID, NCHAR(65) FROM Employees;
SELECT NCHAR(169);
SELECT NCHAR(174);
SELECT NCHAR(9786);

SELECT email, PATINDEX('%gmail%',email) FROM Employees;
SELECT FirstName, PATINDEX('%a%',FirstName) FROM Employees;
SELECT LastName, PATINDEX('%r%',LastName) FROM Employees;
SELECT Department, PATINDEX('%IT%',Department) FROM Employees;
SELECT City, PATINDEX('%a%',City) FROM Employees;
SELECT phone, PATINDEX('%9%',phone) FROM Employees;
SELECT email, PATINDEX('%.com%',email) FROM Employees;

SELECT QUOTENAME(Department) FROM Employees;
SELECT QUOTENAME(City) FROM Employees;
SELECT QUOTENAME(FirstName) FROM Employees;
SELECT QUOTENAME('Employees');
SELECT QUOTENAME('Salary');
SELECT QUOTENAME(LastName) FROM Employees;
SELECT QUOTENAME(email) FROM Employees;


SELECT email, REPLACE(email,'gmail.com','company.com') FROM Employees;
SELECT FirstName, REPLACE(FirstName,'a','@') FROM Employees;
SELECT City, REPLACE(City,'a','*') FROM Employees;
SELECT Department, REPLACE(Department,'IT','Tech') FROM Employees;
SELECT phone, REPLACE(phone,'9','X') FROM Employees;
SELECT LastName, REPLACE(LastName,'r','R') FROM Employees;
SELECT email, REPLACE(email,'@','[at]') FROM Employees;


SELECT REPLICATE(FirstName,2) FROM Employees;
SELECT REPLICATE('*',5);
SELECT REPLICATE(Department,3) FROM Employees;
SELECT REPLICATE(City,2) FROM Employees;
SELECT REPLICATE('SQL ',3);
SELECT REPLICATE(LastName,2) FROM Employees;
SELECT REPLICATE(phone,2) FROM Employees;

SELECT FirstName, REVERSE(FirstName) FROM Employees;
SELECT LastName, REVERSE(LastName) FROM Employees;
SELECT City, REVERSE(City) FROM Employees;
SELECT Department, REVERSE(Department) FROM Employees;
SELECT phone, REVERSE(phone) FROM Employees;
SELECT email, REVERSE(email) FROM Employees;
SELECT REVERSE('SQL');


SELECT phone, RIGHT(phone,4) FROM Employees;
SELECT email, RIGHT(email,10) FROM Employees;
SELECT FirstName, RIGHT(FirstName,2) FROM Employees;
SELECT LastName, RIGHT(LastName,3) FROM Employees;
SELECT City, RIGHT(City,3) FROM Employees;
SELECT Department, RIGHT(Department,2) FROM Employees;
SELECT RIGHT('SQLSERVER',6);


SELECT RTRIM('SQL   ');
SELECT FirstName, RTRIM(FirstName) FROM Employees;
SELECT City, RTRIM(City) FROM Employees;
SELECT RTRIM('Test   ');
SELECT RTRIM('Hello   ');
SELECT RTRIM('Data   ');
SELECT RTRIM('Server   ');


SELECT FirstName, SOUNDEX(FirstName) FROM Employees;
SELECT LastName, SOUNDEX(LastName) FROM Employees;
SELECT City, SOUNDEX(City) FROM Employees;
SELECT Department, SOUNDEX(Department) FROM Employees;
SELECT SOUNDEX('Amith');
SELECT SOUNDEX('Rahul');
SELECT SOUNDEX('Rohan');

SELECT FirstName + SPACE(3) + LastName FROM Employees;
SELECT SPACE(5);
SELECT Department + SPACE(2) + City FROM Employees;
SELECT FirstName + SPACE(1) + Department FROM Employees;
SELECT SPACE(10);
SELECT City + SPACE(4) FROM Employees;
SELECT LastName + SPACE(2) FROM Employees;

SELECT Salary, STR(Salary,10,2) FROM Employees;
SELECT Age, STR(Age,5) FROM Employees;
SELECT STR(12345.67,10,2);
SELECT Salary, STR(Salary,8,1) FROM Employees;
SELECT STR(Age,3) FROM Employees;
SELECT STR(999.99,6,2);
SELECT STR(Salary) FROM Employees;


SELECT phone, STUFF(phone,1,0,'+91 ') FROM Employees;
SELECT email, STUFF(email,1,5,'user') FROM Employees;
SELECT FirstName, STUFF(FirstName,2,2,'XX') FROM Employees;
SELECT City, STUFF(City,1,1,'X') FROM Employees;
SELECT Department, STUFF(Department,2,1,'Z') FROM Employees;
SELECT STUFF('SQLSERVER',4,3,'DB');
SELECT phone, STUFF(phone,3,2,'XX') FROM Employees;


SELECT FirstName, SUBSTRING(FirstName,1,3) FROM Employees;
SELECT LastName, SUBSTRING(LastName,2,3) FROM Employees;
SELECT City, SUBSTRING(City,1,4) FROM Employees;
SELECT Department, SUBSTRING(Department,1,2) FROM Employees;
SELECT email, SUBSTRING(email,1,6) FROM Employees;
SELECT phone, SUBSTRING(phone,1,5) FROM Employees;
SELECT SUBSTRING('SQLSERVER',4,3);


SELECT phone, TRANSLATE(phone,'0123456789','##########') FROM Employees;
SELECT FirstName, TRANSLATE(FirstName,'AEIOU','*****') FROM Employees;
SELECT City, TRANSLATE(City,'aeiou','12345') FROM Employees;
SELECT Department, TRANSLATE(Department,'IT','##') FROM Employees;
SELECT TRANSLATE('SQL','SQL','123');
SELECT email, TRANSLATE(email,'@.','##') FROM Employees;
SELECT LastName, TRANSLATE(LastName,'a','@') FROM Employees;


SELECT TRIM('   SQL   ');
SELECT FirstName, TRIM(FirstName) FROM Employees;
SELECT City, TRIM(City) FROM Employees;
SELECT TRIM('   Data');
SELECT TRIM('Server   ');
SELECT TRIM('   Test   ');
SELECT TRIM('   Hello   ');

SELECT FirstName, UNICODE(FirstName) FROM Employees;
SELECT LastName, UNICODE(LastName) FROM Employees;
SELECT City, UNICODE(City) FROM Employees;
SELECT Department, UNICODE(Department) FROM Employees;
SELECT UNICODE('A');
SELECT UNICODE('Z');
SELECT UNICODE('a');

SELECT UPPER(FirstName) FROM Employees;
SELECT UPPER(LastName) FROM Employees;
SELECT UPPER(City) FROM Employees;
SELECT UPPER(Department) FROM Employees;
SELECT UPPER(email) FROM Employees;
SELECT UPPER('sql server');
SELECT FirstName, UPPER(FirstName) FROM Employees;





-- Numeric Functions--

SELECT EmpID, Salary, ABS(Salary - 50000) AS Diff FROM Employees;
SELECT EmpID, Age, ABS(Age - 30) AS AgeDiff FROM Employees;
SELECT ABS(-100) AS Val;
SELECT EmpID, ABS(Salary) FROM Employees;
SELECT EmpID, ABS(Age) FROM Employees;
SELECT EmpID, ABS(Salary - Age) FROM Employees;
SELECT EmpID, ABS(60000 - Salary) FROM Employees;

SELECT EmpID, ACOS(0.5) FROM Employees;
SELECT ACOS(1.0) AS Val;
SELECT ACOS(0.0) AS Val;
SELECT EmpID, ACOS(COS(Age)) FROM Employees;
SELECT EmpID, ACOS(0.25) FROM Employees;
SELECT EmpID, ACOS(0.75) FROM Employees;
SELECT ACOS(-1.0) AS Val;

SELECT EmpID, ASIN(0.5) FROM Employees;
SELECT ASIN(1.0) AS Val;
SELECT ASIN(0.0) AS Val;
SELECT EmpID, ASIN(SIN(Age)) FROM Employees;
SELECT EmpID, ASIN(0.25) FROM Employees;
SELECT EmpID, ASIN(0.75) FROM Employees;
SELECT ASIN(-1.0) AS Val;

SELECT EmpID, ATAN(Salary) FROM Employees;
SELECT EmpID, ATAN(Age) FROM Employees;
SELECT ATAN(1.0) AS Val;
SELECT ATAN(0.0) AS Val;
SELECT EmpID, ATAN(Salary - 50000) FROM Employees;
SELECT EmpID, ATAN(Age - 30) FROM Employees;
SELECT ATAN(-1.0) AS Val;

SELECT EmpID, ATN2(Salary, Age) FROM Employees;
SELECT EmpID, ATN2(Age, Salary) FROM Employees;
SELECT ATN2(10, 20) AS Val;
SELECT EmpID, ATN2(Salary - 50000, Age) FROM Employees;
SELECT EmpID, ATN2(Age - 30, Salary) FROM Employees;
SELECT ATN2(-10, 5) AS Val;
SELECT EmpID, ATN2(Age, Age) FROM Employees;

SELECT AVG(Salary) AS AvgSalary FROM Employees;
SELECT AVG(Age) AS AvgAge FROM Employees;
SELECT Department, AVG(Salary) FROM Employees GROUP BY Department;
SELECT City, AVG(Salary) FROM Employees GROUP BY City;
SELECT AVG(Salary - 50000) FROM Employees;
SELECT AVG(Age * 1.0) FROM Employees;
SELECT AVG(Salary) FROM Employees WHERE Department = 'IT';

SELECT EmpID, Salary, CEILING(Salary / 1000.0) FROM Employees;
SELECT EmpID, Age, CEILING(Age / 3.0) FROM Employees;
SELECT CEILING(10.2) AS Val;
SELECT CEILING(-10.2) AS Val;
SELECT EmpID, CEILING(Salary) FROM Employees;
SELECT EmpID, CEILING(Age) FROM Employees;
SELECT EmpID, CEILING(Salary - 50000) FROM Employees;

SELECT COUNT(*) FROM Employees;
SELECT COUNT(email) FROM Employees;
SELECT COUNT(DISTINCT Department) FROM Employees;
SELECT Department, COUNT(*) FROM Employees GROUP BY Department;
SELECT City, COUNT(*) FROM Employees GROUP BY City;
SELECT COUNT(*) FROM Employees WHERE Salary > 50000;
SELECT COUNT(*) FROM Employees WHERE City = 'Delhi';

SELECT EmpID, COS(Age) FROM Employees;
SELECT COS(0) AS Val;
SELECT COS(PI()) AS Val;
SELECT EmpID, COS(Salary) FROM Employees;
SELECT EmpID, COS(Age - 30) FROM Employees;
SELECT EmpID, COS(1.0) FROM Employees;
SELECT COS(-1.0) AS Val;

SELECT EmpID, COT(Age) FROM Employees;
SELECT COT(1.0) AS Val;
SELECT EmpID, COT(Salary) FROM Employees;
SELECT EmpID, COT(Age - 25) FROM Employees;
SELECT COT(0.5) AS Val;
SELECT EmpID, COT(PI()/4) FROM Employees;
SELECT COT(-1.0) AS Val;

SELECT EmpID, DEGREES(1.0) FROM Employees;
SELECT DEGREES(PI()) AS Val;
SELECT EmpID, DEGREES(RADIANS(Age)) FROM Employees;
SELECT DEGREES(0.5) AS Val;
SELECT EmpID, DEGREES(0.25) FROM Employees;
SELECT DEGREES(2.0) AS Val;
SELECT EmpID, DEGREES(SIN(1.0)) FROM Employees;

SELECT EXP(1) AS Val;
SELECT EmpID, EXP(Age) FROM Employees;
SELECT EmpID, EXP(1.0) FROM Employees;
SELECT EXP(0) AS Val;
SELECT EmpID, EXP(Salary / 100000.0) FROM Employees;
SELECT EXP(-1) AS Val;
SELECT EmpID, EXP(Age - 30) FROM Employees;

SELECT EmpID, Salary, FLOOR(Salary / 1000.0) FROM Employees;
SELECT EmpID, Age, FLOOR(Age / 3.0) FROM Employees;
SELECT FLOOR(10.9) AS Val;
SELECT FLOOR(-10.9) AS Val;
SELECT EmpID, FLOOR(Salary) FROM Employees;
SELECT EmpID, FLOOR(Age) FROM Employees;
SELECT EmpID, FLOOR(Salary - 50000) FROM Employees;

SELECT EmpID, LOG(Salary) FROM Employees;
SELECT LOG(10) AS Val;
SELECT EmpID, LOG(Age) FROM Employees;
SELECT LOG(100, 10) AS Base10;
SELECT EmpID, LOG(Salary / 1000.0) FROM Employees;
SELECT LOG(1) AS Val;
SELECT EmpID, LOG(Age + 1) FROM Employees;

SELECT EmpID, LOG10(Salary) FROM Employees;
SELECT LOG10(10) AS Val;
SELECT LOG10(1000) AS Val;
SELECT EmpID, LOG10(Age) FROM Employees;
SELECT EmpID, LOG10(Salary / 10.0) FROM Employees;
SELECT LOG10(1) AS Val;
SELECT EmpID, LOG10(Age + 1) FROM Employees;

SELECT MAX(Salary) FROM Employees;
SELECT MAX(Age) FROM Employees;
SELECT Department, MAX(Salary) FROM Employees GROUP BY Department;
SELECT City, MAX(Salary) FROM Employees GROUP BY City;
SELECT MAX(Salary - 50000) FROM Employees;
SELECT MAX(Age) FROM Employees WHERE Department='IT';
SELECT MAX(Salary) FROM Employees WHERE City='Mumbai';

SELECT MIN(Salary) FROM Employees;
SELECT MIN(Age) FROM Employees;
SELECT Department, MIN(Salary) FROM Employees GROUP BY Department;
SELECT City, MIN(Salary) FROM Employees GROUP BY City;
SELECT MIN(Salary - 50000) FROM Employees;
SELECT MIN(Age) FROM Employees WHERE Department='Sales';
SELECT MIN(Salary) FROM Employees WHERE City='Delhi';

SELECT PI() AS Val;
SELECT EmpID, PI() FROM Employees;
SELECT COS(PI()) AS Val;
SELECT SIN(PI()/2) AS Val;
SELECT TAN(PI()/4) AS Val;
SELECT DEGREES(PI()) AS Val;
SELECT RADIANS(180) AS Val;

SELECT EmpID, POWER(Salary, 2) FROM Employees;
SELECT EmpID, POWER(Age, 2) FROM Employees;
SELECT POWER(2, 3) AS Val;
SELECT EmpID, POWER(Salary, 0.5) FROM Employees;
SELECT EmpID, POWER(Age, 3) FROM Employees;
SELECT POWER(10, 2) AS Val;
SELECT EmpID, POWER(Salary - 50000, 2) FROM Employees;

SELECT EmpID, RADIANS(Age) FROM Employees;
SELECT RADIANS(180) AS Val;
SELECT EmpID, RADIANS(Department) FROM Employees; -- implicit conversion error example
SELECT EmpID, RADIANS(30) FROM Employees;
SELECT RADIANS(90) AS Val;
SELECT EmpID, RADIANS(Age - 10) FROM Employees;
SELECT RADIANS(0) AS Val;

SELECT RAND() AS Val;
SELECT EmpID, RAND() FROM Employees;
SELECT RAND(1) AS Seeded;
SELECT EmpID, RAND(CHECKSUM(NEWID())) FROM Employees;
SELECT RAND(5) AS Seeded;
SELECT EmpID, RAND(2) FROM Employees;
SELECT RAND() * 100 AS Random100;

SELECT EmpID, Salary, ROUND(Salary, 2) FROM Employees;
SELECT EmpID, Salary, ROUND(Salary, -3) FROM Employees;
SELECT ROUND(123.456, 2) AS Val;
SELECT EmpID, ROUND(Age, 0) FROM Employees;
SELECT EmpID, ROUND(Salary / 3.0, 1) FROM Employees;
SELECT ROUND(9876, -2) AS Val;
SELECT EmpID, ROUND(Salary, -2) FROM Employees;

SELECT EmpID, SIGN(Salary - 50000) FROM Employees;
SELECT EmpID, SIGN(Age - 30) FROM Employees;
SELECT SIGN(-10) AS Val;
SELECT SIGN(0) AS Val;
SELECT SIGN(25) AS Val;
SELECT EmpID, SIGN(Salary) FROM Employees;
SELECT EmpID, SIGN(Age) FROM Employees;

SELECT EmpID, SIN(Age) FROM Employees;
SELECT SIN(0) AS Val;
SELECT SIN(PI()/2) AS Val;
SELECT EmpID, SIN(Salary) FROM Employees;
SELECT SIN(1.0) AS Val;
SELECT EmpID, SIN(Age - 25) FROM Employees;
SELECT SIN(-1.0) AS Val;

SELECT EmpID, SQRT(Salary) FROM Employees;
SELECT SQRT(100) AS Val;
SELECT EmpID, SQRT(Age) FROM Employees;
SELECT SQRT(2) AS Val;
SELECT EmpID, SQRT(Salary - 10000) FROM Employees;
SELECT SQRT(1) AS Val;
SELECT EmpID, SQRT(Salary / 1000.0) FROM Employees;

SELECT EmpID, SQUARE(Salary) FROM Employees;
SELECT EmpID, SQUARE(Age) FROM Employees;
SELECT SQUARE(5) AS Val;
SELECT EmpID, SQUARE(Salary - 50000) FROM Employees;
SELECT EmpID, SQUARE(Age - 30) FROM Employees;
SELECT SQUARE(-10) AS Val;
SELECT EmpID, SQUARE(2) FROM Employees;

SELECT SUM(Salary) FROM Employees;
SELECT SUM(Age) FROM Employees;
SELECT Department, SUM(Salary) FROM Employees GROUP BY Department;
SELECT City, SUM(Salary) FROM Employees GROUP BY City;
SELECT SUM(Salary - 50000) FROM Employees;
SELECT SUM(Salary) FROM Employees WHERE Department='IT';
SELECT SUM(Salary) FROM Employees WHERE City='Delhi';

SELECT EmpID, TAN(Age) FROM Employees;
SELECT TAN(0) AS Val;
SELECT TAN(PI()/4) AS Val;
SELECT EmpID, TAN(Salary) FROM Employees;
SELECT TAN(1.0) AS Val;
SELECT EmpID, TAN(Age - 20) FROM Employees;
SELECT TAN(-1.0) AS Val;



-- Date Functions --

SELECT CURRENT_TIMESTAMP AS CurrentDateTime;
SELECT EmpID, CURRENT_TIMESTAMP FROM Employees;
SELECT FirstName, CURRENT_TIMESTAMP FROM Employees;
SELECT Department, CURRENT_TIMESTAMP FROM Employees;
SELECT CURRENT_TIMESTAMP AS Now1, CURRENT_TIMESTAMP AS Now2;
SELECT EmpID, Salary, CURRENT_TIMESTAMP FROM Employees;
SELECT City, CURRENT_TIMESTAMP FROM Employees;

SELECT EmpID, DATEADD(YEAR, 1, CURRENT_TIMESTAMP) AS NextYear FROM Employees;
SELECT EmpID, DATEADD(MONTH, 2, CURRENT_TIMESTAMP) AS After2Months FROM Employees;
SELECT EmpID, DATEADD(DAY, 10, CURRENT_TIMESTAMP) AS After10Days FROM Employees;
SELECT DATEADD(HOUR, 5, CURRENT_TIMESTAMP) AS After5Hours;
SELECT DATEADD(MINUTE, 30, CURRENT_TIMESTAMP) AS After30Min;
SELECT EmpID, DATEADD(WEEK, 1, CURRENT_TIMESTAMP) FROM Employees;
SELECT EmpID, DATEADD(DAY, -7, CURRENT_TIMESTAMP) AS LastWeek FROM Employees;

SELECT EmpID, DATEDIFF(YEAR, DATEFROMPARTS(2000,1,1), CURRENT_TIMESTAMP) AS YearsPassed FROM Employees;
SELECT EmpID, DATEDIFF(MONTH, DATEFROMPARTS(2025,1,1), CURRENT_TIMESTAMP) FROM Employees;
SELECT EmpID, DATEDIFF(DAY, DATEFROMPARTS(2026,1,1), CURRENT_TIMESTAMP) FROM Employees;
SELECT DATEDIFF(DAY, CURRENT_TIMESTAMP, DATEADD(DAY, 10, CURRENT_TIMESTAMP)) AS DiffDays;
SELECT DATEDIFF(HOUR, CURRENT_TIMESTAMP, DATEADD(HOUR, 5, CURRENT_TIMESTAMP)) AS DiffHours;
SELECT EmpID, DATEDIFF(DAY, DATEADD(DAY,-Age, CURRENT_TIMESTAMP), CURRENT_TIMESTAMP) AS AgeDays FROM Employees;
SELECT EmpID, DATEDIFF(WEEK, DATEFROMPARTS(2026,1,1), CURRENT_TIMESTAMP) FROM Employees;

SELECT DATEFROMPARTS(2026, 2, 19) AS CustomDate;
SELECT EmpID, DATEFROMPARTS(2026, MONTH(CURRENT_TIMESTAMP), DAY(CURRENT_TIMESTAMP)) FROM Employees;
SELECT EmpID, DATEFROMPARTS(2000 + EmpID % 20, 1, 1) FROM Employees;
SELECT EmpID, DATEFROMPARTS(2025, 12, 31) FROM Employees;
SELECT DATEFROMPARTS(YEAR(CURRENT_TIMESTAMP), 1, 1) AS StartOfYear;
SELECT EmpID, DATEFROMPARTS(2026, 3, Age % 28 + 1) FROM Employees;
SELECT DATEFROMPARTS(2024, 2, 29) AS LeapDate;

SELECT EmpID, DATENAME(YEAR, CURRENT_TIMESTAMP) FROM Employees;
SELECT EmpID, DATENAME(MONTH, CURRENT_TIMESTAMP) FROM Employees;
SELECT EmpID, DATENAME(DAY, CURRENT_TIMESTAMP) FROM Employees;
SELECT DATENAME(WEEKDAY, CURRENT_TIMESTAMP) AS TodayName;
SELECT EmpID, DATENAME(HOUR, CURRENT_TIMESTAMP) FROM Employees;
SELECT EmpID, DATENAME(QUARTER, CURRENT_TIMESTAMP) FROM Employees;
SELECT EmpID, DATENAME(WEEK, CURRENT_TIMESTAMP) FROM Employees;

SELECT EmpID, DATEPART(YEAR, CURRENT_TIMESTAMP) FROM Employees;
SELECT EmpID, DATEPART(MONTH, CURRENT_TIMESTAMP) FROM Employees;
SELECT EmpID, DATEPART(DAY, CURRENT_TIMESTAMP) FROM Employees;
SELECT DATEPART(WEEKDAY, CURRENT_TIMESTAMP) AS WeekDayNum;
SELECT EmpID, DATEPART(HOUR, CURRENT_TIMESTAMP) FROM Employees;
SELECT EmpID, DATEPART(QUARTER, CURRENT_TIMESTAMP) FROM Employees;
SELECT EmpID, DATEPART(WEEK, CURRENT_TIMESTAMP) FROM Employees;

SELECT DAY(CURRENT_TIMESTAMP) AS TodayDay;
SELECT EmpID, DAY(CURRENT_TIMESTAMP) FROM Employees;
SELECT DAY('2026-12-25') AS ChristmasDay;
SELECT EmpID, DAY(DATEADD(DAY, Age, CURRENT_TIMESTAMP)) FROM Employees;
SELECT DAY(DATEFROMPARTS(2026, 1, 15)) AS Val;
SELECT EmpID, DAY(GETDATE()) FROM Employees;
SELECT DAY(GETUTCDATE()) AS UTCDay;

SELECT GETDATE() AS CurrentDateTime;
SELECT EmpID, GETDATE() FROM Employees;
SELECT FirstName, GETDATE() FROM Employees;
SELECT Department, GETDATE() FROM Employees;
SELECT GETDATE() AS Now1, GETDATE() AS Now2;
SELECT EmpID, Salary, GETDATE() FROM Employees;
SELECT City, GETDATE() FROM Employees;

SELECT GETUTCDATE() AS CurrentUTC;
SELECT EmpID, GETUTCDATE() FROM Employees;
SELECT GETUTCDATE() AS UTC1, GETDATE() AS LocalTime;
SELECT EmpID, DATEADD(HOUR, 5, GETUTCDATE()) AS IST_Time FROM Employees;
SELECT DATEDIFF(HOUR, GETUTCDATE(), GETDATE()) AS TimeZoneDiff;
SELECT EmpID, GETUTCDATE() FROM Employees;
SELECT DATENAME(WEEKDAY, GETUTCDATE()) AS UTC_DayName;

SELECT ISDATE('2026-02-19') AS ValidDate;
SELECT ISDATE('19-02-2026') AS CheckFormat;
SELECT ISDATE('InvalidDate') AS InvalidTest;
SELECT EmpID, ISDATE(email) FROM Employees;
SELECT ISDATE(GETDATE()) AS SystemDateCheck;
SELECT ISDATE('2026/12/31') AS SlashFormat;
SELECT ISDATE('2026-13-01') AS InvalidMonth;

SELECT MONTH(CURRENT_TIMESTAMP) AS CurrentMonth;
SELECT EmpID, MONTH(GETDATE()) FROM Employees;
SELECT MONTH('2026-12-25') AS Val;
SELECT EmpID, MONTH(DATEADD(MONTH, Age % 12, CURRENT_TIMESTAMP)) FROM Employees;
SELECT MONTH(GETUTCDATE()) AS UTCMonth;
SELECT EmpID, MONTH(CURRENT_TIMESTAMP) FROM Employees;
SELECT MONTH(DATEFROMPARTS(2026, 5, 10)) AS Val;

SELECT SYSDATETIME() AS CurrentSysDateTime;
SELECT EmpID, SYSDATETIME() FROM Employees;
SELECT SYSDATETIME() AS Sys1, GETDATE() AS Sys2;
SELECT EmpID, DATEADD(SECOND, Age, SYSDATETIME()) FROM Employees;
SELECT DATEDIFF(MILLISECOND, GETDATE(), SYSDATETIME()) AS PrecisionDiff;
SELECT EmpID, SYSDATETIME() FROM Employees;
SELECT DATENAME(MONTH, SYSDATETIME()) AS MonthName;

SELECT YEAR(CURRENT_TIMESTAMP) AS CurrentYear;
SELECT EmpID, YEAR(GETDATE()) FROM Employees;
SELECT YEAR('2026-12-25') AS Val;
SELECT EmpID, YEAR(DATEADD(YEAR, Age % 5, CURRENT_TIMESTAMP)) FROM Employees;
SELECT YEAR(GETUTCDATE()) AS UTCYear;
SELECT EmpID, YEAR(CURRENT_TIMESTAMP) FROM Employees;
SELECT YEAR(DATEFROMPARTS(2020, 5, 10)) AS Val;

SELECT EmpID, CAST(Salary AS INT) AS SalaryInt FROM Employees;
SELECT EmpID, CAST(Age AS VARCHAR(10)) AS AgeText FROM Employees;
SELECT CAST(GETDATE() AS DATE) AS OnlyDate;
SELECT EmpID, CAST(EmpID AS VARCHAR(10)) FROM Employees;
SELECT CAST(123.456 AS INT) AS RoundedValue;
SELECT EmpID, CAST(Salary AS FLOAT) FROM Employees;
SELECT CAST('2026-02-19' AS DATE) AS ConvertedDate;

SELECT EmpID, COALESCE(NULL, FirstName) FROM Employees;
SELECT EmpID, COALESCE(NULL, NULL, City) FROM Employees;
SELECT COALESCE(NULL, NULL, 'DefaultValue') AS Val;
SELECT EmpID, COALESCE(email, 'No Email') FROM Employees;
SELECT EmpID, COALESCE(phone, 'No Phone') FROM Employees;
SELECT EmpID, COALESCE(NULL, Department, City) FROM Employees;
SELECT EmpID, COALESCE(NULL, Salary, 0) FROM Employees;

SELECT EmpID, CONVERT(INT, Salary) FROM Employees;
SELECT EmpID, CONVERT(VARCHAR(20), Salary) FROM Employees;
SELECT CONVERT(VARCHAR(20), GETDATE(), 103) AS BritishDate;
SELECT CONVERT(VARCHAR(20), GETDATE(), 100) AS DefaultFormat;
SELECT EmpID, CONVERT(FLOAT, Age) FROM Employees;
SELECT CONVERT(DATE, GETDATE()) AS OnlyDate;
SELECT EmpID, CONVERT(VARCHAR(10), EmpID) FROM Employees;

SELECT EmpID, CONVERT(INT, Salary) FROM Employees;
SELECT EmpID, CONVERT(VARCHAR(20), Salary) FROM Employees;
SELECT CONVERT(VARCHAR(20), GETDATE(), 103) AS BritishDate;
SELECT CONVERT(VARCHAR(20), GETDATE(), 100) AS DefaultFormat;
SELECT EmpID, CONVERT(FLOAT, Age) FROM Employees;
SELECT CONVERT(DATE, GETDATE()) AS OnlyDate;
SELECT EmpID, CONVERT(VARCHAR(10), EmpID) FROM Employees;

SELECT CURRENT_USER AS CurrentDBUser;
SELECT EmpID, CURRENT_USER FROM Employees;
SELECT CURRENT_USER AS User1, CURRENT_USER AS User2;
SELECT FirstName, CURRENT_USER FROM Employees;
SELECT Department, CURRENT_USER FROM Employees;
SELECT CURRENT_USER + ' logged in' AS Status;
SELECT EmpID, Salary, CURRENT_USER FROM Employees;

SELECT EmpID, IIF(Salary > 50000, 'High', 'Low') AS SalaryLevel FROM Employees;
SELECT EmpID, IIF(Age >= 30, 'Senior', 'Junior') AS AgeGroup FROM Employees;
SELECT EmpID, IIF(City = 'Delhi', 'North', 'Other') FROM Employees;
SELECT EmpID, IIF(Department = 'IT', Salary * 1.1, Salary) FROM Employees;
SELECT EmpID, IIF(phone LIKE '9%', 'Starts with 9', 'Other') FROM Employees;
SELECT IIF(1 = 1, 'True', 'False') AS Test;
SELECT EmpID, IIF(email LIKE '%gmail%', 'Gmail', 'Other') FROM Employees;

SELECT EmpID, ISNULL(email, 'No Email') FROM Employees;
SELECT EmpID, ISNULL(phone, 'No Phone') FROM Employees;
SELECT ISNULL(NULL, 'DefaultValue') AS Val;
SELECT EmpID, ISNULL(Salary, 0) FROM Employees;
SELECT EmpID, ISNULL(City, 'Unknown') FROM Employees;
SELECT EmpID, ISNULL(Department, 'Not Assigned') FROM Employees;
SELECT EmpID, ISNULL(NULL, FirstName) FROM Employees;

SELECT EmpID, ISNUMERIC(phone) FROM Employees;
SELECT EmpID, ISNUMERIC(email) FROM Employees;
SELECT ISNUMERIC('12345') AS Test1;
SELECT ISNUMERIC('12.34') AS Test2;
SELECT ISNUMERIC('ABC') AS Test3;
SELECT EmpID, ISNUMERIC(Salary) FROM Employees;
SELECT EmpID, ISNUMERIC(Age) FROM Employees;

SELECT EmpID, NULLIF(Salary, 50000) FROM Employees;
SELECT EmpID, NULLIF(Age, 30) FROM Employees;
SELECT NULLIF(100, 100) AS Val;
SELECT NULLIF(100, 200) AS Val;
SELECT EmpID, NULLIF(Department, 'IT') FROM Employees;
SELECT EmpID, NULLIF(City, 'Delhi') FROM Employees;
SELECT EmpID, Salary / NULLIF(Age, 0) FROM Employees;

SELECT SESSION_USER AS SessionUser;
SELECT EmpID, SESSION_USER FROM Employees;
SELECT SESSION_USER AS User1, CURRENT_USER AS User2;
SELECT FirstName, SESSION_USER FROM Employees;
SELECT Department, SESSION_USER FROM Employees;
SELECT SESSION_USER + ' active' AS Status;
SELECT EmpID, Salary, SESSION_USER FROM Employees;

SELECT SESSIONPROPERTY('LANGUAGE') AS LangSetting;
SELECT SESSIONPROPERTY('DATEFIRST') AS FirstDayOfWeek;
SELECT SESSIONPROPERTY('ANSI_NULLS') AS AnsiNulls;
SELECT SESSIONPROPERTY('QUOTED_IDENTIFIER') AS QuotedID;
SELECT SESSIONPROPERTY('ARITHABORT') AS ArithAbort;
SELECT SESSIONPROPERTY('CONCAT_NULL_YIELDS_NULL') AS ConcatNull;
SELECT EmpID, SESSIONPROPERTY('LANGUAGE') FROM Employees;

SELECT SYSTEM_USER AS LoginName;
SELECT EmpID, SYSTEM_USER FROM Employees;
SELECT SYSTEM_USER AS User1, SESSION_USER AS User2;
SELECT FirstName, SYSTEM_USER FROM Employees;
SELECT Department, SYSTEM_USER FROM Employees;
SELECT SYSTEM_USER + ' logged in' AS Status;
SELECT EmpID, Salary, SYSTEM_USER FROM Employees;


SELECT USER_NAME() AS CurrentUserName;
SELECT USER_NAME(1) AS UserFromID;
SELECT EmpID, USER_NAME() FROM Employees;
SELECT USER_NAME(DB_ID()) AS DBUser;
SELECT USER_NAME(NULL) AS NullTest;
SELECT USER_NAME(USER_ID()) AS CurrentUser;
SELECT EmpID, USER_NAME() FROM Employees;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),

    SGPA_Sem1 DECIMAL(3,2),
    SGPA_Sem2 DECIMAL(3,2),
    SGPA_Sem3 DECIMAL(3,2),
    SGPA_Sem4 DECIMAL(3,2),
    SGPA_Sem5 DECIMAL(3,2),
    SGPA_Sem6 DECIMAL(3,2),
    SGPA_Sem7 DECIMAL(3,2),
    SGPA_Sem8 DECIMAL(3,2)
);

Drop table Students;
INSERT INTO Students VALUES
(1, 'Rahul', 8.1, 7.9, 8.3, 8.0, 8.5, 8.2, 8.4, 8.6),
(2, 'Sneha', 9.0, 8.8, 9.1, 8.9, 9.2, 9.0, 9.3, 9.4),
(3, 'Arjun', 7.5, 7.2, 7.8, 7.6, 7.9, 7.4, 7.7, 7.8),
(4, 'Amith', 8.55,8.90,8.28,8.63,7.77,8.28,8.36,8.30);

CREATE FUNCTION dbo.CalculateCGPA (@StudentID INT)
RETURNS DECIMAL(4,2)
AS
BEGIN
    DECLARE @CGPA DECIMAL(4,2);

    SELECT @CGPA =
        (
            ISNULL(SGPA_Sem1, 0) +
            ISNULL(SGPA_Sem2, 0) +
            ISNULL(SGPA_Sem3, 0) +
            ISNULL(SGPA_Sem4, 0) +
            ISNULL(SGPA_Sem5, 0) +
            ISNULL(SGPA_Sem6, 0) +
            ISNULL(SGPA_Sem7, 0) +
            ISNULL(SGPA_Sem8, 0)
        ) / 8.0
    FROM Students
    WHERE StudentID = @StudentID;

    RETURN @CGPA;
END;

SELECT dbo.CalculateCGPA(4) AS CGPA;

SELECT 
    StudentID,
    StudentName,
    dbo.CalculateCGPA(StudentID) AS CGPA
FROM Students;





SELECT 
    EmpID,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Salary,
    IIF(Salary >= 70000, 'Excellent',
        IIF(Salary >= 50000, 'Good', 'Average')) AS SalaryGrade
FROM Employees
ORDER BY Salary DESC;

SELECT 
    EmpID,
    email,
    LEN(email) AS EmailLen,
    CHARINDEX('@', email) AS AtPos,
    SUBSTRING(email, CHARINDEX('@', email)+1, LEN(email)) AS Domain
FROM Employees
WHERE email LIKE '%gmail%'
ORDER BY EmailLen DESC;

SELECT 
    Department,
    COUNT(*) AS TotalEmployees,
    AVG(Salary) AS AvgSalary,
    SUM(Salary) AS TotalSalary,
    MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 40000;

SELECT 
    EmpID,
    FirstName,
    Salary,
    MAX(Salary) OVER () AS CompanyMax,
    MAX(Salary) OVER () - Salary AS DiffFromTop
FROM Employees;

SELECT 
    EmpID,
    Salary,
    CAST(Salary AS INT) AS SalaryInt,
    CONVERT(VARCHAR(20), Salary) AS SalaryText,
    FORMAT(Salary, 'N2') AS FormattedSalary
FROM Employees;

SELECT 
    FirstName,
    ASCII(FirstName) AS ASCII_Val,
    UNICODE(FirstName) AS Unicode_Val
FROM Employees;

SELECT 
    FirstName,
    REVERSE(FirstName) AS ReversedName,
    LEN(FirstName) AS NameLength
FROM Employees
ORDER BY NameLength DESC;

SELECT 
    EmpID,
    Salary,
    ROUND(Salary, -3) AS Rounded,
    CEILING(Salary/1000.0) AS CeilK,
    FLOOR(Salary/1000.0) AS FloorK
FROM Employees;

SELECT 
    EmpID,
    Age,
    CASE 
        WHEN Age >= 35 THEN 'Senior'
        WHEN Age >= 28 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS AgeCategory
FROM Employees
ORDER BY Age DESC;

SELECT 
    EmpID,
    FirstName,
    GETDATE() AS QueryTime,
    CURRENT_TIMESTAMP AS CurrentTS,
    SYSTEM_USER AS LoginUser
FROM Employees;

SELECT 
    EmpID,
    Age,
    DATEADD(YEAR, -Age, GETDATE()) AS ApproxBirthYear
FROM Employees;

SELECT 
    EmpID,
    FirstName,
    Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees)
ORDER BY Salary DESC;

SELECT 
    EmpID,
    Salary,
    LOG(Salary) AS NaturalLog,
    LOG10(Salary) AS Log10
FROM Employees;

SELECT 
    EmpID,
    Salary,
    POWER(Salary, 2) AS SalarySquared,
    SQRT(Salary) AS SalaryRoot
FROM Employees;

SELECT 
    EmpID,
    Salary,
    SIGN(Salary - 50000) AS SalarySign
FROM Employees;

SELECT 
    EmpID,
    Age,
    SIN(Age) AS SinAge,
    COS(Age) AS CosAge,
    TAN(Age) AS TanAge
FROM Employees;

SELECT 
    EmpID,
    Salary,
    STDEV(Salary) OVER () AS SalaryStdDev
FROM Employees;

SELECT 
    Department,
    SUM(Salary) AS DeptTotal,
    SUM(Salary) * 100.0 / SUM(SUM(Salary)) OVER () AS DeptPercentage
FROM Employees
GROUP BY Department;

SELECT 
    EmpID,
    phone,
    STUFF(phone, 1, 0, '+91 ') AS FormattedPhone,
    RIGHT(phone, 4) AS Last4Digits
FROM Employees;

SELECT 
    EmpID,
    phone,
    TRANSLATE(phone, '0123456789', '##########') AS MaskedPhone
FROM Employees;

SELECT 
    EmpID,
    phone,
    ISNUMERIC(phone) AS IsNumeric
FROM Employees;

SELECT 
    EmpID,
    REPLACE(email, 'gmail.com', 'company.com') AS UpdatedEmail
FROM Employees;

SELECT 
    EmpID,
    REPLICATE(FirstName + ' ', 2) AS FunName
FROM Employees;

SELECT 
    EmpID,
    REPLICATE(FirstName + ' ', 2) AS FunName
FROM Employees;

SELECT TRIM('   SQL Server   ') AS CleanText;

SELECT 
    Department,
    LEFT(Department, 3) AS DeptCode
FROM Employees;

SELECT 
    EmpID,
    YEAR(GETDATE()) AS CurrentYear,
    MONTH(GETDATE()) AS CurrentMonth
FROM Employees;

SELECT 
    DATENAME(WEEKDAY, GETDATE()) AS DayName,
    DATEPART(WEEK, GETDATE()) AS WeekNumber;

    SELECT 
    VAR(Salary) AS SalaryVariance,
    VARP(Salary) AS SalaryVariancePopulation
FROM Employees;

SELECT CHECKSUM_AGG(Salary) AS SalaryChecksum
FROM Employees;

SELECT EmpID, BINARY_CHECKSUM(*) AS RowChecksum
FROM Employees;

SELECT 
    DB_NAME() AS DatabaseName,
    DB_ID() AS DatabaseID;

SELECT OBJECT_NAME(OBJECT_ID('Employees')) AS TableName;

SELECT 
    COL_LENGTH('Employees', 'email') AS EmailColumnLength;

SELECT 
    INDEXPROPERTY(OBJECT_ID('Employees'), 'PK__Employees', 'IsClustered') AS IsClustered;

SELECT 
    CURRENT_USER AS CurrentDBUser,
    SESSION_USER AS SessionUser;

SELECT 
    EmpID,
    Salary,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

SELECT 
    EmpID,
    Salary,
    SUM(Salary) OVER (ORDER BY Salary) AS RunningTotal
FROM Employees;

SELECT MAX(Salary) - MIN(Salary) AS SalarySpread
FROM Employees;

SELECT 
    EmpID,
    CONCAT(FirstName, ' - ', Department) AS Info,
    Salary,
    ROUND(Salary, -3) AS RoundedSalary,
    FORMAT(Salary, 'N2') AS FormattedSalary,
    YEAR(GETDATE()) AS CurrentYear,
    SYSTEM_USER AS UserName
FROM Employees
WHERE Salary > 40000
ORDER BY Salary DESC;

SELECT 
    EmpID,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Department,
    City,
    Salary,
    FORMAT(Salary, 'N2') AS FormattedSalary,
    ROUND(Salary, -3) AS RoundedSalary,
    Salary - AVG(Salary) OVER (PARTITION BY Department) AS DiffFromDeptAvg,
    YEAR(GETDATE()) AS CurrentYear,
    SYSTEM_USER AS LoggedUser
FROM Employees
WHERE Salary > 35000
ORDER BY Department, Salary DESC;

SELECT 
    EmpID,
    FirstName,
    Salary,
    POWER(Salary, 2) AS SalarySquared,
    SQRT(Salary) AS SalaryRoot,
    SIGN(Salary - 50000) AS SalaryIndicator,
    IIF(Salary >= 60000, 'High Package', 'Normal Package') AS SalaryLabel,
    GETDATE() AS QueryTime
FROM Employees
WHERE Salary BETWEEN 35000 AND 80000
ORDER BY Salary DESC;

SELECT 
    EmpID,
    email,
    LEN(email) AS EmailLength,
    CHARINDEX('@', email) AS AtPosition,
    LEFT(email, CHARINDEX('@', email)-1) AS Username,
    SUBSTRING(email, CHARINDEX('@', email)+1, LEN(email)) AS Domain,
    REPLACE(email, 'gmail.com', 'corporate.com') AS UpdatedEmail
FROM Employees
WHERE email LIKE '%gmail%'
ORDER BY EmailLength DESC;

SELECT 
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(Salary) AS TotalSalary,
    AVG(Salary) AS AvgSalary,
    MAX(Salary) AS MaxSalary,
    MIN(Salary) AS MinSalary,
    STDEV(Salary) AS SalaryStdDev
FROM Employees
GROUP BY Department
HAVING COUNT(*) >= 1
ORDER BY AvgSalary DESC;

SELECT 
    EmpID,
    FirstName,
    City,
    Salary,
    AVG(Salary) OVER (PARTITION BY City) AS CityAvgSalary,
    Salary - AVG(Salary) OVER (PARTITION BY City) AS DiffFromCityAvg,
    DENSE_RANK() OVER (PARTITION BY City ORDER BY Salary DESC) AS CityRank
FROM Employees
WHERE Salary > 30000
ORDER BY City, CityRank;

SELECT 
    EmpID,
    FirstName,
    UPPER(FirstName) AS UpperName,
    LOWER(FirstName) AS LowerName,
    REVERSE(FirstName) AS ReversedName,
    ASCII(FirstName) AS ASCII_Value,
    LEN(FirstName) AS NameLength,
    REPLICATE(FirstName + ' ', 2) AS RepeatedName
FROM Employees
ORDER BY NameLength DESC;

SELECT 
    EmpID,
    FirstName,
    Salary,
    Salary * 100.0 / SUM(Salary) OVER () AS CompanySalaryShare,
    FORMAT(Salary * 100.0 / SUM(Salary) OVER (), 'N2') + ' %' AS ShareFormatted
FROM Employees
ORDER BY CompanySalaryShare DESC;

SELECT 
    EmpID,
    FirstName,
    Age,
    DATEADD(YEAR, -Age, GETDATE()) AS ApproxBirthDate,
    DATEDIFF(YEAR, DATEADD(YEAR, -Age, GETDATE()), GETDATE()) AS VerifiedAge,
    DATENAME(MONTH, GETDATE()) AS CurrentMonth,
    DATEPART(WEEK, GETDATE()) AS CurrentWeek
FROM Employees
ORDER BY Age DESC;

SELECT 
    EmpID,
    Salary,
    CAST(Salary AS INT) AS SalaryInt,
    CONVERT(VARCHAR(20), Salary) AS SalaryText,
    STR(Salary, 10, 2) AS SalaryString,
    Salary * 1.15 AS SalaryWithBonus,
    ROUND(Salary * 1.15, -3) AS RoundedBonusSalary
FROM Employees
ORDER BY Salary DESC;

SELECT 
    EmpID,
    CONCAT_WS(' | ', FirstName, Department, City) AS EmployeeInfo,
    Salary,
    FORMAT(Salary, 'C') AS SalaryCurrency,
    ROUND(Salary, -3) AS RoundedSalary,
    SIGN(Salary - AVG(Salary) OVER ()) AS CompareWithAvg,
    YEAR(GETDATE()) AS CurrentYear,
    SYSTEM_USER AS UserName
FROM Employees
WHERE Salary > 40000
ORDER BY RoundedSalary DESC;

SELECT 
    EmpID,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Age,
    Salary,
    AVG(Salary) OVER () AS CompanyAvgSalary,
    Salary - AVG(Salary) OVER () AS DiffFromCompanyAvg,
    IIF(Age >= 30 AND Salary > 50000, 'Experienced High Earner', 'Normal') AS Category,
    GETDATE() AS QueryTime
FROM Employees
WHERE Salary > 35000
ORDER BY DiffFromCompanyAvg DESC;

SELECT 
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(Salary) AS TotalSalary,
    FORMAT(AVG(Salary), 'N2') AS AvgSalaryFormatted,
    MAX(Salary) AS HighestSalary,
    MIN(Salary) AS LowestSalary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) > 70000
ORDER BY TotalSalary DESC;

SELECT 
    EmpID,
    email,
    LEFT(email, CHARINDEX('@', email)-1) AS Username,
    LEN(LEFT(email, CHARINDEX('@', email)-1)) AS UsernameLength,
    PATINDEX('%[0-9]%', email) AS FirstNumberPosition,
    LOWER(email) AS LowerEmail
FROM Employees
WHERE email LIKE '%gmail%'
ORDER BY UsernameLength DESC;

SELECT 
    EmpID,
    FirstName,
    Salary,
    NTILE(3) OVER (ORDER BY Salary DESC) AS SalaryBand,
    ROUND(Salary, -3) AS RoundedSalary,
    FORMAT(Salary, 'N2') AS SalaryFormatted
FROM Employees
ORDER BY SalaryBand, Salary DESC;

SELECT 
    EmpID,
    FirstName,
    City,
    Salary,
    DENSE_RANK() OVER (PARTITION BY City ORDER BY Salary DESC) AS CityRank,
    AVG(Salary) OVER (PARTITION BY City) AS CityAvgSalary
FROM Employees
WHERE Salary > 30000
ORDER BY City, CityRank;

SELECT 
    EmpID,
    Salary,
    CAST(Salary AS INT) AS SalaryInt,
    POWER(Salary, 2) AS SalarySquared,
    SQRT(Salary) AS SalaryRoot,
    SIGN(Salary - 50000) AS SalaryIndicator,
    IIF(Salary > 60000, 'Bonus Eligible', 'Standard') AS BonusFlag
FROM Employees
ORDER BY SalarySquared DESC;

SELECT 
    EmpID,
    Salary,
    CAST(Salary AS INT) AS SalaryInt,
    POWER(Salary, 2) AS SalarySquared,
    SQRT(Salary) AS SalaryRoot,
    SIGN(Salary - 50000) AS SalaryIndicator,
    IIF(Salary > 60000, 'Bonus Eligible', 'Standard') AS BonusFlag
FROM Employees
ORDER BY SalarySquared DESC;

SELECT 
    EmpID,
    CONCAT_WS(' - ', FirstName, Department, City) AS EmployeeInfo,
    Salary,
    YEAR(GETDATE()) AS CurrentYear,
    MONTH(GETDATE()) AS CurrentMonth,
    DATENAME(WEEKDAY, GETDATE()) AS TodayName,
    SYSTEM_USER AS LoggedUser
FROM Employees
WHERE Department IN ('IT', 'Sales')
ORDER BY CurrentMonth, Salary DESC;






