-- example: min and max of emplyee shifts per month
SELECT month_of_year,
  MIN(employee_shifts) AS min_employee_shifts,
  MAX(employee_shifts) AS max_employee_shifts
FROM store_sales
GROUP BY month_of_year;
