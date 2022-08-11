create database frosty_friday;

create schema challenge_1;

create or replace stage stage_challenge_1 url='s3://frostyfridaychallenges/challenge_1/';

list @stage_challenge_1;

create or replace file format csv_format type = 'csv' field_delimiter = ',';

select t.$1,t.$2 from @challenge_1_stage (file_format => 'csv_format', pattern=>'challenge_1/1.csv') t;

create or replace table table_challenge_1 (column_1 varchar);

copy into table_challenge_1 from @stage_challenge_1;

select * from table_challenge_1;


