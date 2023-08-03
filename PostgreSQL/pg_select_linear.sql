-- example: linear models using linear regression
-- Predict Value: Estimate the value of some variable.
-- Relationship: Variables related in some way.
-- Data: Have data on one variable; want ot predict the other.
-- PV: Number of employees expected to have to handle the sales of 1500 units
SELECT REGR_INTERCEPT(employee_shifts, units_sold) AS regr_inter_es_us,  -- computing intercept
  REGR_SLOPE(employee_shifts, units_sold) AS regr_slope_es_us,  -- computing slope
  REGR_SLOPE(employee_shifts, units_sold) * 1500 + REGR_INTERCEPT(employee_shifts, units_sold) AS PV -- y = m * x (expected sales) + b
FROM store_sales;
