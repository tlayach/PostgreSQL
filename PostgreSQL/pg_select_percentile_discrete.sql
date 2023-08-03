-- example: discrete percentiles
-- Percentiles: One hundred equal groups; population divided across groups.
-- PERCENTILE_DISC: Returns a vaule that exists in the column.
SELECT PERCENTILE_DISC(0.50) WITHIN GROUP (ORDER BY revenue) AS pct_50d_revenue,  -- 50%
  PERCENTILE_DISC(0.60) WITHIN GROUP (ORDER BY revenue) AS pct_60d_revenue,       -- 60%
  PERCENTILE_DISC(0.90) WITHIN GROUP (ORDER BY revenue) AS pct_90d_revenue,       -- 90%
  PERCENTILE_DISC(0.95) WITHIN GROUP (ORDER BY revenue) AS pct_95d_revenue        -- 95%
FROM store_sales;
