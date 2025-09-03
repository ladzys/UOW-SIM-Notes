/* Implement SQL script solution1.sql that contains implementations of the following queries as   
   SELECT statements.											*/

/* (1)	Find the driver license numbers (attribute LNUM) of all drivers who performed at least one trip 
        in 2015 or at least one trip in 2016.	   	    		    	      	       	   	*/

SELECT DISTINCT LNUM
FROM TRIP
WHERE TRIP_DATE >= '2015-01-01' AND TRIP_DATE <= '2016-12-31';

/* (2)	Find the driver license numbers (attribute LNUM) of all drivers who performed at least one trip 
        in 2015 and at least one trip in 2016.	   	    		    	      	       	   	*/

SELECT DISTINCT T2015.LNUM
FROM TRIP T2015 JOIN TRIP T2016
             ON T2015.LNUM = T2016.LNUM
WHERE T2015.TRIP_DATE >= '2015-01-01' AND T2015.TRIP_DATE <= '2015-12-31' AND
      T2016.TRIP_DATE >= '2016-01-01' AND T2016.TRIP_DATE <= '2016-12-31';

/* (3)	Find the driver license numbers (attribute LNUM) of all drivers together with the total number 
        of trips performed by each driver. You may ignore the drivers who performed no trips so far. 
	For each driver list a driver license number to together with the total number of trips in one
	line, then next driver license number with the total number of trips in the next line, and so 
	on.												*/

SELECT LNUM, count(*)
FROM TRIP
GROUP BY LNUM;

/* (4)	Find the driver license numbers (attribute LNUM) of all drivers who performed more than 3 
   	trips.												*/

SELECT LNUM, count(*)
FROM TRIP
GROUP BY LNUM
HAVING count(*) > 3;


/* (5)	Find full names of all drivers whose present status is “on leave”.				*/

SELECT FNAME, INITIALS, LNAME
FROM EMPLOYEE JOIN DRIVER
              ON EMPLOYEE.ENUM = DRIVER.ENUM
WHERE UPPER(DRIVER.STATUS) = 'ON LEAVE';
