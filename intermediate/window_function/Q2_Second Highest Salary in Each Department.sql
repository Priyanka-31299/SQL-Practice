--Q2 -Second Highest Salary in Each Department
-- topic- cte, window func

WITH employee_cte AS
(
    SELECT
        employee_name,
        department,
        salary,
        DENSE_RANK() OVER(
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT employee_name, department, salary
FROM employee_cte
WHERE salary_rank = 2;
