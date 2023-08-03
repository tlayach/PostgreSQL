-- output dependes on the configuration
DO $$
BEGIN
  RAISE INFO 'Starting, %', NOW();
  RAISE LOG 'Log message, %', NOW();
  RAISE DEBUG 'Debug message, %', NOW();
  RAISE WARNING 'Warning message, %', NOW();
  RAISE NOTICE 'Notice message %', NOW();
END $$;