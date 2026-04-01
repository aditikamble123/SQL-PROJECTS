# 📊 Instagram Insights EDA using SQL

This project performs SQL-based exploratory data analysis on Instagram post performance data. It includes:

- Data import via `LOAD DATA INFILE`
- Summary statistics (avg impressions, likes)
- Post-type distribution
- Missing value identification
- Time trends in likes and impressions
- Outlier detection using standard deviation

## 📁 Files
- `eda_instagram.sql`: All SQL queries used for the analysis
- `sample.csv`: Sample (dummy) Instagram data for demonstration

## 💡 Tools Used
- MySQL 8.0
- SQL (DDL, DML, aggregation, group by)

## 🚀 How to Run
1. Set up MySQL
2. Place your cleaned CSV at the secure file path
3. Run the queries from `eda_instagram.sql` inside MySQL Workbench or CLI

---
## Pust to  Github
git init
git add .
git commit -m "Initial commit: Instagram SQL EDA"
git branch -M main
git remote add origin https://github.com/yourusername/instagram-sql-eda.git
git push -u origin main
