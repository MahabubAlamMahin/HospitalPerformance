# **🏥 Healthcare Data Analytics Project**
This project showcases data cleaning, transformation, and analysis on a healthcare dataset using SQL and Power BI. The aim is to derive actionable insights from patient records, hospital data, and billing information.

📁 Files Included
File Name	Description
healthcare_dataset.csv	Raw healthcare data including patient details, billing, admission info, and test results.
healthcare_usingSQL.sql	SQL script for cleaning, transforming, and analyzing the dataset.
Visual Representation.pbix	Power BI dashboard visualizing key metrics and insights.

🧼 Data Cleaning & Preprocessing (SQL)
Performed in healthcare_usingSQL.sql:

✅ Renamed inconsistent column headers (Patient Name → Patient_Name)

✅ Converted all patient names to uppercase for consistency.

✅ Standardized billing values to decimal(10,2) format.

✅ Replaced ambiguous Test_Results (e.g., "Inconclusive") with "Pending".

✅ Removed duplicate entries using ROW_NUMBER() and DELETE.

📊 Analytical Queries
1. Hospital Insights
Count of patients per hospital.

Average hospital stay duration (DATEDIFF()).

Hospitals ranked by average and total billing.

Top 10 hospitals by billing and patient volume.

2. Patient-Level Insights
Patients with the highest bills.

Top 10 clients by billing amount.

Identification of negative or unidentified billings.

3. Medical Insights
Most common medical conditions.

Average billing by Admission_Type.

📈 Visualizations (Power BI)
The Power BI report (Visual Representation.pbix) includes:

Pie charts showing hospital patient distribution.

Bar charts for top hospitals by billing.

Line/area charts for billing trends.

Tables for top patients and medical conditions.

🔧 Tools & Technologies
SQL Server – for data transformation and analysis.

Power BI – for dashboard and report generation.

CSV – as the base data format.

📌 Key Learnings
Data cleansing with SQL (renaming, formatting, standardization).

Advanced SQL: window functions, aggregation, and ranking.

Dashboard storytelling using Power BI for healthcare stakeholders.

