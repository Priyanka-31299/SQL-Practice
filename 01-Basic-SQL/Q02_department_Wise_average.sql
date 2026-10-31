--Q02 Find department wise avg salary and sort in desc order 

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
order by avg(salary) desc;
