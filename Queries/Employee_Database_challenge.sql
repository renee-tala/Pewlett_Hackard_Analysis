<<<<<<< HEAD
--Deliverable One
=======
>>>>>>> 83b9199ce5a6157cd32bbbbd237433a8a02d0af2
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

-- Use Dictinct with Orderby to remove duplicate rows
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

<<<<<<< HEAD
SELECT * FROM unique_titles;
SELECT * FROM retiring_titles;

--Deliverable Two
SELECT DISTINCT ON(e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
--DISTINCT ON (emp_no)
INTO mentor_eligibility
FROM employees AS e
INNER JOIN dept_employees AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT * FROM mentor_eligibility;
=======
SELECT * FROM retiring_titles;
>>>>>>> 83b9199ce5a6157cd32bbbbd237433a8a02d0af2
