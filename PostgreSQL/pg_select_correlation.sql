-- example: correlations between variables
-- CORR: Measure of how two columns vary together.
SELECT CORR(units_sold, month_of_year) AS corr_us_my,
  CORR(units_sold, revenue) AS corr_us_rv,  -- if you sell more...
  CORR(units_sold, employee_shifts) AS corr_us_es
FROM store_sales;
