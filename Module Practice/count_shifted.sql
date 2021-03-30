--Created retirement_titles tables contains Employee info.
SELECT e.emp_no,
	e.first_name,
	e.last_name, 
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,	
	r.first_name,
	r.last_name,
	r.title
INTO unique_titles
FROM retirement_titles as r
ORDER BY r.emp_no ASC, r.to_date DESC;

SELECT COUNT(t.title), t.title
INTO retiring_titles
FROM unique_titles t
GROUP BY t.title
ORDER BY t.count DESC

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY COUNT DESC