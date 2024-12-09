-- Write simple select statements that retrieve records from the tables without any condition. 
-- (1 Select statement per table)

SELECT * FROM course;
SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM student;
SELECT * FROM concentration;
SELECT * FROM student_concentration;


-- Write 1 simple select statement that retrieves records from all the tables using
-- some simple condition. (1 Select statement per table)

SELECT name, description FROM course WHERE id=2;
SELECT * FROM department WHERE name='Business';
SELECT * FROM concentration WHERE dept_id=4;
SELECT * FROM employee WHERE role_title='Staff';
SELECT * FROM prerequisite WHERE course_id=5;
SELECT * FROM student WHERE first_name='emily';


-- -- Write 3 advanced select statements that select data from two or more of your tables. 
-- -- You can use exists, and, join etc.
--students who got A's in there classes
SELECT first_name, last_name, emplid FROM student WHERE emplid IN (
    SELECT emplid_student FROM enrollment WHERE grade='A'
);

--faculty that gave A's to students in there classes    
SELECT * FROM employee WHERE emplid IN (
	SELECT emplid_f FROM course_section WHERE course_id IN (
		SELECT cs_id FROM enrollment WHERE grade='A'
	)
);

-- -- which courseSection has the most students enrolled, return the names of the students
SELECT first_name, last_name FROM student WHERE emplid IN (
    SELECT emplid_student FROM enrollment JOIN 
    ( SELECT MAX(cs_id) as cs, COUNT(cs_id) as count FROM enrollment GROUP BY cs_id LIMIT 1) as derived
	    ON enrollment.cs_id = derived.cs
);

-- --which department has the most concentrations
SELECT name, MAX(count) FROM department as d JOIN (
	SELECT dept_id, COUNT(dept_id) as count FROM concentration GROUP BY dept_id
) as c on d.id=c.dept_id GROUP BY count, name  LIMIT 1;


-- Write a query that retrieves students who have all A letter grades.
SELECT * FROM enrollment WHERE grade='A';

-- Write a query to retrieve the names of students who have not taken more than 5 courses.
SELECT * FROM student JOIN (
	SELECT emplid_student, COUNT(emplid_student) '# of courses' FROM enrollment GROUP BY emplid_student
) as student_count ON student.emplid = student_count.emplid_student WHERE '# of courses' < 5;

-- Write 6 update statements that update certain records based on some conditions.
UPDATE course   SET title="DSA" WHERE title='Data Structures and Algorithms';
UPDATE department SET phone="2222222" WHERE name='Mathematics';
UPDATE department SET name="Maths" WHERE name='Mathematics';
UPDATE employee SET phone="9174444444" WHERE first_name='arnold';
UPDATE student_concentration SET concentration_id=1 WHERE id=1 AND student_id=9991234;
UPDATE employee SET bdate="1965-01-08" WHERE ssn=123456789;

-- Write 3 statements that delete a record from a table based on some condition.
DELETE FROM employee WHERE ssn=987654321 ;
DELETE FROM student_concentration WHERE student_id='9992468';
DELETE FROM enrollment where emplid='9991234' AND cs_id=2;

-- Write a query to retrieve the names of students who were caught cheating in at least one course.
SELECT first_name, middle_initial, last_name FROM student WHERE emplid IN (
	SELECT emplid_student FROM enrollment WHERE cheating_incident IS NOT NULL
);

-- Write a query to retrieve the names of instructors who reported most cheating incidents.
SELECT * FROM employee JOIN (
    SELECT emplid_f, MAX(count) FROM course_section JOIN (
	    SELECT cs_id, COUNT(cs_id) count FROM enrollment WHERE cheating_incident IS NOT NULL GROUP BY cs_id
	    ) as incident ON course_section.id = incident.cs_id GROUP BY count, emplid_f LIMIT 1
) as proctor ON employee.emplid = proctor.emplid_f;

----------------------------------
-- Write a query to retrieve the names of instructors who have never reported any cheating incidents.
SELECT * FROM enrollment JOIN
	(SELECT cs_id, id FROM enrollment WHERE cheating_incident IS NULL) as derived
ON enrollment.id = derived.id WHERE  cheating_incident IS NOT NULL;

----------------------------------

-- Write a query that returns a count on all students who have never earned any A grade 
-- in all the courses they have taken.
SELECT COUNT(emplid_student) FROM enrollment WHERE grade IS NOT 'A' GROUP BY emplid_student;

-- Write a query to retrieve the names of an employee who gets paid more than any other.
SELECT name, MAX(salary) FROM employee GROUP BY salary, name LIMIT 1;

-- Write a query to retrieve the names of an employees who gets paid the least
SELECT name, MIN(salary) FROM employee GROUP BY salary, name LIMIT 1;

-- Write a query to retrieve employees who make not more than 5000 than
-- the average salaries of all the employees.
SELECT * FROM employee WHERE salary > (
	SELECT AVG(salary) FROM employee
) AND  salary < (
	SELECT AVG(salary) + 5000 FROM employee	
)