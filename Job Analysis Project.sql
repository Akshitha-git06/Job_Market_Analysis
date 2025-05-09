CREATE DATABASE job_analysis;
USE job_analysis;

CREATE TABLE Job_postings (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Job_title VARCHAR(100),
    Company VARCHAR(100),
    Location VARCHAR(100),
    Experience_level VARCHAR(50),
    Salary VARCHAR(50),
    Industry VARCHAR(100),
    Required_skills TEXT
);

-- 1. Average salary by experience level --
SELECT Experience_level, 
       AVG(CAST(REPLACE(REPLACE(Salary, '$', ''), 'K', '') AS UNSIGNED)) * 1000 AS avg_salary
FROM Job_postings
GROUP BY Experience_level;

-- 2. Top 10 job titles with highest average salary --
SELECT Job_title, 
       AVG(CAST(REPLACE(REPLACE(Salary, '$', ''), 'K', '') AS UNSIGNED)) * 1000 AS avg_salary
FROM Job_postings
GROUP BY Job_title
ORDER BY avg_salary DESC
LIMIT 10;

-- 3. Count of jobs with salary above $120K --
SELECT COUNT(*) AS high_salary_jobs
FROM Job_postings
WHERE CAST(REPLACE(REPLACE(Salary, '$', ''), 'K', '') AS UNSIGNED) > 120;

-- 4. Most common salary range for each job title --
SELECT Job_title, Salary, COUNT(*) AS count
FROM Job_postings
GROUP BY Job_title, Salary
ORDER BY Job_title, count DESC;

-- 5. Average salary per industry --
SELECT Industry, 
       AVG(CAST(REPLACE(REPLACE(Salary, '$', ''), 'K', '') AS UNSIGNED)) * 1000 AS avg_salary
FROM Job_postings
GROUP BY Industry
ORDER BY avg_salary DESC;

-- 6. Top 3 locations with highest number of job postings --
SELECT Location, COUNT(*) AS total_jobs
FROM Job_postings
GROUP BY Location
ORDER BY total_jobs DESC
LIMIT 3;

-- 7. Location with highest average salary --
SELECT Location, 
       AVG(CAST(REPLACE(REPLACE(Salary, '$', ''), 'K', '') AS UNSIGNED)) * 1000 AS avg_salary
FROM Job_postings
GROUP BY Location
ORDER BY avg_salary DESC
LIMIT 1;

-- 8. Jobs in Toronto vs London --
SELECT Location, COUNT(*) AS job_count
FROM Job_postings
WHERE Location IN ('Toronto', 'London')
GROUP BY Location;

-- 9. Jobs that require both Python and SQL --
SELECT *
FROM Job_postings
WHERE Required_skills LIKE '%Python%' AND Required_skills LIKE '%SQL%';

-- 10. Number of jobs per experience level --
SELECT Experience_level, COUNT(*) AS count
FROM Job_postings
GROUP BY Experience_level;

-- 11. Industry with most entry-level jobs --
SELECT Industry, COUNT(*) AS entry_jobs
FROM Job_postings
WHERE Experience_level = 'Entry-Level'
GROUP BY Industry
ORDER BY entry_jobs DESC
LIMIT 1;

-- 12. Salary comparison for same job title at different experience levels --
SELECT Job_title, Experience_level,
       AVG(CAST(REPLACE(REPLACE(Salary, '$', ''), 'K', '') AS UNSIGNED)) * 1000 AS avg_salary
FROM Job_postings
GROUP BY Job_title, Experience_level
ORDER BY Job_title, Experience_level;

-- 13. Companies hiring for multiple job titles in multiple locations --
SELECT Company
FROM Job_postings
GROUP BY Company
HAVING COUNT(DISTINCT Job_title) > 1 AND COUNT(DISTINCT Location) > 1;

-- 14. Job titles that appear in more than one industry --
SELECT Job_title
FROM Job_postings
GROUP BY Job_title
HAVING COUNT(DISTINCT Industry) > 1;

-- 15. Companies offering the highest paying jobs --
SELECT Company, 
       MAX(CAST(REPLACE(REPLACE(Salary, '$', ''), 'K', '') AS UNSIGNED)) * 1000 AS max_salary
FROM Job_postings
GROUP BY Company
ORDER BY max_salary DESC
LIMIT 10;

-- 16. Number of job postings per company (Top 10) --
SELECT Company, COUNT(*) AS job_count
FROM Job_postings
GROUP BY Company
ORDER BY job_count DESC
LIMIT 10;

-- 17. Jobs that mention "Data" in the title and pay above $100K --
SELECT *
FROM Job_postings
WHERE Job_title LIKE '%Data%'
  AND CAST(REPLACE(REPLACE(Salary, '$', ''), 'K', '') AS UNSIGNED) > 100;




