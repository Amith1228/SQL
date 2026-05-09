CREATE DATABASE Amith

CREATE TABLE Employees (
    EmpID BIGINT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);
INSERT INTO Employees VALUES (1001, N'Amith', N'Kumar', 55000.75, '2024-06-01');
INSERT INTO Employees VALUES (1002, N'Rahul', N'Sharma', 48000.50, '2023-03-15');
INSERT INTO Employees VALUES (1003, N'Sneha', N'Iyer', 62000.00, '2022-07-10');
INSERT INTO Employees VALUES (1004, N'Kiran', N'Patel', 45000.25, '2021-01-05');
INSERT INTO Employees VALUES (1005, N'Meera', N'Reddy', 70000.90, '2020-11-20');

SELECT*FROM Employees;

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username VARCHAR(50),
    Email VARCHAR(100),
    IsActive BIT,
    CreatedAt DATETIME2
);

INSERT INTO Users VALUES ('amith', 'amith@mail.com', 1, SYSDATETIME());
INSERT INTO Users VALUES ('rahul', 'rahul@mail.com', 1, SYSDATETIME());
INSERT INTO Users VALUES ('sneha', 'sneha@mail.com', 1, SYSDATETIME());
INSERT INTO Users VALUES ('kiran', 'kiran@mail.com', 0, SYSDATETIME());
INSERT INTO Users VALUES ('meera', 'meera@mail.com', 1, SYSDATETIME());
INSERT INTO Users VALUES ('john', 'john@mail.com', 1, SYSDATETIME());
INSERT INTO Users VALUES ('alex', 'alex@mail.com', 0, SYSDATETIME());
INSERT INTO Users VALUES ('nina', 'nina@mail.com', 1, SYSDATETIME());
INSERT INTO Users VALUES ('rohit', 'rohit@mail.com', 1, SYSDATETIME());
INSERT INTO Users VALUES ('tara', 'tara@mail.com', 1, SYSDATETIME());

SELECT*FROM Users;


DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME2 DEFAULT SYSDATETIME()
);

INSERT INTO Users (Username, Email) VALUES ('Amith', 'amith@mail.com');
INSERT INTO Users (Username, Email) VALUES ('Rahul', 'rahul@mail.com');
INSERT INTO Users (Username, Email) VALUES ('Sneha', 'sneha@mail.com');

SELECT*FROM Users;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Categories (CategoryName) VALUES ('Electronics');
INSERT INTO Categories (CategoryName) VALUES ('Accessories');

SELECT*FROM Categories;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL DEFAULT 0,
    CategoryID INT NOT NULL,

    CONSTRAINT CHK_Product_Price CHECK (Price > 0),
    CONSTRAINT CHK_Product_Stock CHECK (Stock >= 0),

    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

INSERT INTO Products (ProductName, Price, Stock, CategoryID)
VALUES ('Laptop', 80000, 10, 1);

INSERT INTO Products (ProductName, Price, Stock, CategoryID)
VALUES ('Mouse', 500, 50, 2);

INSERT INTO Products (ProductName, Price, Stock, CategoryID)
VALUES ('Keyboard', 1500, 30, 2);

SELECT*FROM Products;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    UserID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Orders (UserID) VALUES (1);
INSERT INTO Orders (UserID) VALUES (2);

SELECT*FROM Orders;


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,

    CONSTRAINT CHK_Quantity CHECK (Quantity > 0),

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES (1, 1, 1);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES (1, 2, 2);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES (2, 3, 1);

SELECT*FROM OrderDetails;

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY,
    OrderID INT NOT NULL UNIQUE,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT CHK_Payment_Amount CHECK (Amount > 0),

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
INSERT INTO Payments (OrderID, Amount)
VALUES (1, 81000);

INSERT INTO Payments (OrderID, Amount)
VALUES (2, 1500);

SELECT * FROM Payments;




CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Age INT CHECK (Age >= 17),
    CreatedAt DATETIME DEFAULT GETDATE()
);
INSERT INTO Students (FullName, Email, Age) VALUES ('Amith', 'amith@student.com', 21);
INSERT INTO Students (FullName, Email, Age) VALUES ('Rahul Sharma', 'rahul@student.com', 22);
INSERT INTO Students (FullName, Email, Age) VALUES ('Sneha Iyer', 'sneha@student.com', 20);

SELECT * FROM Students;

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY IDENTITY,
    InstructorName VARCHAR(100) NOT NULL,
    Department VARCHAR(50) NOT NULL
);

INSERT INTO Instructors (InstructorName, Department) VALUES ('Dr. Rao', 'Computer Science');
INSERT INTO Instructors (InstructorName, Department) VALUES ('Prof. Mehta', 'Mathematics');

SELECT * FROM Instructors;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL CHECK (Credits BETWEEN 1 AND 5),
    InstructorID INT NOT NULL,

    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

INSERT INTO Courses (CourseName, Credits, InstructorID)
VALUES ('Database Systems', 4, 1);

