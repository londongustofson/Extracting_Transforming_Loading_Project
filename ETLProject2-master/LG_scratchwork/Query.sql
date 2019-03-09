USE Colleges;

# previewing tables
SELECT * FROM Salaries LIMIT 5;
SELECT * FROM Grad_Rates LIMIT 5;
SELECT * FROM Demographics LIMIT 5;

# creating view for general college info
CREATE VIEW Colleges.info AS
SELECT d.school_id, g.school_name, g.state, d.gender, d.race, d.cohort, g.`level`, g.control, g.basic, g.student_count
FROM Demographics as d
INNER JOIN Grad_Rates as g
ON d.school_id = g.school_id;

# creating view for WSJ reported median salaries by school 
CREATE VIEW Colleges.median_salaries AS
SELECT s.school_name, g.state, s.school_type, g.aid_value, s.median_salary_start, s.median_salary_mid
FROM Salaries as s
INNER JOIN Grad_Rates as g
ON s.school_name=g.school_name;

# creating view for 


# view row counts
SELECT COUNT(*)
FROM Colleges.info; 

SELECT COUNT(*)
FROM Colleges.median_salaries; 

# sample cases of views in action
SELECT * FROM Colleges.info LIMIT 10;
SELECT * FROM Colleges.median_salaries ORDER BY median_salary_start DESC LIMIT 25;