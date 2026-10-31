-- Q01 Write a SQL query to calculate month-over-month sales growth.
-- topic- CTE, window function and case

WITH sales_cte AS
(
    SELECT
        month,
        sales AS current_sales,

        LAG(sales) OVER(
            ORDER BY CASE month
                WHEN 'January' THEN 1
                WHEN 'February' THEN 2
                WHEN 'March' THEN 3
                WHEN 'April' THEN 4
                WHEN 'May' THEN 5
                WHEN 'June' THEN 6
            END
        ) AS previous_month_sales,
--Better to use LAG(sales) without a default like lag(sales,1,0) that is 0 will come in first place bcz last month jan sales is not mentioned
--January will return NULL, which is appropriate.
        CASE month
            WHEN 'January' THEN 1
            WHEN 'February' THEN 2
            WHEN 'March' THEN 3
            WHEN 'April' THEN 4
            WHEN 'May' THEN 5
            WHEN 'June' THEN 6
        END AS month_order
--Because month is stored as text, SQL Server sorts alphabetically, not chronologically.For example, April may appear before February.
--You need to define the month sequence using CASE.
   
    FROM Monthly_Sales
)
SELECT
    month,
    current_sales,
    previous_month_sales,
    current_sales - previous_month_sales AS sales_difference,

    (current_sales - previous_month_sales) * 100.0 /
    NULLIF(previous_month_sales, 0) AS percentage_growth
--In SQL Server, if both values are integers, division can truncate the decimal portion. Use 100.0 to ensure decimal calculation.

    FROM sales_cte
ORDER BY month_order;
