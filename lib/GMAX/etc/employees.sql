--  Sample employee database 
--  See changelog table for details
--  Copyright (C) 2007,2008, MySQL AB
--  
--  Original data created by Fusheng Wang and Carlo Zaniolo
--  http://www.cs.aau.dk/TimeCenter/software.htm
--  http://www.cs.aau.dk/TimeCenter/Data/employeeTemporalDataSet.zip
-- 
--  Current schema by Giuseppe Maxia 
--  Data conversion from XML to relational by Patrick Crews
-- 
-- This work is licensed under the 
-- Creative Commons Attribution-Share Alike 3.0 Unported License. 
-- To view a copy of this license, visit 
-- http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to 
-- Creative Commons, 171 Second Street, Suite 300, San Francisco, 
-- California, 94105, USA.
-- 
--  DISCLAIMER
--  To the best of our knowledge, this data is fabricated, and
--  it does not correspond to real people. 
--  Any similarity to existing people is purely coincidental.
-- 

-- DROP DATABASE IF EXISTS employees;
-- CREATE DATABASE IF NOT EXISTS employees;
-- USE employees;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

-- DROP TABLE IF EXISTS dept_emp,
--                      dept_manager,
--                      titles,
--                      salaries, 
--                      employees, 
--                      departments;

--   set storage_engine = InnoDB;
-- set storage_engine = MyISAM;
-- set storage_engine = Falcon;
-- set storage_engine = PBXT;
-- set storage_engine = Maria;

-- select CONCAT('storage engine: ', @@storage_engine) as INFO;

CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  TEXT            NOT NULL,
    first_name  TEXT     NOT NULL,
    last_name   TEXT     NOT NULL,
    gender      TEXT  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no     CHAR        NOT NULL,
    dept_name   TEXT    NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE   (dept_name)
);

CREATE TABLE dept_manager (
   dept_no      INT        NOT NULL,
   emp_no       TEXT            NOT NULL,
   from_date    TEXT           NOT NULL,
   to_date      TEXT           NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no,dept_no)
); 

CREATE TABLE dept_emp (
    emp_no      INT             NOT NULL,
    dept_no     TEXT        NOT NULL,
    from_date   TEXT           NOT NULL,
    to_date     TEXT            NOT NULL,
    FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no)  ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE titles (
    emp_no      INT             NOT NULL,
    title       TEXT    NOT NULL,
    from_date   TEXT           NOT NULL,
    to_date     TEXT,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,title, from_date)
); 

CREATE TABLE salaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   TEXT            NOT NULL,
    to_date     TEXT            NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
); 

SELECT 'LOADING departments' as 'INFO';
.read load_departments.dump ;
SELECT 'LOADING employees' as 'INFO';
.read load_employees.dump ;
SELECT 'LOADING dept_emp' as 'INFO';
.read load_dept_emp.dump ;
SELECT 'LOADING dept_manager' as 'INFO';
.read load_dept_manager.dump ;
SELECT 'LOADING titles' as 'INFO';
.read load_titles.dump ;
SELECT 'LOADING salaries' as 'INFO';
.read load_salaries.dump ;

