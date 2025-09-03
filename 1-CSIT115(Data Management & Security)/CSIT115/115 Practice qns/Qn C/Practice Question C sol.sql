/* (5) Grants read privileges on entire database prefix of your University email to 
       a user prefix of your University email account_1. The privileges must be granted such that 
       a user prefix of your University email account_1 is not allowed to grant the same privileges to
       another user.											*/

GRANT SELECT on tkt.* TO tkt_1;

/* (6) Next, grants read and write privileges on a relational table EMPLOYEE located in 
       a database prefix of your University email to a user prefix of your University email account_2.
       The privileges must be granted such that a user prefix of your University email account_2 is 
       able to grant the same privileges to the other users.						*/

GRANT SELECT ON tkt.EMPLOYEE TO tkt_2 WITH GRANT OPTION;
GRANT DELETE ON tkt.EMPLOYEE TO tkt_2 WITH GRANT OPTION;
GRANT INSERT ON tkt.EMPLOYEE TO tkt_2 WITH GRANT OPTION;
GRANT UPDATE ON tkt.EMPLOYEE TO tkt_2 WITH GRANT OPTION;

/* (7) Next, grants a privilege to create a relational table located in a database prefix of
       your University email to a user prefix of your University email account_3       		       */

GRANT CREATE ON tkt.* TO tkt_3;

/* (8) Next, the script grants a privilege to read the columns (ENUM, FNAME, INITIALS, LNAME)  in
       a relational table EMPLOYEE located in a database prefix of your University email to a user 
       prefix of your University email account_3.							*/

GRANT SELECT (ENUM, FNAME, INITIALS, LNAME) ON tkt.EMPLOYEE  TO tkt_3;

/* (9) Finally, lists all privileges granted to the users prefix of your University email
       account_1, prefix of your University email account_2, and prefix of your University email
       account_3.											*/

SELECT user, db, select_priv, insert_priv, update_priv, delete_priv, grant_priv, create_priv
FROM mysql.db 
WHERE user IN ('tkt_1', 'tkt_2', 'tkt_3');

SELECT user, db, table_name, table_priv, column_priv
FROM mysql.tables_priv
WHERE user IN ('tkt_1', 'tkt_2', 'tkt_3');

SELECT user, db, table_name, column_name, column_priv
FROM mysql.columns_priv
WHERE user IN ('tkt_1', 'tkt_2', 'tkt_3');
