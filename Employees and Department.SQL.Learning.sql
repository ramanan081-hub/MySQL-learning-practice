CREATE DATABASE sql_practice; 
		    USE sql_practice; 

CREATE TABLE Departments (
    Dept VARCHAR(50) PRIMARY KEY,
    Location VARCHAR(50)
); 

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Dept VARCHAR(50),
    Salary INT,
    FOREIGN KEY (Dept) REFERENCES Departments(Dept)
);

INSERT INTO Departments (Dept, Location) 
    VALUES
       ('HR', 'Chennai'),
       ('IT', 'Coimbatore'),
       ('Finance', 'Erode');

INSERT INTO Employees (EmpID, Name, Dept, Salary) 
	   VALUES
           (1, 'Arun', 'HR', 30000),
               (2, 'Meera', 'IT', 45000),
                   (3, 'John', 'IT', 55000),
                       (4, 'Kavin', 'Finance', 40000),
                            (5, 'Priya', 'IT', 60000);


SELECT * FROM Employees;

SELECT *
   FROM Employees
       WHERE Dept = 'IT';

select dept,count(Name) 
     as Employeescount
       from Employees
	group by dept;


SELECT Dept, MAX(Salary) 
       AS HighestSalary
          FROM Employees
	GROUP BY Dept order by HighestSalary desc;

SELECT *
        FROM Employees
             WHERE Salary > (select avg(Salary) 
FROM Employees);

select e.name,d.dept,d.location
         from departments d
           join employees e 
on d.dept = e.dept;


SELECT DISTINCT Salary,dept
     FROM Employees
        ORDER BY Salary DESC
			LIMIT 1 OFFSET 1;


select name,dept,salary 
       from employees e
          where salary > (select avg(salary)
		  from employees)
order by salary desc;

select dept,sum(salary) as toalasalay  
          from employees 
		  group by dept 
				order by toalasalay desc limit 1;

select name,salary
       from employees 
        order by salary desc 
           limit 1 offset 1;


SELECT 
    Name, Dept, Salary,
    RANK() OVER (PARTITION BY Dept ORDER BY Salary DESC) 
	AS SalaryRank
FROM Employees;

INSERT INTO Departments (Dept, Location) 
 VALUES
     ('Sales', 'Madurai'),
         ('Admin', 'Salem'),
			('Production', 'Tiruppur'),
               ('Quality', 'Karur'),
                   ('Logistics', 'Trichy'),
                        ('Marketing', 'Bangalore');

INSERT INTO Employees (EmpID, Name, Dept, Salary) 
VALUES
      (6, 'Rahul', 'HR', 32000),
         (7, 'Sneha', 'IT', 47000),
           (8, 'Vijay', 'Finance', 42000),
             (9, 'Anitha', 'Sales', 38000),
               (10, 'Surya', 'Admin', 35000),
                  (11, 'Divya', 'Production', 41000),
               (12, 'Ramesh', 'Quality', 39000),
             (13, 'Keerthi', 'Logistics', 36000),
          (14, 'Manoj', 'Marketing', 44000),
       (15, 'Lavanya', 'IT', 52000),
     (16, 'Sathish', 'Finance', 46000),
        (17, 'Nithya', 'HR', 34000),
           (18, 'Prakash', 'Production', 48000),
              (19, 'Deepa', 'Sales', 37000),
            (20, 'Arvind', 'IT', 58000),
          (21, 'Harini', 'Marketing', 43000),
	    (22, 'Mohan', 'Admin', 33000),
     (23, 'Shalini', 'Quality', 40500),
   (24, 'Bala', 'Logistics', 35500),
       (25, 'Yamini', 'Finance', 50000),
          (26, 'Karthik', 'Production', 54000),
             (27, 'Pooja', 'Sales', 39500),
                (28, 'Dinesh', 'IT', 61000),
				   (29, 'Revathi', 'HR', 31000),
					  (30, 'Gokul', 'Marketing', 45000),
						 (31, 'Sowmya', 'Admin', 34500),
                           (32, 'Ajay', 'Quality', 42000),
                              (33, 'Naveen', 'Logistics', 37000),
                                 (34, 'Aishwarya', 'Production', 56000),
                                    (35, 'Vimal', 'Finance', 47000);


select dept, avg(salary) as avgsalary
        from employees 
        group by dept 
             order by avgsalary desc;


select 
    ROUND(AVG(Salary),2) AS OverallAverageSalary
      FROM Employees;


select name,salary,dept
      from employees 
          order by salary desc limit 1 ;


SELECT Name, Dept, Salary
	FROM Employees
		WHERE Salary = (SELECT MAX(Salary) 
			FROM Employees );

select name,salary,dept
		from employees 
			order by salary desc limit 5 ;


SELECT d.Location, COUNT(name) AS EmployeeCount
	FROM Employees e
		JOIN Departments d
	ON e.Dept = d.Dept
		GROUP BY d.Location
			ORDER BY EmployeeCount DESC;

select dept,sum(salary) as highsalary
	from employees 
		group by dept 
			order by highsalary desc ;


select dept,sum(salary) as highsalary
	from employees 
    group by dept 
		order by highsalary desc limit 1;

select * from employees 
		where name like "ar%" ;


SELECT 
		MIN(Salary) AS MinSalary,
        MAX(Salary) AS MaxSalary
FROM Employees;


SELECT Name, COUNT(*) AS NameCount
	FROM Employees
		GROUP BY Name
		HAVING COUNT(*) > 1;

