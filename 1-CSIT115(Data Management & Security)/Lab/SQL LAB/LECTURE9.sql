-- LECTURE 9
-- Jobs w employee (a)
SELECT * 
FROM job
WHERE job_title IN (SELECT job_title FROM employee);

-- rewrite (a)
SELECT *
FROM job j
WHERE EXISTS (SELECT *
				FROM employee 
				WHERE job_title = j.job_title);
                
-- jobs w no employee (b)
SELECT *
FROM job 
WHERE job_title NOT IN 
				(SELECT job_title FROM employee);
-- REWRITE (b)
SELECT * 
FROM job j 
WHERE NOT EXISTS (SELECT *
					FROM employee
                    WHERE job_title = j.job_title);
                    
-- departments with employees (c)
SELECT * 
FROM department
WHERE department_name IN (SELECT department_name FROM employee);

-- rewrite (c)
SELECT *
FROM department d
WHERE EXISTS (SELECT *
				FROM employee 
				WHERE department_name = d.department_name);
                
-- departments without employees (d)
SELECT * 
FROM department
WHERE department_name NOT IN (SELECT department_name FROM employee
								WHERE department_name IS NOT NULL);

-- REWRITE (d)
SELECT *
FROM department d
WHERE NOT EXISTS (SELECT *
				FROM employee 
				WHERE department_name = d.department_name);
                
-- UNION (set operator)
-- "Meaingless" example
SELECT region_name FROM region
UNION
SELECT department_name from department;

-- BETTER EXAMPLE OF UNION
SELECT department_name, country_name, manager_id
FROM department
WHERE country_name='china'
UNION
SELECT department_name, country_name, manager_id
FROM department
WHERE manager_id = 100;

-- FIND ALL 'ACCOUNTANT', PAST AND PRESENT
SELECT employee_id, job_title, start_date
FROM jobHistory
WHERE job_title LIKE '%account%'
UNION
SELECT employee_id, job_title, hire_date
FROM employee
WHERE job_title LIKE '%account%';

                
SELECT * FROM job;
SELECT * FROM employee;
SELECT* FROM department;

