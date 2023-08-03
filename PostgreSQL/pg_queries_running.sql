SELECT pid,
  age(clock_timestamp(), query_start),
  usename,
  state,
  query
FROM pg_stat_activity 
WHERE query != '<IDLE>'
  AND query NOT ILIKE '%pg_stat_activity%' 
ORDER BY query_start desc;

-- taking more than two minutes
SELECT pid,
  age(clock_timestamp(), query_start),
  usename,
  datname,
  state,
  query
FROM  pg_stat_activity
WHERE now() - query_start > '2 minutes'::interval
  AND state = 'active'
 ORDER BY query_start DESC;
 