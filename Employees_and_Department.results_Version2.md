# Employees and Departments — Results (table format)

Dataset used: all INSERT rows in your SQL (Departments + Employees EmpID 1–35).

## Departments (reference)

| Dept       | Location     |
|------------|--------------|
| HR         | Chennai      |
| IT         | Coimbatore   |
| Finance    | Erode        |
| Sales      | Madurai      |
| Admin      | Salem        |
| Production | Tiruppur     |
| Quality    | Karur        |
| Logistics  | Trichy       |
| Marketing  | Bangalore    |

## Employees (full table)

| EmpID | Name      | Dept       | Salary |
|-------:|-----------|------------|-------:|
| 1     | Arun      | HR         |  30000 |
| 2     | Meera     | IT         |  45000 |
| 3     | John      | IT         |  55000 |
| 4     | Kavin     | Finance    |  40000 |
| 5     | Priya     | IT         |  60000 |
| 6     | Rahul     | HR         |  32000 |
| 7     | Sneha     | IT         |  47000 |
| 8     | Vijay     | Finance    |  42000 |
| 9     | Anitha    | Sales      |  38000 |
| 10    | Surya     | Admin      |  35000 |
| 11    | Divya     | Production |  41000 |
| 12    | Ramesh    | Quality    |  39000 |
| 13    | Keerthi   | Logistics  |  36000 |
| 14    | Manoj     | Marketing  |  44000 |
| 15    | Lavanya   | IT         |  52000 |
| 16    | Sathish   | Finance    |  46000 |
| 17    | Nithya    | HR         |  34000 |
| 18    | Prakash   | Production |  48000 |
| 19    | Deepa     | Sales      |  37000 |
| 20    | Arvind    | IT         |  58000 |
| 21    | Harini    | Marketing  |  43000 |
| 22    | Mohan     | Admin      |  33000 |
| 23    | Shalini   | Quality    |  40500 |
| 24    | Bala      | Logistics  |  35500 |
| 25    | Yamini    | Finance    |  50000 |
| 26    | Karthik   | Production |  54000 |
| 27    | Pooja     | Sales      |  39500 |
| 28    | Dinesh    | IT         |  61000 |
| 29    | Revathi   | HR         |  31000 |
| 30    | Gokul     | Marketing  |  45000 |
| 31    | Sowmya    | Admin      |  34500 |
| 32    | Ajay      | Quality    |  42000 |
| 33    | Naveen    | Logistics  |  37000 |
| 34    | Aishwarya | Production |  56000 |
| 35    | Vimal     | Finance    |  47000 |

---

Below are results for each main SELECT (presented in the order of queries in the SQL file).

### 1) SELECT * FROM Employees WHERE Dept = 'IT';

| EmpID | Name    | Dept | Salary |
|------:|---------|------|-------:|
| 2     | Meera   | IT   | 45000  |
| 3     | John    | IT   | 55000  |
| 5     | Priya   | IT   | 60000  |
| 7     | Sneha   | IT   | 47000  |
| 15    | Lavanya | IT   | 52000  |
| 20    | Arvind  | IT   | 58000  |
| 28    | Dinesh  | IT   | 61000  |

### 2) select dept, count(Name) as Employeescount group by dept;

| Dept       | Employeescount |
|------------|----------------:|
| HR         |               4 |
| IT         |               7 |
| Finance    |               5 |
| Sales      |               3 |
| Admin      |               3 |
| Production |               4 |
| Quality    |               3 |
| Logistics  |               3 |
| Marketing  |               3 |

### 3) SELECT Dept, MAX(Salary) AS HighestSalary FROM Employees GROUP BY Dept ORDER BY HighestSalary DESC;

| Dept       | HighestSalary |
|------------|---------------:|
| IT         |          61000 |
| Production |          56000 |
| Finance    |          50000 |
| Marketing  |          45000 |
| Quality    |          42000 |
| Sales      |          39500 |
| Logistics  |          37000 |
| Admin      |          35000 |
| HR         |          34000 |

### 4) SELECT * FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees);

Overall average salary (rounded to 2 decimals): 43085.71

