1.1

SELECT 
    _cities.title AS 'city',
    _countries.title AS 'country',
    _regions.title AS 'region'
FROM
    geodata._cities
        LEFT JOIN
    _countries ON _cities.country_id = _countries.id
        LEFT JOIN
    _regions ON _cities.region_id
ORDER BY country;

1.2

SELECT 
    _cities.title AS 'msk_region'
FROM
    _cities
        LEFT JOIN
    _regions ON region_id = _regions.id
WHERE
    _regions.title = 'Московская область'
ORDER BY msk_region

2.1

SELECT 
    dept_name, departments.dept_no, AVG(salary) AS avg_dept_salary
FROM
    salaries
        LEFT JOIN
    (dept_emp, departments) ON (salaries.emp_no = dept_emp.emp_no
        AND dept_emp.dept_no = departments.dept_no)
GROUP BY departments.dept_no
ORDER BY avg_dept_salary DESC;

2.2

SELECT 
    first_name, last_name, salary
FROM
    employees
        LEFT JOIN
    salaries ON (employees.emp_no = salaries.emp_no)
ORDER BY salary DESC
LIMIT 1;

2.3

DELETE FROM employees 
WHERE
    (emp_no = (SELECT 
        salaries.emp_no
    FROM
        salaries
    ORDER BY salary ASC
    LIMIT 1));

2.4

SELECT 
    dept_name, COUNT(employees.emp_no) AS count_of_emp
FROM
    employees
    	JOIN
    (dept_emp, departments) ON (employees.emp_no = dept_emp.emp_no
        AND dept_emp.dept_no = departments.dept_no)
GROUP BY departments.dept_no
ORDER BY count_of_emp DESC;
/*---------------------------------------------------------------------- 2 варианта ---- */
SELECT 
    dept_name, COUNT(dept_emp.emp_no) AS count_of_emp
FROM
    dept_emp
    	JOIN
     departments ON (dept_emp.dept_no = departments.dept_no)
GROUP BY departments.dept_no
ORDER BY count_of_emp DESC;

2.5

SELECT 
    dept_name,
    COUNT(DISTINCT dept_emp.emp_no) AS count_of_emp,
    SUM(salary) AS sum_of_salary
FROM
    dept_emp
        LEFT JOIN
    departments ON (dept_emp.dept_no = departments.dept_no)
        LEFT JOIN
    salaries ON (dept_emp.emp_no = salaries.emp_no)
GROUP BY departments.dept_no
ORDER BY sum_of_salary DESC;