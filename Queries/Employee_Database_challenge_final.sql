--Deliverable One
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no 

SELECT * FROM retirement_titles

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title,
	to_date
INTO unique_titles 
FROM retirement_titles 
ORDER BY emp_no, to_date DESC;

--Retrieve the number of employees by about to retire
SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--View Table
SELECT * FROM retiring_titles;

--Deliverable Two: Mentorship eligibilty
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO mentorship_eligibility
FROM employees as e
JOIN dept_employees as de
ON e.emp_no = de.emp_no
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
AND t.to_date = '9999-01-01'
ORDER BY e.emp_no 

--View Table 
SELECT * FROM mentorship_eligibility;

--Deliverable Three: The Silver Tsunami
--Retirement eligible by department and title 
SELECT rt.emp_no,
		rt.first_name,
		rt.last_name,
		rt.title,
		d.dept_name
INTO unique_titles_dept 
FROM retirement_titles as rt
JOIN dept_employees as de
ON rt.emp_no = de.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no
ORDER BY rt.emp_no, rt.to_date DESC; 

SELECT * FROM unique_titles_dept;

--Number of roles to be filled:
SELECT ut.dept_name, ut.title, COUNT(ut.title)
INTO rolls_to_fill
FROM (SELECT title, dept_name from unique_titles_dept) as ut
GROUP BY ut.dept_name, ut.title 
ORDER  BY ut.dept_name DESC; 

SELECT * FROM rolls_to_fill;

--Number of qualified staff to mentor next generation:
SELECT ut.dept_name, ut.title, COUNT(ut.title)
INTO qualified_staff
FROM (SELECT title, dept_name from unique_titles_dept) as ut
WHERE ut.title IN ('Senior Engineer', 'Senior Staff', 'Manager', 'Technique Leader')
GROUP BY ut.dept_name, ut.title 
ORDER  BY ut.dept_name DESC; 

SELECT * FROM qualified_staff; 

