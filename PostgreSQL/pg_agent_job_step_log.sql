-- list all job step logs
SELECT * 
FROM pgagent.pga_jobsteplog;

-- example
-- logs from process called storecash
SELECT * 
FROM pgagent.pga_jobsteplog 
WHERE jsloutput LIKE '%storecash%'
ORDER BY jslstart DESC;
