-- CREATE 3 USERS
CREATE USER user1 IDENTIFIED BY 'test';
CREATE USER user2 IDENTIFIED BY 'test';
CREATE USER user3 IDENTIFIED BY 'test';

-- STEP 4
GRANT SELECT ON lab4.* TO user1;
-- STEP 5
GRANT INSERT, UPDATE, DELETE ON lab4.employee to user2
WITH GRANT OPTION;

-- STEP 6
GRANT CREATE ON lab4.* to user3;
-- STEP 7
GRANT SELECT (department_name,street_address,city,country_name) ON lab4.department TO user3;

-- Check privileges granted to the various users
SELECT * FROM mysql.db;
SELECT * FROM mysql.tables_priv;
SELECT * FROM mysql.columns_priv;
-- Checking
SELECT * FROM mysql.user;
SELECT * FROM employee;