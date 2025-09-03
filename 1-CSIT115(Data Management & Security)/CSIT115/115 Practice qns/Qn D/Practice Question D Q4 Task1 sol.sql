/* (1) Insert into the database information about a trip performed by a new truck driver. A new 
       driver obtains employee number 21. His personal record is the following.               

       Harry F. Potter, born 21st , November, 1984, living in Waga Waga, Railway Street 25, NSWA 
       2767, driver license number 666, and his present status is "on leave". The driver 
       performed a trip from Sydney to Melbourne on 10th, April 2016. A driver used a truck with
       registration number PKR768.                         

       The trip consisted of the following two legs: the first leg from Sydney to Canberra and 
       then the second leg from Canberra to Melbourne.                                         */

INSERT INTO EMPLOYEE VALUES( 21, 'Harry', 'F', 'Potter', '1984-11-21', 25, 'Railway St.', 'Waga Waga', 'NSW', 2767);
INSERT INTO DRIVER VALUES( 21, 666, 'ON LEAVE');
INSERT INTO TRIP VALUES( 36, 666, 'PKR768', '2016-04-10');
INSERT INTO TRIPLEG VALUES( 36, 1, 'Sydney', 'Canberra' );
INSERT INTO TRIPLEG VALUES( 36, 2, 'Canberra', 'Melbourne' );

/* (2)	A driver with an employee number 7 decided to quit a job. Remove all information about 
        the driver and about all trips performed by the driver.                                */

DELETE FROM TRIPLEG WHERE TNUM IN (5, 13,14,17,24,27,32);
DELETE FROM TRIPLEG WHERE TNUM IN (SELECT TNUM FROM TRIP WHERE LUNM IN (SELECT LNUM FROM DRIVER WHERE ENUM=7));
DELETE FROM TRIP WHERE LNUM = 20002;
DELETE FROM TRIP WHERE LNUM IN (SELECT LNUM FROM DRIVER WHERE ENUM=7));
DELETE FROM DRIVER WHERE ENUM =7;
DELETE FROM EMPLOYEE WHERE ENUM = 7;

/* (3)	A registration number of a truck with the present registration number SST005 has been  
        changed to PKR856.                                                                     */

INSERT INTO TRUCK VALUES('NULL', 0, 0, 'JUNK');
UPDATE TRIP SET REGNUM = 'NULL'
WHERE REGNUM = 'SST005';

UPDATE TRUCK SET REGNUM = 'PKR856'
WHERE REGNUM = 'SST005';

UPDATE TRIP SET REGNUM = 'PKR856'
WHERE REGNUM = 'NULL';

DELETE FROM TRUCK WHERE REGNUM = 'NULL';
