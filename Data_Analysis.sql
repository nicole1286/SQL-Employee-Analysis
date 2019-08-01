--Q#2-STAFF HIRED IN 1986 ONLY--
SELECT first_name, last_name, hire_date
FROM public."Employees"
WHERE 
	hire_date >= '1986-01-01'
	AND hire_date <= '1986-12-31'
ORDER BY "hire_date" ASC;
--Q#1- ALL EMPLOYEE DETAILS--
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM public."Employees" e
JOIN public."Salaries" s
ON (e.emp_no = s.emp_no)
ORDER BY "salary" DESC;
--Q#3- DEPT MGR LIST-- 
SELECT m.dept_no, m.emp_no, e.first_name, e.last_name, m.from_date, m.to_date, d.dept_name
FROM public."Managers" m
JOIN public."Departments" d
ON (m.dept_no=d.dept_no)
	JOIN public."Employees" e
	ON (m.emp_no=e.emp_no)
ORDER BY "last_name" ASC;
--Q#4- EMPLOYEE DEPT LIST--
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM public."Employees" e
JOIN public."Managers" m 
ON (e.emp_no=m.emp_no)
JOIN public."Departments" d 
ON (m.dept_no=d.dept_no);
--Q#5- NAME OF HERCULES B ONLY--
SELECT *
FROM public."Employees"
WHERE
	first_name = 'Hercules'
	AND last_name LIKE 'B%';
--Q#6- Sales Dept Employee List--
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM public."Employees" e
JOIN public."Dept_Employees" t ON (e.emp_no=t.emp_no)
JOIN public."Departments" d ON (t.dept_no=d.dept_no)
WHERE t.dept_no = 'd007';
--Q#7- Sales & Develop Dept List--
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM public."Employees" e
JOIN public."Dept_Employees" t ON (e.emp_no=t.emp_no)
JOIN public."Departments" d ON (t.dept_no=d.dept_no)
WHERE t.dept_no = 'd007'
OR t.dept_no = 'd005';
--Q#8-LAST NAME FREQ COUNT(DESC)--
SELECT last_name, COUNT(last_name) 
FROM public."Employees"
GROUP BY "last_name"
ORDER BY "last_name" DESC;
--BONUS: SEARCH ID #499942--
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM public."Employees" e
JOIN public."Salaries" s ON (e.emp_no=s.emp_no)
WHERE e.emp_no = '499942';