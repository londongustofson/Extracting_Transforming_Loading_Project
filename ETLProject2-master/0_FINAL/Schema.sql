#CREATE DATABASE Colleges;
USE Colleges;

CREATE TABLE Salaries(
    school_name TEXT, school_type TEXT, 
    median_salary_start INT, 
    median_salary_mid INT
    );
    
CREATE TABLE Grad_Rates(
    school_name TEXT, school_id INT, 
    state TEXT, 
    `level` TEXT,
    control TEXT,
    basic TEXT,
    student_count INT, 
    aid_value INT, 
    grad_100_value FLOAT, 
    grad_100_percentile FLOAT, 
    grad_150_value FLOAT, 
    grad_150_percentile FLOAT
    );
    
CREATE TABLE Demographics(
	school_id INT, 
    gender TEXT, 
    race TEXT,
    cohort TEXT
    );
    