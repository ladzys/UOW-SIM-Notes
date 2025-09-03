-- Assignment 2 Task 2
-- Task 2A Retrieve trainers who have more than one certificate
-- Display empId, name, dob, trainYears
-- SELECT * FROM Trainer;
-- SELECT * FROM Qualification;

SELECT trainer.*
FROM trainer,qualification
WHERE empID = trainer
GROUP BY trainer
HAVING COUNT(*) > 1;

-- Task 2B
-- Retrieve courses that have been offered more than two times. For each record, display
-- the following columns in ascending order of course code.
-- course code, course name
-- offered course start date, offered course end date, offered course trainer’s name
-- SELECT * FROM OfferedCourse;
-- SELECT * FROM Trainer;
-- SELECT * FROM Course;
-- 2b backup

SELECT o.code, c.name, o.startDate, o.endDate, t.name
FROM course c
JOIN offeredcourse o
ON o.code = c.code
JOIN trainer t
ON o.trainer = t.empid
WHERE o.code in 
(SELECT code FROM offeredcourse
GROUP BY code
HAVING COUNT(code)>2
ORDER BY o.code ASC);

-- TASK 2C

SELECT t.refid, t.name, t.workyears, t.worktype, c.code, c.name, e.odate
FROM Course c JOIN Enrolment e
ON c.code = e.ocourse
JOIN trainee t ON t.refid = e.trainee
WHERE workyears > 15
ORDER BY refid ASC;

-- TASK 2D
DELETE FROM trainer WHERE name='Heng Hoon';

-- TASK 2E
INSERT INTO Course (code, category,name,level)
VALUES ('C501', 'Language', 'Mandarin', 1);
INSERT INTO OfferedCourse(code, startdate, enddate, duration, trainer)
VALUES ('C501','2024-02-18', '2024-02-18', 1, 'T021');