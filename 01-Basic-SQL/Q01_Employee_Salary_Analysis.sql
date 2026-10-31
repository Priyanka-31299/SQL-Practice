-- Question 1: Find employees earning more than 50000
-- Topic: WHERE clause

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary > 50000
ORDER BY salary DESC;
