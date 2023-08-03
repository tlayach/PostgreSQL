-- example: sum and average of units sold per month
SELECT month_of_year,
  SUM(units_sold) AS sum_units_sold,
  AVG(units_sold) AS avg_employee_shifts
FROM store_sales
GROUP BY month_of_year;
