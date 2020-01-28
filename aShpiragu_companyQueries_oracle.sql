/*Arber Shpiragu 142427178*/

SELECT department_id AS "Department", MIN(hire_date) AS "Earliest Hire", MAX(hire_date) AS "Latest Hire", 
    MAX(salary) AS "Maximum Salary"
FROM employees
GROUP BY department_id
HAVING department_id IN (20, 40, 50, 60, 90)
ORDER BY department_id ASC;

SELECT department_id, COUNT(*) as "Number of employees"
FROM employees
WHERE salary > 2500
GROUP BY department_id
HAVING COUNT(*) > 5;

SELECT first_name, last_name, job_id, department_id, (salary + 1200) AS "New-Salary", 
    ROUND((NVL(commission_pct, 0)/2), 2) AS "New-Commission"
FROM employees
WHERE department_id IN (80, 60)
ORDER BY department_id DESC, salary ASC;

SELECT last_name || ' has been employed for ' || TRUNC(MONTHS_BETWEEN(sysdate, hire_date)/12, 0) || 
    ' years, for a total of ' || TRUNC(MONTHS_BETWEEN(sysdate, hire_date), 0) || ' completed months.'
FROM employees
ORDER BY MONTHS_BETWEEN(sysdate, hire_date) DESC;

SELECT product_name, list_price
FROM product_information
WHERE product_name IS NOT NULL AND product_name LIKE 'HD%' AND list_price BETWEEN 500 and 800 OR product_name LIKE 'GP%' AND 
    product_name LIKE '%1024x768%' OR product_name LIKE '%1280x1024%' 
ORDER BY list_price DESC;

SELECT product_status, COUNT(*), SUM(list_price)
FROM product_information
GROUP BY product_status
HAVING product_status != 'orderable' AND SUM(list_price) > 2000;
