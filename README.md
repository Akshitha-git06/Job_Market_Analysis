# 💼 Job Market Analysis Project

This project leverages SQL to analyze job listings and uncover trends in hiring locations and salary insights. It includes SQL queries to extract valuable information from a structured dataset, focusing on identifying top job markets and high-paying roles.

---

## 📝 Project Overview

The main objective of this project is to gain insights into the job market using SQL queries. The dataset (assumed to be preloaded into a database) contains fields such as job titles, company names, locations, salaries, and required skills. All insights were derived through SQL queries and summarized for clarity.

The analysis is performed using SQL, and key query outputs are shared as visual screenshots for easy interpretation.

---

## 🎯 Key Objectives

- Identify the most advertised job titles
- Analyze hiring hotspots by location
- Understand salary ranges and distributions
- Discover frequently requested skills

---

## 📂 Project Files

- `Job Analysis Project.sql` – SQL queries used for analysis  
- `job_recommendation_dataset.csv` – The dataset used for analysis  
- `Top 3 locations with highest number of job postings.png` – Query result screenshot  
- `Top 10 job titles with highest average salary.png` – Query result screenshot  

---

## 🔍 Highlighted SQL Queries

### 🌍 Top 3 Locations with the Most Job Postings

SELECT Location, COUNT(*) AS total_jobs

FROM Job_postings

GROUP BY Location

ORDER BY total_jobs DESC

LIMIT 3;

![Top 3 locations with highest number of job postings](https://github.com/user-attachments/assets/ea5cab5a-da53-42e2-8418-e69c4fda14c9)


### 💸 Top 10 Job Titles with the Highest Average Salary

SELECT Job_title, 

AVG(CAST(REPLACE(REPLACE(Salary, '$', ''), 'K', '') AS UNSIGNED)) * 1000 AS avg_salary

FROM Job_postings

GROUP BY Job_title

ORDER BY avg_salary DESC

LIMIT 10;

![Top 10 job titles with highest average salary](https://github.com/user-attachments/assets/2a8efa9e-6dcf-4835-9d49-1fce4206dedf)

---

🛠️ Tools Used

MySQL Workbench

CSV dataset for loading into the database

📈 How to Use

Import job_recommendation_dataset.csv into your SQL database.

Open and run the queries in Job Analysis Project.sql.

Review the output or replicate your own analysis using the shared logic.

---

🙋‍♀️ Author

Akshitha

GitHub: Akshitha-git06 https://github.com/Akshitha-git06

LinkedIn: https://www.linkedin.com/in/akshitha-thatla-755832260/

📬 Feedback: 
If you found this useful or have suggestions for improvement, feel free to reach out.
