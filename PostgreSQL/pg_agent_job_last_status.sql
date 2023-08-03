-- https://github.com/postgres/pgagent/blob/master/sql/pgagent.sql
-- for the current day
-- macro view
SELECT DISTINCT pga_job.jobid,
  pga_job.jobname,
  pga_job.jobenabled,
  pga_joblog.jlgstatus AS jobstatus,
  CASE pga_joblog.jlgstatus
    WHEN 'r' THEN 'running'
    WHEN 's' THEN 'success'
    WHEN 'f' THEN 'failed'
    WHEN 'i' THEN 'internal failure'
    WHEN 'd' THEN 'aborted'
    ELSE 'na'
  END AS jobstatusdesc,
  pga_job.joblastrun,
  pga_job.jobnextrun
FROM pgagent.pga_job
INNER JOIN pgagent.pga_joblog
  ON pga_job.jobid = pga_joblog.jlgjobid
WHERE pga_job.joblastrun > CURRENT_DATE;

-- step detail
SELECT DISTINCT pga_job.jobid,
  pga_job.jobname,
  pga_job.jobenabled,
  CASE pga_joblog.jlgstatus
    WHEN 'r' THEN 'running'
    WHEN 's' THEN 'success'
    WHEN 'f' THEN 'failed'
    WHEN 'i' THEN 'internal failure'
    WHEN 'd' THEN 'aborted'
    ELSE 'na'
  END AS jobstatusdesc,
  pga_job.joblastrun,
  pga_jobstep.jstname,
  pga_jobsteplog.jslid,
  pga_jobsteplog.jslstart,
  pga_jobsteplog.jslduration,
  pga_jobsteplog.jsloutput
FROM pgagent.pga_job
INNER JOIN pgagent.pga_jobstep
  ON pga_job.jobid = pga_jobstep.jstjobid
INNER JOIN pgagent.pga_joblog
  ON pga_job.jobid = pga_joblog.jlgjobid
INNER JOIN pgagent.pga_jobsteplog
  ON pga_joblog.jlgid = pga_jobsteplog.jsljlgid
  AND pga_jobstep.jstid = pga_jobsteplog.jsljstid
WHERE pga_jobsteplog.jslstart > CURRENT_DATE
-- ORDER BY pga_jobsteplog.jslid ASC;
