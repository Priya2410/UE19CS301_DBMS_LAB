SELECT FNAME AS FIRST_NAME,LNAME AS LAST_NAME,SALARY AS OLD_SALARY,1.1*SALARY AS NEW_SALARY FROM EMPLOYEE E,WORKS_ON W,PROJECT P WHERE E.SSN=W.ESSN AND W.PNO=P.PNUMBER AND P.PNAME='PRODUCTX';
SELECT SUM(SALARY), MAX(SALARY), MIN(SALARY), AVG(SALARY) FROM EMPLOYEE;
SELECT COUNT(DISTINCT SALARY) AS "COUNT_SALARY" FROM EMPLOYEE;
SELECT LNAME,FNAME FROM EMPLOYEE WHERE(SELECT COUNT(*) FROM DEPENDENT WHERE SSN=ESSN)>=2;
SELECT DNO,COUNT(*),AVG(SALARY) FROM EMPLOYEE GROUP BY DNO;
SELECT LNAME FROM EMPLOYEE WHERE SALARY >= 10000+(SELECT MIN(SALARY) FROM EMPLOYEE);
SELECT FNAME,LNAME FROM EMPLOYEE WHERE DNO =( SELECT DNO FROM EMPLOYEE WHERE SALARY =(SELECT MAX(SALARY) FROM EMPLOYEE) );
SELECT DNAME,COUNT(*) FROM DEPARTMENT,EMPLOYEE WHERE DNUMBER=DNO AND SALARY>40000 GROUP BY DNAME;