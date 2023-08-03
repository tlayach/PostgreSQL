-- example: sum and average of units sold, the variance of the population 
-- and standard deviation per month
SELECT month_of_year,
  SUM(units_sold) AS sum_units_sold,
  ROUND(AVG(units_sold), 2) AS avg_employee_shifts,
  ROUND(VAR_POP(units_sold), 2) AS var_pop_employee_shifts,
  ROUND(STDDEV_POP(units_sold), 2) AS stddev_pop_employee_shifts
FROM store_sales
GROUP BY month_of_year;
