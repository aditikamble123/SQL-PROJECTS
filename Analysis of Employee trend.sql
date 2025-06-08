create database employee_trend;
SELECT * FROM trends;
use employee_trend;

#1. Count of Employees by Department
SELECT department, COUNT(*) AS employee_count
FROM trends
GROUP BY department
ORDER BY employee_count DESC;

#2. Attrition Rate by Department
SELECT department,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
       ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM trends
GROUP BY department
ORDER BY attrition_rate DESC;

#3. Gender Distribution in Workforce

SELECT gender, COUNT(*) AS count,
ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM trends), 
2) AS percentage
FROM trends
GROUP BY gender;

#4. Job Satisfaction by Age Band
SELECT age_band, AVG(job_satisfaction) AS avg_satisfaction
FROM trends
GROUP BY age_band
ORDER BY age_band;

#5. Active vs Ex-Employees
SELECT attrition_label, COUNT(*) AS count
FROM trends
GROUP BY attrition_label;

#6. Attrition by Education Level
SELECT education, 
COUNT(*) AS total,
SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM trends
GROUP BY education
ORDER BY attrition_rate DESC;

#7. Business Travel vs Attrition
SELECT business_travel,
       COUNT(*) AS total,
       SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
       ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM trends
GROUP BY business_travel
ORDER BY attrition_rate DESC;

#8. Job Roles with Highest Attrition
SELECT job_role,
       COUNT(*) AS total,
       SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
       ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM trends
GROUP BY job_role
ORDER BY attrition_rate DESC;

#9. Satisfaction vs Attrition
SELECT job_satisfaction,
       COUNT(*) AS total,
       SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
       ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM trends
GROUP BY job_satisfaction
ORDER BY job_satisfaction;

#10. Gender + Marital Status Attrition Trends
SELECT gender, marital_status,
       COUNT(*) AS total,
       SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
       ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate
FROM trends
GROUP BY gender, marital_status
ORDER BY attrition_rate DESC;