-- Show employees earning above their department average
select e.name,e.dept,e.salary
	from employees e
	where e.Salary > (select avg(e2.Salary) 
		from employees e2
			where e2.dept = e.dept) 
				order by e.Dept,e.Salary 
desc;


-- Rank employees by salary within each department
select 
	name,dept,salary,rank() over 
		(partition by dept order by salary desc) as salaryrank
			from employees;

-- If you DON'T want skipping ranks
select 
	name,dept,salary,dense_rank() over 
	(order by salary desc) as salaryrank
		from employees;

 -- Show top 2 salaries in each department
 
SELECT * FROM 
     (SELECT EmpID,Name,Dept,Salary,
		DENSE_RANK() OVER (PARTITION BY Dept ORDER BY Salary DESC) AS rnk
		FROM Employees)t 
			WHERE rnk <= 2
	ORDER BY Dept, Salary desc;

-- Find employees in departments located in Coimbatore 
select 
	e.name,e.dept,d.location
		from employees e
			join departments d
				on e.Dept = d.Dept
					where Location = 'Coimbatore';

-- Show departments having more than 3 employees
select dept, count(name) as emploeecount
		from employees
			group by dept
				having count(Name) > 3 ;

-- List employees in ascending order of salary
select * from employees 
	order by Salary asc;

-- Find employees with salary equal to 45,000
SELECT *
	FROM Employees
		WHERE Salary = 45000;

-- Show departments and locations
select 
	dept,location 
		from departments;

-- Count employees in IT department
select count(NAME) as emplycount
	from employees
		WHERE dept = "it";


-- Find employees from Finance department earning more than 45,000
SELECT Name, Salary
	FROM Employees
		WHERE Dept = 'Finance'
			AND Salary >= 45000;
  
  
 -- Show employees earning more than overall average salary 
select * from employees
		where Salary > (select avg(Salary) 
			from employees) 
		order by Salary desc limit 1;


  -- Show employee with lowest salary
  select * from employees
		where Salary = (select min(Salary) 
			from employees) ;

-- Find the second highest salary
  select name, dept, Salary 
		from employees
		order by Salary desc 
				limit 1 offset 1;

-- Show employees earning more than their department average 
select * from employees e
		where Salary > (select avg(Salary) 
		from employees 
				where Dept = e.Dept );

 -- Find department with highest total salary
select dept,sum(salary) as totalsalary 
		from employees 
			group by dept 
				order by totalsalary 
			desc limit 1;

-- Show departments having more than 5 employee
select dept,count(name) as oneone
		from employees 
		group by Dept
			having count(name) > 5;

-- Categorize salaries using CASE
SELECT Name, Salary,
       CASE
           WHEN Salary >= 55000 THEN 'High'
			WHEN Salary >= 40000 THEN 'Medium'
				ELSE 'Low'
	end as value from employees;


-- Show salary difference from maximum salary
SELECT Name, Salary,
       (SELECT MAX(Salary) FROM Employees) - Salary 
			AS DifferenceFromMax
	FROM employees;


-- Show annual salary of each employee
SELECT 
	Name, Salary,Salary * 12 as anuualsalary 
FROM employees;

-- Show names in uppercase and lowercase and together
select name, 
	upper(name) as uppername,
		lower(name) as lowername,
			concat(upper(left(name,1)),lower(substring(name,2)))
  from employees;
 
 
 -- Rank employees by salary
  select 
	name,dept,salary,
		rank() over (order by salary desc) 
from employees;


   -- Running dept total salary of salary
  select 
		name,dept,salary,sum(salary) over (partition by dept)
		as depttotalvalues
  from employees;
  
  -- Use CTE to find employees above average salary
WITH AvgSal AS (
    SELECT AVG(Salary) AS AvgSalary
FROM Employees
)
SELECT e.*
	FROM Employees e
	JOIN AvgSal a
	ON e.Salary > a.AvgSalary; 


-- Create a view for employee details
CREATE VIEW 
	EmployeeDetails AS
	SELECT e.EmpID, e.Name, e.Dept, e.Salary, d.Location
		FROM Employees e
		JOIN Departments d
	ON e.Dept = d.Dept;

  SELECT * FROM EmployeeDetails;
  
  -- Create an index on Dept
  create index idx_dept 
		on employees(dept);
  
  SELECT * FROM Employees 
		WHERE Dept = 'IT';




START TRANSACTION;			--  Transaction

   UPDATE Employees
   SET Salary = Salary + 5000 WHERE Dept = 'IT';
savepoint sp1;
   UPDATE Employees
   SET Salary = Salary + 5000 WHERE Dept = 'HR';
savepoint sp2;

select * from employees;
					-- change one sp1 
 rollback to  sp1;
					-- change all sp
 rollback ;
					-- save
 commit;
 
 
 with emp_dept as(select
		e.name,e.empID,e.dept,D.location,e.salary
			from employees e
			join departments d
        on e.Dept = d.dept)
        
select * from emp_dept;
  
  
  select name,salary,DEPT 	
	from employees
		where dept in ("IT","hr");
  
  
SELECT Name, Salary, Dept
		FROM Employees 	
			where dept 
		NOT IN ('IT');

SELECT e.name,e.salary
		FROM Employees e
			JOIN Departments d 
				ON e.Dept = d.Dept 
	where d.location = "Chennai";
  
SELECT * FROM Employees 
		where salary < (select avg(salary)
from employees);
  
SELECT Dept FROM Employees 
	GROUP BY Dept
		ORDER BY AVG(Salary) 
	asc LIMIT 1;
    
    

     