-- 1. Using nested query retrieve the names of all employees who have two or more dependents.
SELECT FNAME,LNAME FROM EMPLOYEE WHERE (SELECT COUNT(*) FROM DEPENDENT WHERE SSN=ESSN)>=2;
-- 2. Using nested query Retrieve the name of each employee who has a dependent with the same first name and is the same sex as the employee.
SELECT FNAME,LNAME FROM EMPLOYEE AS E WHERE E.SSN IN (SELECT ESSN FROM DEPENDENT AS D WHERE D.DEPENDENT_NAME=E.FNAME AND E.SEX=D.SEX);
-- 3. Using nested query retrieve names of employees whose salary is greater than the salary of all the employees in department 5.
SELECT FNAME,LNAME FROM EMPLOYEE WHERE SALARY > ALL(SELECT SALARY FROM EMPLOYEE WHERE DNO=5);
-- 4. Retrieve the names of employees who have no dependents.( use Exists/Not Exists)
SELECT FNAME,LNAME FROM EMPLOYEE WHERE NOT EXISTS(SELECT * FROM DEPENDENT WHERE SSN=ESSN);
-- 5. List the names of managers who have at least one dependent.
SELECT DISTINCT FNAME,LNAME FROM EMPLOYEE AS E,DEPARTMENT AS D,DEPENDENT AS F WHERE E.SSN=D.MGR_SSN AND E.SSN=F.ESSN;
-- OR
SELECT FNAME,LNAME FROM EMPLOYEE WHERE EXISTS (SELECT * FROM DEPENDENT WHERE SSN = ESSN)
AND 
EXISTS (SELECT * FROM DEPARTMENT WHERE SSN = MGR_SSN);
-- 6.	Using natural Join retrieve the name and address of every employee who works for the ‘Research’ department. 
SELECT FNAME,LNAME,ADDRESS FROM EMPLOYEE AS E,DEPARTMENT AS D WHERE E.DNO=D.DNUMBER AND D.DNAME='RESEARCH';