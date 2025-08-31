use role ACCOUNTADMIN;

create role if not exists DBT_ROLE;

create warehouse if not exists TRANSFORM_WH
  with warehouse_size = 'XSMALL'
  auto_suspend = 60
  auto_resume = true
  initially_suspended = true;

create database if not exists ANALYTICS;
create schema if not exists ANALYTICS.DEV;

create or replace user DBT_USER
  password = 'YourStrongPassword123!'
  default_warehouse = TRANSFORM_WH
  default_role = DBT_ROLE
  default_namespace = ANALYTICS.DEV
  must_change_password = false;

grant role DBT_ROLE to user DBT_USER;
grant usage on warehouse TRANSFORM_WH to role DBT_ROLE;

grant usage on database ANALYTICS to role DBT_ROLE;
grant create schema on database ANALYTICS to role DBT_ROLE;
grant all privileges on schema ANALYTICS.DEV to role DBT_ROLE;
grant all privileges on future schemas in database ANALYTICS to role DBT_ROLE;
grant all privileges on future tables in database ANALYTICS to role DBT_ROLE;
grant all privileges on future views in database ANALYTICS to role DBT_ROLE;

/* Required for shared sample data: */
grant imported privileges on database SNOWFLAKE_SAMPLE_DATA to role DBT_ROLE;

/* Discover your TPCDS schema name (varies by account): */
show schemas in SNOWFLAKE_SAMPLE_DATA like 'TPCDS%';