INSERT INTO Courses (CourseName, Credits, InstructorID)
VALUES ('Data Structures', 3, 1);

INSERT INTO Courses (CourseName, Credits, InstructorID)
VALUES ('Calculus', 5, 2);

SELECT * FROM Courses;

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollDate DATE DEFAULT GETDATE(),

    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


INSERT INTO Enrollments (StudentID, CourseID) VALUES (1, 1);
INSERT INTO Enrollments (StudentID, CourseID) VALUES (1, 2);
INSERT INTO Enrollments (StudentID, CourseID) VALUES (2, 3);
INSERT INTO Enrollments (StudentID, CourseID) VALUES (3, 1);

SELECT * FROM Enrollments;

CREATE TABLE Results (
    ResultID INT PRIMARY KEY IDENTITY,
    EnrollmentID INT NOT NULL UNIQUE,
    Marks INT NOT NULL CHECK (Marks BETWEEN 0 AND 100),
    Grade CHAR(2),

    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);

INSERT INTO Results (EnrollmentID, Marks, Grade) VALUES (1, 85, 'A');
INSERT INTO Results (EnrollmentID, Marks, Grade) VALUES (2, 78, 'B');
INSERT INTO Results (EnrollmentID, Marks, Grade) VALUES (3, 92, 'A');
INSERT INTO Results (EnrollmentID, Marks, Grade) VALUES (4, 66, 'C');

SELECT * FROM Results;

SELECT 
    s.FullName,
    c.CourseName,
    r.Marks,
    r.Grade
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Results r ON e.EnrollmentID = r.EnrollmentID;


CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY IDENTITY,
    StudentName VARCHAR(100) NOT NULL,
    AttendanceDate DATE NOT NULL,
    CheckIn TIME,
    CheckOut TIME,
    IsPresent BIT DEFAULT 1
);
INSERT INTO Attendance (StudentName, AttendanceDate, CheckIn, CheckOut, IsPresent)
VALUES ('Amith', '2026-02-09', '09:00', '16:00', 1);

INSERT INTO Attendance VALUES ('Rahul', '2026-02-07', '09:15', '15:45', 1);
INSERT INTO Attendance VALUES ('Sneha', '2026-02-10', '09:30', '16:10', 1);

SELECT * FROM Attendance
WHERE AttendanceDate BETWEEN '2026-02-01' AND '2026-02-09';


CREATE TABLE EventsSchedule (
    EventID INT PRIMARY KEY IDENTITY,
    EventName VARCHAR(100),
    EventDate DATE,
    EventTime TIME,
    Location VARCHAR(100)
);

INSERT INTO EventsSchedule VALUES ('Tech Talk', '2026-03-01', '10:00', 'Auditorium');
INSERT INTO EventsSchedule VALUES ('Workshop', '2026-03-05', '14:30', 'Lab 1');

SELECT * FROM EventsSchedule;

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY,
    PatientName NVARCHAR(100),
    DoctorName NVARCHAR(100),
    AppointmentDate DATETIME2,
    DurationMinutes INT CHECK (DurationMinutes > 0)
);
INSERT INTO Appointments VALUES (N'Rahul', N'Dr. Mehta', SYSDATETIME(), 30);
INSERT INTO Appointments VALUES (N'Sneha', N'Dr. Rao', SYSDATETIME(), 45);
INSERT INTO Appointments VALUES (N'Amith', N'Dr. Kumar', SYSDATETIME(), 20);

ALTER TABLE Appointments
ADD DoctorPhone VARCHAR(15);

UPDATE Appointments
SET DoctorPhone = '9876543210'
WHERE DoctorName = N'Dr. Mehta';

UPDATE Appointments
SET DoctorPhone = '9123456780'
WHERE DoctorName = N'Dr. Rao';

UPDATE Appointments
SET DoctorPhone = '9988776655'
WHERE DoctorName = N'Dr. Kumar';

SELECT * FROM Appointments;

DROP TABLE Appointments

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY,
    PatientName NVARCHAR(100),
    DoctorName NVARCHAR(100),
    DoctorPhone CHAR(10),
    AppointmentDate DATETIME2,
    DurationMinutes INT CHECK (DurationMinutes > 0)
);

--------------------------------------------------------

INSERT INTO Appointments (PatientName, DoctorName, DoctorPhone, AppointmentDate, DurationMinutes)
VALUES (N'Rahul', N'Dr. Mehta', '9876543210', SYSDATETIME(), 30);

INSERT INTO Appointments (PatientName, DoctorName, DoctorPhone, AppointmentDate, DurationMinutes)
VALUES (N'Sneha', N'Dr. Rao', '9123456780', SYSDATETIME(), 45);

INSERT INTO Appointments (PatientName, DoctorName, DoctorPhone, AppointmentDate, DurationMinutes)
VALUES (N'Amith', N'Dr. Kumar', '9988776655', SYSDATETIME(), 20);

--------------------------------------------------------

