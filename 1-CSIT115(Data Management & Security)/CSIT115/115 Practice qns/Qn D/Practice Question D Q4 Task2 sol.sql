/* (1)	Find full names of employees living in states NSW or WA.                               */

SELECT fname, initials, lname
FROM EMPLOYEE WHERE state IN('NSW', 'WA');

/* (2)	Find full information about trucks that are not available just now.                    */

SELECT *
FROM TRUCK
WHERE status <> 'AVAILABLE';

/* (3)	Find dates of all trips performed by a driver with license number 10001 who used a truck 
        different from a truck with registration PKR768.                                       */

SELECT trip_date
FROM TRIP
WHERE LNUM = 10001 AND REGNUM <> 'PKR768';

/* (4)	List all information about the trips performed by the drivers with license numbers 10001, 
        10002, and 10003. List the result in the descending order of license numbers and for all 
        trips with the same license number in the ascending orders of truck registration numbers. 
                                                                                               */
SELECT *
FROM TRIP
WHERE LNUM IN (10001, 10002, 10003)
ORDER BY LNUM DESC, REGNUM ASC;

/* (5)	List full names of all employees in uppercase format in the descending order of last 
        names.                                                                                 */

SELECT UPPER(fname), UPPER(initials), UPPER(lname)
FROM EMPLOYEE
ORDER BY lname DESC;

