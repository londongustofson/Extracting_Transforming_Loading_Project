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
ON s.school_name = g.school_name;

# creating view for reported median salaries and graduation rates
CREATE VIEW Colleges.graduation_vs_salaries AS
SELECT g.school_name, g.control, g.`level`, g.aid_value, g.grad_100_value, g.grad_100_percentile, g.grad_150_value, g.grad_150_percentile, s.median_salary_start, s.median_salary_mid
FROM Grad_Rates as g
INNER JOIN Salaries as s
ON g.school_name = s.school_name;

# if view needs to be edited:
# drop view Colleges.graduation_vs_salaries;

# row counts for each created view above
SELECT COUNT(*) FROM Colleges.info; 
SELECT COUNT(*) FROM Colleges.median_salaries; 
SELECT COUNT(*) FROM Colleges.graduation_vs_salaries;
SELECT COUNT(*) FROM Colleges.info_and_graduation_vs_salaries;

# sample cases of views in action
SELECT * FROM Colleges.info 
LIMIT 10;

SELECT * FROM Colleges.median_salaries 
ORDER BY median_salary_start DESC 
LIMIT 25;

SELECT * FROM Colleges.graduation_vs_salaries
ORDER BY school_name;

SELECT * FROM Colleges.graduation_vs_salaries
ORDER BY median_salary_start DESC 
LIMIT 25;

SELECT * FROM Colleges.graduation_vs_salaries
ORDER BY grad_100_percentile DESC 
LIMIT 25;

SELECT * FROM Colleges.graduation_vs_salaries
WHERE school_name = "San Jose State University";

SELECT * FROM Colleges.graduation_vs_salaries
WHERE school_name LIKE "University of California %"
ORDER BY median_salary_start DESC;