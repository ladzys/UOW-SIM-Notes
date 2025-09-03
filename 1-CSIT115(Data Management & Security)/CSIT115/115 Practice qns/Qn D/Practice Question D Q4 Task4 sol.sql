/* Implement SQL script solution2.sql that contains implementations of the following queries as 
   SELECT statements.											*/

/* (1)	Find full names of all drivers who used a truck with a registration PKR856 at least one time.   */

SELECT FNAME, INITIALS, LNAME
FROM EMPLOYEE JOIN DRIVER
              ON EMPLOYEE.ENUM = DRIVER.ENUM
	      JOIN TRIP
	      ON DRIVER.LNUM = TRIP.LNUM
WHERE TRIP.REGNUM = 'PKR856';

/* (2)	Find the pairs of truck registration number (attribute REGNUM) and driver license number 
        (attribute LNUM) such that the present status of a truck is different from the present status 
	of a driver.											*/

SELECT REGNUM, LNUM
FROM DRIVER JOIN TRUCK
            ON DRIVER.STATUS <> TRUCK.STATUS;

/* (3)	Find the numbers of trips (attribute TNUM) of all trips that included 2 successive (adjacent) 
        legs from Melbourne to Sydney and from Sydney back to Melbourne. This query must be implemented 
	as a self-join query !										*/

SELECT TL1.TNUM
FROM TRIPLEG TL1 JOIN TRIPLEG TL2
                 ON TL1.TNUM = TL2.TNUM AND
		    TL1.LEGNUM+1 = TL2.LEGNUM
WHERE TL1.DEPARTURE = 'Melbourne' AND
      TL1.DESTINATION = 'Sydney' AND
      TL2.DEPARTURE = 'Sydney' AND
      TL2.DESTINATION = 'Melbourne';
      
/* (4)	Find the driver license numbers (attribute LNUM) of all drivers together with the registration
   	numbers of all trucks used by the drivers. If a driver has not used any truck so far then his
	driver license number must be listed with NULL.							*/

SELECT DISTINCT DRIVER.LNUM, TRIP.REGNUM
FROM DRIVER LEFT OUTER JOIN TRIP
            ON DRIVER.LNUM = TRIP.LNUM;
	    
/* (5)	Find the driver license numbers (attribute LNUM) of all drivers together with the total number 
        of trips performed by each driver. If a driver performed no trips so far then his driver license
        number must be listed with 0. For each driver list a driver license number to together with the
        total number of trips in one line, then next driver license number with the total number of 
	trips in the next line, and so on.								*/
 
SELECT DRIVER.LNUM, COUNT(TRIP.REGNUM)
FROM DRIVER LEFT OUTER JOIN TRIP
            ON DRIVER.LNUM = TRIP.LNUM
GROUP BY DRIVER.LNUM;
