-- select all roles
SELECT oid, rolname, rolsuper, rolinherit, rolcanlogin FROM pg_roles;


-- CREATE
-- create role called group_analytics_read
CREATE ROLE group_analytics_read;


-- GRANT
-- permissions: SELECT, INSERT, UPDATE, EXECUTE, DELETE, DROP, CREATE, ALTER
-- grant select table permissions to group_analytics_read role
GRANT SELECT ON pot.vendor_line_item TO analytics_read_role;

-- grant update table permissions to group_analytics_read role
GRANT UPDATE ON pot.vendor_line_item TO analytics_read_role;

-- grant access from group_analytics_read role to shemas pot and public
GRANT USAGE ON SCHEMA public, account_review, ariba, payments_on_time, smartsheet, uipath TO group_analytics_read;
GRANT SELECT ON ALL TABLES IN SCHEMA public, account_review, ariba, payments_on_time, smartsheet, uipath TO group_analytics_read;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public, account_review, ariba, payments_on_time, smartsheet, uipath TO group_analytics_read;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public, account_review, ariba, payments_on_time, smartsheet, uipath TO group_analytics_read;

-- GRANT ALL ON ALL TABLES IN SCHEMA pot, public TO group_analytics_read;
-- GRANT ALL ON ALL TABLES IN SEQUENCES pot, public TO group_analytics_read;
-- GRANT ALL ON ALL TABLES IN FUNCTIONS pot, public TO group_analytics_read;

-- GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA pot TO group_analytics_read;


-- check select access to table pot.vendor_line_item
SELECT rolname FROM pg_roles WHERE has_table_privilege(rolname, 'pot.vendor_line_item', 'SELECT')


-- USER
-- create role called john_doe with password 123
CREATE ROLE john_doe WITH LOGIN PASSWORD '123';

-- add john_doe to group_analytics_read
GRANT group_analytics_read TO john_doe;


-- REVOKE
-- revoke all privileges from group_analytics_read role on table pot.vendor_line_item
REVOKE ALL PRIVILEGES ON pot.vendor_line_item FROM group_analytics_read;

-- revoke all privileges on schema pot and public from group_analytics_read role 
REVOKE ALL PRIVILEGES ON SCHEMA pot, public FROM group_analytics_read;

-- revoke john_doe access from group_analytics_read
REVOKE group_analytics_read FROM john_doe;


-- DROP
-- drop role called john_doe
DROP ROLE john_doe;

-- drop role called analytics_read_role
DROP ROLE group_analytics_read;



SELECT SESSION_USER, CURRENT_USER;

SET ROLE group_analytics_read;
SELECT * FROM pot.vendor_line_item;
RESET ROLE;

