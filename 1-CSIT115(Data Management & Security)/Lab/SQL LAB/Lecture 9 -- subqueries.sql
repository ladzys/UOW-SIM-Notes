-- Lecture 9(Lab 3 database)
-- Jobs with employee
SELECT *
FROM job
WHERE job_title IN (SELECT job_title FROM employee);

-- Rewrite using correlated subquery
SELECT *
FROM job J
WHERE EXISTS (SELECT * 
				 FROM employee
                 WHERE job_title = J.jobtitle);
                 
-- Jobs with no employees
SELECT *
FROM job
WHERE job_title NOT IN (SELECT job_title FROM employee);

-- Rewrite using correlated subquery

-- Departments with employees
SELECT *
FROM department
WHERE department_name IN (SELECT department_name FROM employee);

-- Correlated subquery
SELECT *
FROM department D
WHERE EXISTS (SELECT *
              FROM employee
              WHERE department_name = D.department_name);
              
-- Departments without employees
SELECT *
FROM department 
WHERE department_name NOT IN (SELECT department_name 
							  FROM employee
                              WHERE department_name IS NOT NULL);

SELECT *
FROM department D
WHERE NOT EXISTS (SELECT *
                  FROM employee
                  WHERE department_name = D.department_name);
                  
-- Union (SET operator)
-- "Meaningless" example, just to explain UNION operator
SELECT region_name 	FROM region
UNION 
SELECT department_name FROM department;

-- Better example

SELECT department_name, country_name, manager_id
FROM department
WHERE country_name = 'china'
UNION -- (or OR)
SELECT department_name, country_name, manager_id
FROM department
WHERE manager_id = 100;
-- Last example
-- Find all the 'accountant', past and present
SELECT employee_id, job_title, start_date
FROM jobHistory
WHERE job_title LIKE '%account%'
UNION
SELECT employee_id, job_title, hire_date
FROM   employee
WHERE job_title LIKE '%account%';

--

SELECT salary, salary * 10 AS salary_10_times
FROM employee 

-- View
  -- All employees
SELECT employee_id, first_name, email, job_title, department_name
FROM employee
WHERE job_title LIKE '%manager%';

CREATE OR REPLACE VIEW emp_mgr
(Id, name, email, job, department) AS
SELECT employee_id, first_name, email, job_title, department_name
FROM employee
WHERE job_title LIKE '%manager%';

SELECT * FROM emp_mgr;

SELECT * 
FROM emp_mgr
WHERE department_name = 'Shipping';

SELECT department_name, COUNT(*)
FROM emp_mgr
GROUP BY department_name;

-- View + GROUP BY
CREATE OR REPLACE VIEW country_emp (country, emp_count) AS
SELECT  country_name, COUNT(*)
FROM    employee E, department D
WHERE   E.department_name = D.department_name
GROUP BY country_name;

SELECT * 
FROM country_emp
WHERE country IN ('china', 'india');

-- find countries with the least employee count
SELECT * 
FROM country_emp
WHERE emp_count = (SELECT MIN(emp_count) FROM country_emp);


SELECT * FROM job;
SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM jobHistory;
SELECT * FROM country;


 
