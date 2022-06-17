----------- CREATING DATABASES AND TABLES -----------

----------- CREATE TABLES -----------

-- CREATE TABLE account(
-- user_id SERIAL PRIMARY KEY,
-- username VARCHAR(50) UNIQUE NOT NULL,
-- password VARCHAR(50) NOT NULL,
-- email VARCHAR(250) UNIQUE NOT NULL,
-- created_on TIMESTAMP NOT NULL,
-- last_login TIMESTAMP);

-- CREATE TABLE job(
-- job_id SERIAL PRIMARY KEY,
-- job_name VARCHAR(200) UNIQUE NOT NULL);

-- CREATE TABLE account_job(
-- user_id INTEGER REFERENCES account(user_id),
-- job_id INTEGER REFERENCES job(job_id),
-- hire_date TIMESTAMP);

----------- INSERT -----------

-- INSERT INTO account(username,password,email,created_on)
-- VALUES
-- ('Jose','password','jose@mail.com',CURRENT_TIMESTAMP);

SELECT * FROM account;

-- INSERT INTO job(job_name)
-- VALUES
-- ('Astronaut');

SELECT * FROM job;

-- INSERT INTO job(job_name)
-- VALUES
-- ('President');

SELECT * FROM job;

-- INSERT INTO account_job(user_id,job_id,hire_date)
-- VALUES
-- (1,1,CURRENT_TIMESTAMP);

SELECT * FROM account_job;

-- What happens if we try to insert a user/job ID that doesn't exist?
-- INSERT INTO account_job(user_id,job_id,hire_date)
-- VALUES
-- (10,10,CURRENT_TIMESTAMP);

----------- UPDATE -----------

-- UPDATE account
-- SET last_login = CURRENT_TIMESTAMP;

SELECT * FROM account;

-- UPDATE account
-- SET last_login = created_on;

SELECT * FROM account;

-- UPDATE account_job
-- SET hire_date = account.created_on
-- FROM account
-- WHERE account_job.user_id = account.user_id;

SELECT * FROM account_job;
SELECT * FROM account;

-- UPDATE account
-- SET last_login = CURRENT_TIMESTAMP
-- RETURNING email,created_on,last_login;

----------- DELETE -----------

-- Can be used to DELETE rows from a table
-- INSERT INTO job(job_name)
-- VALUES
-- ('Cowboy');

SELECT * FROM job;

-- Returning the rows that were deleted
-- DELETE FROM job
-- WHERE job_name = 'Cowboy'
-- RETURNING job_id,job_name;

----------- ALTER TABLE -----------

-- The ALTER clause allows for changes to an existing table structure:
-- - Adding, dropping or renaming columns
-- - Changing a column's data type
-- - Set DEFAULT values for a column
-- - Add CHECK constraints
-- - Rename table

-- CREATE TABLE information(
-- info_id SERIAL PRIMARY KEY,
-- title VARCHAR(500) NOT NULL,
-- person VARCHAR(50) NOT NULL UNIQUE);

-- SELECT * FROM information;

-- ALTER TABLE information
-- RENAME TO new_info;

SELECT * FROM new_info;

-- ALTER TABLE new_info
-- RENAME COLUMN person TO people;

SELECT * FROM new_info;

-- DROP to remove a constraint and SET to add
-- ALTER TABLE new_info
-- ALTER COLUMN people DROP NOT NULL;

-- INSERT INTO new_info(title)
-- VALUES
-- ('some new title');

SELECT * FROM new_info;

----------- DROP -----------

-- Allows for the removal of a column in a table
-- ALTER TABLE new_info
-- DROP COLUMN people;

SELECT * FROM new_info;

-- ALTER TABLE new_info
-- DROP COLUMN IF EXISTS people;

----------- CHECK CONSTRAINT -----------

-- The CHECK constraint allows us to create more customized constraints
-- that adhere to a certain condition.
-- Such as making sure all inserted integer values fall below a certain threshold.

-- CREATE TABLE employees(
-- emp_id SERIAL PRIMARY KEY,
-- first_name VARCHAR(50) NOT NULL,
-- last_name VARCHAR(50) NOT NULL,
-- birthdate DATE CHECK (birthdate > '1900-01-01'),
-- hire_date DATE CHECK (hire_date > birthdate),
-- salary INTEGER CHECK (salary > 0));

SELECT * FROM employees;

-- INSERT INTO employees(
-- first_name,
-- last_name,
-- birthdate,
-- hire_date,
-- salary
-- )
-- VALUES
-- ('Sammy',
-- 'Smith',
-- '1990-11-03',
-- '2010-01-01',
-- 100);

SELECT * FROM employees;