| EmpID | Name      | Dept       | Salary |
|------:|-----------|------------|-------:|
| 28    | Dinesh    | IT         | 61000  |
| 5     | Priya     | IT         | 60000  |
| 20    | Arvind    | IT         | 58000  |
| 34    | Aishwarya | Production | 56000  |
| 3     | John      | IT         | 55000  |
| 26    | Karthik   | Production | 54000  |
| 15    | Lavanya   | IT         | 52000  |
| 25    | Yamini    | Finance    | 50000  |
| 18    | Prakash   | Production | 48000  |
| 35    | Vimal     | Finance    | 47000  |
| 7     | Sneha     | IT         | 47000  |
| 16    | Sathish   | Finance    | 46000  |
| 2     | Meera     | IT         | 45000  |
| 30    | Gokul     | Marketing  | 45000  |
| 14    | Manoj     | Marketing  | 44000  |

### 5) Departments JOIN Employees (name, dept, location)

| Name      | Dept       | Location   |
|-----------|------------|------------|
| Arun      | HR         | Chennai    |
| Meera     | IT         | Coimbatore |
| John      | IT         | Coimbatore |
| Kavin     | Finance    | Erode      |
| Priya     | IT         | Coimbatore |
| Rahul     | HR         | Chennai    |
| Sneha     | IT         | Coimbatore |
| Vijay     | Finance    | Erode      |
| Anitha    | Sales      | Madurai    |
| Surya     | Admin      | Salem      |
| Divya     | Production | Tiruppur   |
| Ramesh    | Quality    | Karur      |
| Keerthi   | Logistics  | Trichy     |
| Manoj     | Marketing  | Bangalore  |
| Lavanya   | IT         | Coimbatore |
| Sathish   | Finance    | Erode      |
| Nithya    | HR         | Chennai    |
| Prakash   | Production | Tiruppur   |
| Deepa     | Sales      | Madurai    |
| Arvind    | IT         | Coimbatore |
| Harini    | Marketing  | Bangalore  |
| Mohan     | Admin      | Salem      |
| Shalini   | Quality    | Karur      |
| Bala      | Logistics  | Trichy     |
| Yamini    | Finance    | Erode      |
| Karthik   | Production | Tiruppur   |
| Pooja     | Sales      | Madurai    |
| Dinesh    | IT         | Coimbatore |
| Revathi   | HR         | Chennai    |
| Gokul     | Marketing  | Bangalore  |
| Sowmya    | Admin      | Salem      |
| Ajay      | Quality    | Karur      |
| Naveen    | Logistics  | Trichy     |
| Aishwarya | Production | Tiruppur   |
| Vimal     | Finance    | Erode      |

### 6) SELECT DISTINCT Salary, dept ORDER BY Salary DESC LIMIT 1 OFFSET 1

| Salary | Dept |
|-------:|------|
| 60000  | IT   |

### 7) Dept with highest total salary (select dept,sum(salary) ... order by sum desc limit 1)

| Dept | TotalSalary |
|------|------------:|
| IT   |      378000 |

(The full dept totals table is shown in section 12 below.)

### 8) Second highest salary (limit 1 offset 1)

| Name  | Salary |
|-------|-------:|
| Priya | 60000  |

### 9) Dept average salaries (dept, avg(salary) order by avgsalary desc)

| Dept       | AvgSalary  |
|------------|-----------:|
| IT         | 54000.00   |
| Production | 49750.00   |
| Finance    | 45000.00   |
| Marketing  | 44000.00   |
| Quality    | 40500.00   |
| Sales      | 38166.67   |
| Logistics  | 36166.67   |
| Admin      | 34166.67   |
| HR         | 31750.00   |

### 10) ROUND(AVG(Salary),2) AS OverallAverageSalary

| OverallAverageSalary |
|--------------------:|
|            43085.71  |

### 11) Top 1 by salary (highest)

| Name   | Salary | Dept |
|--------|-------:|------|
| Dinesh | 61000  | IT   |

### 12) Top 5 employees by salary

| Name      | Salary | Dept       |
|-----------|-------:|------------|
| Dinesh    | 61000  | IT         |
| Priya     | 60000  | IT         |
| Arvind    | 58000  | IT         |
| Aishwarya | 56000  | Production |
| John      | 55000  | IT         |

### 13) Location counts (d.Location, COUNT(name)) ORDER BY EmployeeCount DESC

| Location   | EmployeeCount |
|------------|--------------:|
| Coimbatore |             7 |
| Erode      |             5 |
| Chennai    |             4 |
| Tiruppur   |             4 |
| Bangalore  |             3 |
| Karur      |             3 |
| Madurai    |             3 |
| Salem      |             3 |
| Trichy     |             3 |

### 14) Dept totals (select dept,sum(salary) ... order by highsalary desc)

