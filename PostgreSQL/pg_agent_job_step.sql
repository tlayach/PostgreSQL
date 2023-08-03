-- list job steps
SELECT * FROM pgagent.pga_jobstep;


-- steps for job jobid = 3
SELECT * 
FROM pgagent.pga_jobstep
WHERE jstjobid = 3;
