-- WITH clause
WITH country_emp AS
( 
SELECT country_name, employee_id, first_name, job_title
FROM department D, employee E
WHERE D.department_name = E.department_name
)
SELECT *
FROM country_emp
WHERE country_name IN ('mexico','china');

WITH country_emp AS
( 
SELECT country_name, employee_id, first_name, job_title
FROM department D, employee E
WHERE D.department_name = E.department_name
)
SELECT *
FROM country_emp
WHERE job_title LIKE '%manager%';

WITH country_emp_count AS
(
SELECT country_name, COUNT(*) AS emp_count
FROM department D, employee E
WHERE D.department_name = E.department_name
GROUP BY country_name
)
SELECT *
FROM  country_emp_count
WHERE country_name = 'china';

WITH country_emp_count AS
(
SELECT country_name, COUNT(*) AS emp_count
FROM department D, employee E
WHERE D.department_name = E.department_name
GROUP BY country_name
)
SELECT *
FROM  country_emp_count
WHERE emp_count >6;

WITH country_emp_count AS
(
SELECT country_name, COUNT(*) AS emp_count
FROM department D, employee E
WHERE D.department_name = E.department_name
GROUP BY country_name
)
SELECT *
FROM  country_emp_count
WHERE emp_count = 
(SELECT MIN(emp_count)
FROM country_emp_count
);