| Dept       | TotalSalary |
|------------|------------:|
| IT         |      378000 |
| Finance    |      225000 |
| Production |      199000 |
| Marketing  |      132000 |
| HR         |      127000 |
| Quality    |      121500 |
| Sales      |      114500 |
| Logistics  |      108500 |
| Admin      |      102500 |

### 15) Names like 'ar%'

| EmpID | Name   | Dept | Salary |
|------:|--------|------|-------:|
| 1     | Arun   | HR   | 30000  |
| 20    | Arvind | IT   | 58000  |

### 16) MIN(Salary), MAX(Salary)

| MinSalary | MaxSalary |
|----------:|----------:|
|     30000 |     61000 |

### 17) Duplicate names (GROUP BY Name HAVING COUNT(*) > 1)

No rows — there are no duplicate names in the dataset.

### 18) Employees earning above their department average
(ordered by Dept, Salary desc)

| Dept       | Name      | Salary |
|------------|-----------|-------:|
| Admin      | Surya     | 35000  |
| Admin      | Sowmya    | 34500  |
| Finance    | Yamini    | 50000  |
| Finance    | Vimal     | 47000  |
| Finance    | Sathish   | 46000  |
| HR         | Nithya    | 34000  |
| HR         | Rahul     | 32000  |
| IT         | Dinesh    | 61000  |
| IT         | Priya     | 60000  |
| IT         | Arvind    | 58000  |
| IT         | John      | 55000  |
| IT         | Lavanya   | 52000  |
| Production | Aishwarya | 56000  |
| Production | Karthik   | 54000  |
| Marketing  | Gokul     | 45000  |
| Quality    | Ajay      | 42000  |
| Logistics  | Naveen    | 37000  |
| Sales      | Pooja     | 39500  |

### 19) Top 2 salaries per department (Dept, EmpID, Name, Salary)

HR
| Dept | EmpID | Name   | Salary |
|------|------:|--------|-------:|
| HR   | 17    | Nithya | 34000  |
| HR   | 6     | Rahul  | 32000  |

IT
| Dept | EmpID | Name   | Salary |
|------|------:|--------|-------:|
| IT   | 28    | Dinesh | 61000  |
| IT   | 5     | Priya  | 60000  |

Finance
| Dept    | EmpID | Name   | Salary |
|---------|------:|--------|-------:|
| Finance | 25    | Yamini | 50000  |
| Finance | 35    | Vimal  | 47000  |

Sales
| Dept  | EmpID | Name  | Salary |
|-------|------:|-------|-------:|
| Sales | 27   | Pooja | 39500  |
| Sales | 9    | Anitha| 38000  |

Admin
| Dept | EmpID | Name  | Salary |
|------|------:|-------|-------:|
| Admin| 10   | Surya | 35000 |
| Admin| 31   | Sowmya| 34500 |

Production
| Dept      | EmpID | Name      | Salary |
|-----------|------:|-----------|-------:|
| Production| 34   | Aishwarya | 56000 |
| Production| 26   | Karthik   | 54000 |

Quality
| Dept   | EmpID | Name   | Salary |
|--------|------:|--------|-------:|
| Quality| 32   | Ajay   | 42000 |
| Quality| 23   | Shalini| 40500 |

Logistics
| Dept     | EmpID | Name    | Salary |
|----------|------:|---------|-------:|
| Logistics| 33   | Naveen  | 37000 |
| Logistics| 13   | Keerthi | 36000 |

Marketing
| Dept      | EmpID | Name  | Salary |
|-----------|------:|-------|-------:|
| Marketing | 30   | Gokul | 45000 |
| Marketing | 14   | Manoj | 44000 |

### 20) Employees in location 'Coimbatore' (Join on Departments -> IT)

Same rows as the IT employees table (see section 1).

### 21) Departments having more than 3 employees

| Dept       | Count |
|------------|------:|
| HR         |     4 |
| IT         |     7 |
| Finance    |     5 |
| Production |     4 |

### 22) Employees ordered by Salary ASC (first 10 shown)

| EmpID | Name    | Dept      | Salary |
|------:|---------|-----------|-------:|
| 1     | Arun    | HR        | 30000  |
| 29    | Revathi | HR        | 31000  |
| 6     | Rahul   | HR        | 32000  |
| 22    | Mohan   | Admin     | 33000  |
| 17    | Nithya  | HR        | 34000  |
| 31    | Sowmya  | Admin     | 34500  |
| 10    | Surya   | Admin     | 35000  |
| 24    | Bala    | Logistics | 35500  |
| 13    | Keerthi | Logistics | 36000  |
| 19    | Deepa   | Sales     | 37000  |

