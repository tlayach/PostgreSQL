-- example: discrete percentiles vs continuous percentiles
-- Percentiles: One hundred equal groups; population divided across groups.
-- PERCENTILE_CONT: Interpolates the boundary value between percentiles.
SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY revenue) AS pct_95c_revenue,  -- 95%
  PERCENTILE_DISC(0.95) WITHIN GROUP (ORDER BY revenue) AS pct_95d_revenue        -- 95%
FROM store_sales;
