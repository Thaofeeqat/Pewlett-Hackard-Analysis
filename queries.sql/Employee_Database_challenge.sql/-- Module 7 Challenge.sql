-- Module 7 Challenge
-- Use Dictinct with Orderby to remove duplicate rows
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles 
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' and '1955-12-31'
ORDER BY emp_no;
SELECT * FROM retirement_titles
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT on (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_title
FROM retirement_titles;
-- WHERE to_date = '9999/01/01'
-- ORDER BY emp_no,to_date DESC;
select * from unique_title;

SELECT COUNT(emp_no) as count, title
INTO retiring_titles
FROM unique_title
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

SELECT sum(count) FROM retiring_titles;

SELECT DISTINCT ON (t.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.to_date = '9999-01-01' AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY t.emp_no;
drop table mentorship_eligibility;
SELECT * FROM mentorship_eligibility;
