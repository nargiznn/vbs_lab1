CREATE DATABASE Company
USE Company

CREATE TABLE Employees
(
	Id INT PRIMARY KEY IDENTITY,
	Fullname NVARCHAR(35) NOT NULL,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Salary MONEY CHECK(Salary>=350)
)

CREATE TABLE Departments
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(20)
)



ALTER TABLE Employees
ADD DepartmentId INT FOREIGN KEY REFERENCES Departments(Id) 

ALTER TABLE EMPLOYEES
ADD CONSTRAINT FK_DepId_Emps FOREIGN KEY(DepartmentId) REFERENCES DepartmeNts(Id)


INSERT INTO Departments
VALUES
('IT'),
(N'Maliyyə'),
(N'Hüquq'),
('HR')

SELECT * FROM Departments

INSERT INTO Employees(Fullname,Email,Salary,DepartmentId)
VALUES
(N'Hikmət Abbasov','hiko@gmail.com',2500,1),
(N'Tofiq Quliyev','totu@gmail.com',2500,2),
(N'Nərmn Abbasova','nermin@gmail.com',1500,2),
(N'Nəzrin Quluzadə','nezrin@gmail.com',3500,3),
(N'Elməddin Agazadə','elmeddin@gmail.com',5500,1),
(N'Elmar Qarayev','elmar@gmail.com',500,3),
(N'Davud Əliyev','davud@gmail.com',500,2)


CREATE TABLE Projects
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100) NOT NULL,
	Deadline DATETIME2 NOT NULL
)

CREATE TABLE EmployeeProjects
(
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	ProjectId INT FOREIGN KEY REFERENCES Projects(Id),
)

INSERT INTO Projects
VALUES
('Project 1','2024-10-20'),
('Project 2','2025-10-20'),
('Project 3','2024-05-25'),
('Project 4','2024-03-01')

INSERT INTO EmployeeProjects
VALUES
(1,1),
(1,3),
(2,4),
(2,1),
(2,3),
(3,3),
(4,1),
(5,4),
(5,3)

SELECT * FROM Employees AS E
WHERE EXISTS (SELECT * FROM EmployeeProjects AS EP WHERE EP.EmployeeId=E.Id)

SELECT *, DATEDIFF(MONTH,GETDATE(),Deadline) FROM Projects





