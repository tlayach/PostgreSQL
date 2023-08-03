-- number of records per month
SELECT month_of_year, 
  COUNT(*) as records_per_month
FROM store_sales
GROUP BY month_of_year;
