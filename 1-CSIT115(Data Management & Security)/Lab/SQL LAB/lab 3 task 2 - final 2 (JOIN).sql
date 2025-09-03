-- Join (inner join)
-- PK of 1 table 'linked' to FK of another table
-- The result is columns from both tables
-- Can join 2 or MORE tables

 -- Practice 1

SELECT * 
FROM department, course
WHERE name = offered_by; -- Join condition

-- Another way of writing join
SELECT *
FROM department JOIN course
ON name = offered_by;

-- Join conditions
SELECT name,code,course.* -- (.* means all columns from that table)
FROM department,course
WHERE name = offered_by
AND credits =6;

-- Find courses offered by department without chairperson

SELECT name,code,course.*
FROM department,course
WHERE name = offered_by
AND chair IS NULL;
-- Courses offered by CSCI and MATH
SELECT name,code,course.*
FROM department,course
WHERE name = offered_by
AND (code = 'CSCI' OR code ='MATH');
-- Alternatively, use IN ()
SELECT name,code,course.*
FROM department,course
WHERE name = offered_by
AND code IN ('CSCI' ,'MATH');
-- Switch to the database for lab 3

SELECT * FROM employee;
SELECT * FROM jobHistory;
SELECT * FROM job;


-- employee_id, first_name, job_title, min_salary, max_salary
SELECT E.employee_id, E.first_name,E.job_title,
       min_salary,max_salary
FROM employee E, job jb -- ALias needed to identify the 2 job_titles from 2 different tables
WHERE E.job_title = jb.job_title;

-- employee_id,first_name,job_title,salary
-- min_salary,max_salary
-- job_title contains manager
SELECT E.employee_id, E.first_name,E.job_title,
       min_salary,max_salary
FROM employee E, job Jb
WHERE E.job_title = jb.job_title
AND   E.job_title LIKE '%manager%';

-- Employee and job history
-- employee_id, first_name, hire_date, salary, jobHistory.*
SELECT E.employee_id,first_name,hire_date,salary,JH.*
FROM employee E, jobHistory JH
WHERE E.employee_id = JH.employee_id;

-- Rewrite the same query using JOIN ... ON
SELECT E.employee_id, first_name, hire_date, salary, JH.*
FROM employee E JOIN jobHistory JH
ON E.employee_id = JH.employee_id;


-- OUTER JOIN
SELECT E.employee_id, first_name, hire_date, salary, JH.*
FROM employee E LEFT JOIN jobHistory JH 
ON E.employee_id = JH.employee_id;

SELECT E.employee_id, first_name, hire_date, salary, JH.*
FROM  jobHistory JH RIGHT JOIN employee E 
ON E.employee_id = JH.employee_id;

-- Subquery (nested query)
-- Employees without record in jobHistory
SELECT *
FROM  employee
WHERE employee_id NOT IN (SELECT employee_id FROM jobHistory);

-- Use outer join to get the same result
SELECT E.employee_id, first_name, JH.*
FROM employee E LEFT JOIN jobHistory JH 
ON   E.employee_id = JH.employee_id
WHERE JH.employee_id IS NULL;

-- More examples on subquery
SELECT employee_id FROM employee;
SELECT MAX(salary) FROM employee;

SELECT * 
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);

-- Employees with salary > average salary
-- employee id, first_name,salary
SELECT employee_id, first_name, salary
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);

-- Departments with employee(s) earning < 3000
SELECT *
FROM department
WHERE department_name IN
(SELECT department_name
FROM employee 
WHERE salary < 3000);

-- GROUP BY
SELECT COUNT(*)
FROM employee;

SELECT department_name, COUNT(*) 
FROM   employee
GROUP BY department_name;

SELECT job_title, 
       COUNT(*) AS "Employee count",
       MAX(salary) AS "Richest"
FROM employee
GROUP BY job_title;







SELECT employee_id FROM employee;
SELECT employee_id FROM jobHistory;

