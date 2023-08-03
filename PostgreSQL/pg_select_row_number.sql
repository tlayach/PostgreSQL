-- example: row number
-- ROW_NUMBER: Ranks order to a row but in a way that does not depend on the sort order of the query.
SELECT sale_date,
  month_of_year,
  units_sold,
  ROW_NUMBER() OVER (ORDER BY units_sold) AS row_number_us
FROM store_sales
ORDER BY row_number_us;
