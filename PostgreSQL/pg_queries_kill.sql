-- get pid from pg_queries_running.sql
SELECT pg_cancel_backend(pid)