SELECT * FROM Appointments;

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY IDENTITY,
    ProjectName VARCHAR(100),
    Budget MONEY,
    StartDate DATETIME2,
    EndDate DATETIME2,
    IsCompleted BIT DEFAULT 0,
    CHECK (EndDate >= StartDate)
);

INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate, IsCompleted)
VALUES ('Website Development', 150000, '2026-01-01 09:00:00', '2026-03-01 18:00:00', 0);

INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate, IsCompleted)
VALUES ('Mobile App', 300000, '2026-02-01 10:00:00', '2026-06-01 17:00:00', 0);

INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate, IsCompleted)
VALUES ('AI Chatbot', 500000, '2026-03-10 11:00:00', '2026-09-15 16:00:00', 0);

INSERT INTO Projects (ProjectName, Budget, StartDate, EndDate, IsCompleted)
VALUES ('Cloud Migration', 750000, '2026-04-01 08:30:00', '2026-12-20 19:00:00', 0);
SELECT * FROM Projects;

CREATE TABLE Devices (
    DeviceCode SMALLINT PRIMARY KEY,
    DeviceType TINYINT,
    BatteryLevel TINYINT CHECK (BatteryLevel BETWEEN 0 AND 100)
);

INSERT INTO Devices VALUES (101, 1, 85);
INSERT INTO Devices VALUES (102, 2, 60);
INSERT INTO Devices VALUES (103, 1, 95);

SELECT * FROM Devices;

CREATE TABLE Measurements (
    MeasurementID SMALLINT,
    Temperature FLOAT,
    Humidity REAL
);

INSERT INTO Measurements VALUES (1, 36.6, 45.5);
INSERT INTO Measurements VALUES (2, 30.2, 55.1);
INSERT INTO Measurements VALUES (3, 28.9, 60.0);

SELECT * FROM Measurements;

CREATE TABLE UniqueItems (
    ItemID UNIQUEIDENTIFIER ,
    Description TEXT
);

INSERT INTO UniqueItems VALUES (NEWID(), 'Sample Item 1');
INSERT INTO UniqueItems VALUES (NEWID(), 'Sample Item 2');
INSERT INTO UniqueItems VALUES (NEWID(), 'Sample Item 3');
SELECT * FROM UniqueItems;

CREATE TABLE BinaryFiles (
    FileID SMALLINT PRIMARY KEY,
    FixedHash BINARY(8),
    FileData VARBINARY(100)
);

INSERT INTO BinaryFiles VALUES (1, 0x12345678, 0xABCDEF);
INSERT INTO BinaryFiles VALUES (2, 0x87654321, 0x123ABC);

SELECT * FROM BinaryFiles;

CREATE TABLE DynamicData (
    DataID SMALLINT PRIMARY KEY,
    Value SQL_VARIANT
);

INSERT INTO DynamicData VALUES (1, 'Text Value');
INSERT INTO DynamicData VALUES (2, 12345);
INSERT INTO DynamicData VALUES (3, 99.99);

SELECT * FROM DynamicData;

CREATE TABLE EmployeeProfile (

    -- IDs & Numbers
    EmployeeID INT PRIMARY KEY,
    GlobalEmployeeID UNIQUEIDENTIFIER DEFAULT NEWID(),
    DepartmentCode SMALLINT,
    Age TINYINT,
    TotalLogins BIGINT,

    -- Salary / Finance
    Salary DECIMAL(10,2),
    Bonus MONEY,

    -- Performance / Calculations
    PerformanceScore FLOAT,
    AccuracyRating REAL,

    -- Text Data
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    FullName CHAR(100),
    Bio TEXT,
    Email NVARCHAR(100),

    -- Boolean
    IsActive BIT,

    -- Date & Time
    DateOfBirth DATE,
    WorkStartTime TIME,
    LastLogin DATETIME,
    RecordCreated DATETIME2 DEFAULT SYSDATETIME(),

    -- Binary Data
    ProfileImage VARBINARY(100),
    SecurityHash BINARY(32),

    -- Flexible Attribute
    AdditionalInfo SQL_VARIANT
);

INSERT INTO EmployeeProfile (
    EmployeeID, DepartmentCode, Age, TotalLogins,
    Salary, Bonus,
    PerformanceScore, AccuracyRating,
    FirstName, LastName, FullName, Bio, Email,
    IsActive,
    DateOfBirth, WorkStartTime, LastLogin,
    ProfileImage, SecurityHash,
    AdditionalInfo
)
VALUES (
    101,
    10,
    28,
    154321,

    55000.75,
    5000.00,

    88.567,
    92.5,

    'Amith',
    'N',
    'Amith N',
    'Senior Software Developer',
    N'amith@example.com',

    1,

    '1998-05-12',
    '09:00:00',
    GETDATE(),

    CAST('ImageData' AS VARBINARY),
    CAST('12345678901234567890123456789012' AS BINARY(32)),

    'Promoted recently'
);

SELECT*FROM EmployeeProfile;

