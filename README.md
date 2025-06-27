# 🏥 Healthcare Data Analytics Project

This project demonstrates data cleaning, transformation, and analytical insights generation on a healthcare dataset using **SQL** and **Power BI**. The goal is to extract meaningful patterns from patient and hospital data and visualize them for decision-making.

---

## 🧼 Data Cleaning & Preprocessing (SQL)

All cleaning operations were done in [`healthcare_usingSQL.sql`](healthcare_usingSQL.sql):

- ✅ Renamed inconsistent column headers (`Patient Name` → `Patient_Name`)
- ✅ Converted all patient names to uppercase
- ✅ Standardized billing values to `decimal(10,2)` format
- ✅ Replaced ambiguous test results (e.g., `"Inconclusive"` → `"Pending"`)
- ✅ Removed duplicate entries using `ROW_NUMBER()` and `DELETE`

---

## 📊 Analytical Queries

### 🔹 Hospital Insights
- Count of patients per hospital
- Average hospital stay duration using `DATEDIFF()`
- Ranked hospitals by:
  - Average billing
  - Total billing
  - Patient volume

### 🔹 Patient-Level Insights
- Patients with the highest billing per hospital
- Top 10 clients by overall billing
- Detection of unidentified (negative) billing entries

### 🔹 Medical Insights
- Most common medical conditions
- Average billing grouped by `Admission_Type`

---

## 📈 Visualizations (Power BI)

The Power BI dashboard (`Visual Representation.pbix`) includes:

- 📌 Pie charts for patient distribution by hospital
- 📊 Bar charts ranking top hospitals by billing
- 📉 Line/area charts for billing trends
- 📋 Tabular reports for top patients and common conditions

---

## 🛠️ Tools & Technologies

- **SQL Server** – data cleaning and transformation
- **Power BI** – report building and visualization
- **CSV** – raw dataset format

---

## 📌 Key Learnings

- Cleaning and transforming healthcare data using SQL
- Advanced SQL operations including window functions, aggregation, and ranking
- Visual storytelling with Power BI to inform healthcare decisions

---

## 📬 Contact

**Md. Mahabub Alam Mahin**  
Feel free to reach out on [GitHub](https://github.com/) or [LinkedIn](https://linkedin.com/) for any questions or feedback.

