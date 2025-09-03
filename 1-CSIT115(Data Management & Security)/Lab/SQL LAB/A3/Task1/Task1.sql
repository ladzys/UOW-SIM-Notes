-- Task 1
-- CREATE 3 USERS
CREATE USER mohamedh027_1 IDENTIFIED BY 'mohamedh027_1';
CREATE USER mohamedh027_2 IDENTIFIED BY 'mohamedh027_2';
CREATE USER mohamedh027_3 IDENTIFIED BY 'mohamedh027_3';

-- Grant alter, drop, read & write, grant other users TO mohamed027_1
GRANT ALTER, DROP, SELECT, INSERT, UPDATE, DELETE ON mohamedh027.* TO mohamedh027_1
WITH GRANT OPTION;

GRANT CREATE VIEW, SELECT ON mohamedh027.customer to mohamedh027_2;
GRANT CREATE VIEW, SELECT ON mohamedh027.member to mohamedh027_2;

ALTER USER mohamedh027_3 WITH MAX_QUERIES_PER_HOUR 100;
ALTER USER mohamedh027_3 WITH MAX_UPDATES_PER_HOUR 10;

ALTER USER mohamedh027_2 PASSWORD EXPIRE;

-- SELECT user, select_priv, insert_priv, update_priv, delete_priv, alter_priv,drop_priv,grant_priv
-- FROM mysql.db WHERE user='mohamedh027_1';

SELECT * FROM mysql.db;
SELECT * FROM mysql.user;
SELECT * FROM mysql.tables_priv;
SELECT * FROM mysql.columns_priv;

SELECT User, max_questions, max_updates, password_expired FROM mysql.user WHERE User LIKE 'mohamedh027%';
SELECT User, Select_priv, Insert_priv, Update_priv, Delete_priv, Drop_priv, Grant_priv, Alter_priv FROM mysql.db WHERE User LIKE 'mohamedh027%';
SELECT Db, User, Table_name, Table_priv FROM mysql.tables_priv WHERE USER LIKE 'mohamedh027%';

-- TASK 2
SELECT * FROM CUSTOMER2;
SELECT * FROM CUSTOMER;

SELECT * FROM CUSTOMER2
WHERE (CNum) NOT IN 
			(SELECT CNum FROM CUSTOMER);
            
SELECT * FROM CUSTOMER
WHERE (CNum) NOT IN 
			(SELECT CNum FROM CUSTOMER2);
            
SELECT *
FROM customer c
JOIN customer2 z ON c.cnum = z.cnum
WHERE
    c.cname != z.cname OR
    c.cemail != z.cemail;
    
-- TASK 3
SELECT R.CClub, R.CNum, R.PointstoUpgrade, C.CName, CONCAT ('A member which is an elite member should NOT be a regular member') AS Violation,
CONCAT ('A member with the customer number of ', R.Cnum, ' and having the name ', C.CName, ' is both an elite member and a regular member') AS Verification
FROM regularmember R
JOIN customer C
ON R.Cnum = C.Cnum
WHERE EXISTS (SELECT * FROM elitemember E WHERE E.Cnum = R.Cnum);

SELECT * FROM member;
SELECT * FROM regularmember;
SELECT * FROM elitemember;

-- Task 4
SET GLOBAL general_log = 'ON';
SET GLOBAL log_output = 'TABLE';
DESCRIBE mysql.general_log;
-- RUN A3TASK4

SELECT SUBSTRING(CONVERT (argument USING utf8), 1, 6) AS command, event_time 
FROM mysql.general_log
WHERE
	command_type IN ('Query') AND
    (argument LIKE 'CREATE%' OR
    argument LIKE 'ALTER%' OR
    argument LIKE 'DROP%')
GROUP BY command, event_time
ORDER BY event_time;

SELECT SUBSTRING(CONVERT (argument USING utf8), 1, 6) AS command, COUNT(*) 
FROM mysql.general_log
WHERE
	command_type IN ('Query') AND
    (argument LIKE 'SELECT%' OR
    argument LIKE 'INSERT%' OR
    argument LIKE 'DELETE%' OR
    argument LIKE 'UPDATE%')
GROUP BY command
ORDER BY COUNT(*) DESC;

SET GLOBAL general_log='OFF'




