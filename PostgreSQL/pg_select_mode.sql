-- example: mode
-- MODE: Finds the most frequently occurring value in a partitioned set of values.
SELECT month_of_year,
  MODE() WITHIN GROUP (ORDER BY employee_shifts) AS mode_emp
FROM store_sales
GROUP BY month_of_year;