(full ascending list is the Employees table sorted by Salary)

### 23) Employees with Salary = 45000

| EmpID | Name  | Dept      | Salary |
|------:|-------|-----------|-------:|
| 2     | Meera | IT        | 45000  |
| 30    | Gokul | Marketing | 45000  |

### 24) Departments and locations

(see Departments table above)

### 25) Count employees in IT department

| emplycount |
|-----------:|
|          7 |

### 26) Finance employees with Salary >= 45000

| Name    | Salary |
|---------|-------:|
| Sathish | 46000  |
| Yamini  | 50000  |
| Vimal   | 47000  |

### 27) Employee with lowest salary

| EmpID | Name | Dept | Salary |
|------:|------|------|-------:|
| 1     | Arun | HR   | 30000  |

### 28) Second highest salary row (name,dept,salary)

| Name  | Dept | Salary |
|-------|------|-------:|
| Priya | IT   | 60000  |

### 29) Departments having more than 5 employees

| Dept | Count |
|------|------:|
| IT   |     7 |

### 30) Salary categories (CASE)

Example rows:

| Name   | Salary | Category |
|--------|-------:|---------:|
| Dinesh | 61000  | High     |
| Priya  | 60000  | High     |
| Arvind | 58000  | High     |
| Lavanya| 52000  | Medium   |
| Arun   | 30000  | Low      |
| Surya  | 35000  | Low      |

### 31) Difference from max salary (MAX = 61000) example rows

| Name   | Salary | DifferenceFromMax |
|--------|-------:|------------------:|
| Dinesh | 61000  |                0  |
| Priya  | 60000  |             1000  |
| Arvind | 58000  |             3000  |

### 32) Annual salary example rows (Salary * 12)

| Name   | Salary | AnnualSalary |
|--------|-------:|-------------:|
| Dinesh | 61000  |      732000  |
| Priya  | 60000  |      720000  |
| Arvind | 58000  |      696000  |

### 33) Upper/lower/proper case examples

| Name   | uppername | lowername | Proper-case |
|--------|-----------|-----------|-------------|
| Arun   | ARUN      | arun      | Arun        |
| Meera  | MEERA     | meera     | Meera       |

### 34) Running dept total (sum over partition) example rows

| Name   | Dept  | Salary | DeptTotalValues |
|--------|-------|-------:|----------------:|
| Arun   | HR    | 30000  |         127000  |
| Rahul  | HR    | 32000  |         127000  |
| Nithya | HR    | 34000  |         127000  |
| Revathi| HR    | 31000  |         127000  |

### 35) CTE AvgSal -> employees above overall average

Same rows as section 4 (Employees with Salary > overall avg).

### 36) EmployeeDetails view SELECT * FROM EmployeeDetails

| EmpID | Name      | Dept       | Salary | Location   |
|------:|-----------|------------|-------:|------------|
| 1     | Arun      | HR         | 30000  | Chennai    |
| 2     | Meera     | IT         | 45000  | Coimbatore |
| ...   | ...       | ...        | ...    | ...        |
| 35    | Vimal     | Finance    | 47000  | Erode      |

(Full rows identical to the Departments JOIN Employees table above.)

### 37) dept IN ("IT","hr") — employees from IT and HR

(IT rows in section 1; HR rows:)

| EmpID | Name  | Dept | Salary |
|------:|-------|------|-------:|
| 1     | Arun  | HR   | 30000 |
| 6     | Rahul | HR   | 32000 |
| 17    | Nithya| HR   | 34000 |
| 29    | Revathi| HR  | 31000 |

### 38) Employees NOT IN ('IT')

All employees except the 7 IT rows shown in section 1.

### 39) Employees where department location = 'Chennai' (HR)

| Name   | Salary |
|--------|-------:|
| Arun   | 30000 |
| Rahul  | 32000 |
| Nithya | 34000 |
| Revathi| 31000 |

### 40) Employees with salary < overall average (43085.71)

Example first rows:

| EmpID | Name   | Salary |
|------:|--------|-------:|
| 1     | Arun   | 30000  |
| 29    | Revathi| 31000  |
| 6     | Rahul  | 32000  |
| 22    | Mohan  | 33000  |
| 17    | Nithya | 34000  |
| ...   | ...    | ...    |

### 41) Dept with lowest avg salary (ORDER BY AVG(Salary) ASC LIMIT 1)

| Dept |
|------|
| HR   |

---

End of results markdown file.