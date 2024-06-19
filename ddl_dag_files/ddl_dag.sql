CREATE TABLE IF NOT EXISTS emp_staging_table (
     name VARCHAR(100) NOT NULL,
     age INT NOT NULL,
     emp_id BIGINT NOT NULL,
     processed_date DATE
);

CREATE TABLE IF NOT EXISTS emp_final_table (
     name VARCHAR(100) NOT NULL,
     age INT NOT NULL,
     emp_id BIGINT NOT NULL,
     processed_date DATE
);

CREATE TABLE IF NOT EXISTS emp_timeframe_staging_table (
     emp_id BIGINT,
     designation VARCHAR(255),
     start_date DATE,
     end_date DATE,
     salary NUMERIC,
     status VARCHAR(50),
     processed_date DATE
);

CREATE TABLE IF NOT EXISTS emp_timeframe_final_table (
     emp_id BIGINT,
     designation VARCHAR(255),
     start_date DATE,
     end_date DATE,
     salary NUMERIC,
     status VARCHAR(50),
     processed_date DATE
);

CREATE TABLE IF NOT EXISTS daily_active_employees (
     designation VARCHAR(255) PRIMARY KEY,
     active_employee_count BIGINT
);

CREATE TABLE IF NOT EXISTS emp_leave_quota_table (
     emp_id BIGINT NOT NULL,
     leave_quota INT NOT NULL,
     year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS leave_calendar_table (
     reason VARCHAR(50) NOT NULL,
     date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS leave_applications_staging(
    emp_id BIGINT,
    date DATE,
    status VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS leave_applications(
    emp_id BIGINT,
    date DATE,
    status VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS leave_applications_archive(
    emp_id BIGINT,
    date DATE,
    status VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS potential_leave_count(
    emp_id BIGINT,
    upcoming_leaves INT
);

CREATE TABLE IF NOT EXISTS public.employee_messages(
    sender_id bigint,
    receiver_id bigint,
    msg_text text,
    is_flagged boolean,
    msg_timestamp timestamp
);

CREATE TABLE IF NOT EXISTS public.employee_messages_staging (
    employee_id bigint,
    strike_count bigint NOT NULL,
    last_strike_date timestamp without time zone,
    salary numeric(23,2)
);

CREATE TABLE IF NOT EXISTS public.employee_strikes(
    employee_id bigint,
    strike_count bigint NOT NULL,
    last_strike_date timestamp,
    salary numeric(23,2),
    new_salary numeric(23,2)
);

CREATE TABLE IF NOT EXISTS public.scd_employee_strikes(
    employee_id bigint NOT NULL,
    strike_count integer,
    last_strike_date date,
    salary numeric,
    sc_1 numeric DEFAULT 0,
    sc_2 numeric DEFAULT 0,
    sc_3 numeric DEFAULT 0,
    sc_4 numeric DEFAULT 0,
    sc_5 numeric DEFAULT 0,
    sc_6 numeric DEFAULT 0,
    sc_7 numeric DEFAULT 0,
    sc_8 numeric DEFAULT 0,
    sc_9 numeric DEFAULT 0
);
