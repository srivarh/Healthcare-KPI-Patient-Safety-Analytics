# Patient Safety and Satisfaction Analytics Using Healthcare KPI Data

## Project Overview

This project analyzes healthcare KPI data to understand how hospital bed occupancy, staff responsiveness, and unassisted fall rates are connected to patient safety and patient satisfaction.

The goal of this project is to build an end-to-end analytics workflow using Python, PostgreSQL, and Power BI. The workflow includes data cleaning, KPI transformation, SQL view creation, dashboard development, insight generation, and recommendations for healthcare operational improvement.

This project is designed to demonstrate practical data analytics skills including data preparation, SQL analysis, KPI tracking, dashboard reporting, and business insight communication.

---

## Business Problem

Hospitals need a structured way to monitor operational performance and patient safety indicators together.

When bed occupancy is high, staff workload can increase. When staff responsiveness declines, patient satisfaction may decrease. When fall rates increase, patient safety risk becomes a concern.

Without a combined KPI monitoring approach, hospitals may miss:

- High-risk months
- Below-benchmark staff responsiveness
- Patient safety warning signs
- Workload-related performance issues
- Opportunities to improve staffing and response-time management

This project addresses that problem by analyzing healthcare KPI data and identifying patterns that can support better decision-making.

---

## Project Objectives

The main objectives of this project are:

1. Clean and prepare raw healthcare KPI data using Python
2. Track monthly, quarterly, and yearly KPI trends
3. Compare staff responsiveness against the benchmark target
4. Analyze relationships between occupancy, responsiveness, and fall rates
5. Identify high-risk months based on patient safety and operational indicators
6. Build interactive Power BI dashboards for reporting and decision-making
7. Generate actionable recommendations for improving patient safety and satisfaction

---

## Tools and Technologies Used

- Python
- Pandas
- PostgreSQL
- SQL
- Power BI
- Excel
- Data Cleaning
- Data Transformation
- KPI Analysis
- Dashboard Development
- Data Visualization
- Healthcare Analytics

---

## Dataset Overview

The dataset contains monthly healthcare KPI data related to hospital operations, patient experience, and patient safety.

### Key Columns

| Column | Description |
|---|---|
| Month / YearMonth | Time period identifier |
| Average Licensed Bed Occupancy Rate | Percentage of licensed beds in use |
| Unassisted Fall Rate per 1,000 Patient Days | Patient safety risk indicator |
| Staff Responsiveness Top Box Score | Patient experience and staff response measure |
| Staff Responsiveness Benchmark | Target score used for benchmark comparison |
| Benchmark Status | Indicates whether staff responsiveness is above or below benchmark |
| Occupancy Category | Derived category for occupancy level |
| Fall Risk Category | Derived category for fall risk level |

---

## Key KPI Definitions

### Average Licensed Bed Occupancy Rate

This measures the percentage of licensed hospital beds that are occupied. A high occupancy rate may indicate increased workload pressure on hospital staff and operational systems.

### Staff Responsiveness Top Box Score

This measures how often patients reported that staff responded quickly. A higher score indicates better patient experience. In this project, the benchmark target is 65.

### Unassisted Fall Rate per 1,000 Patient Days

This is a patient safety indicator. A higher fall rate suggests increased safety risk and the need for operational attention.

---

## Project Workflow

### 1. Data Cleaning and Preparation Using Python

The raw Excel dataset was cleaned and prepared using Python.

Main preparation steps included:

- Loaded the raw Excel dataset
- Selected the main case study sheet
- Removed blank rows and columns
- Standardized column names
- Converted month fields into date format
- Converted KPI fields into numeric data types
- Created Year, Month Name, Quarter, and Year-Month columns
- Derived Benchmark Status
- Derived Occupancy Category
- Derived Fall Risk Category
- Exported the cleaned dataset for SQL and Power BI analysis

---

### 2. SQL Analysis Using PostgreSQL

After cleaning the dataset, PostgreSQL views were created to structure the analysis layer for reporting.

The SQL views help organize the data into summaries, trends, benchmark results, high-risk months, and KPI relationship analysis.

### SQL Views Created

| SQL View | Purpose |
|---|---|
| healthcare_kpi_summary | Overall KPI aggregates |
| monthly_healthcare_kpi_trend | Month-by-month KPI trends |
| yearly_healthcare_kpi_summary | Annual KPI rollups |
| quarterly_healthcare_kpi_summary | Quarterly KPI breakdowns |
| staff_benchmark_summary | Staff responsiveness benchmark status counts |
| high_risk_months | Flagged high-risk periods |
| healthcare_kpi_correlation | KPI relationship analysis input |
| fall_risk_category_summary | Fall risk category distribution |

---

### 3. Power BI Dashboard Development

Power BI was used to build dashboards that present KPI performance and relationships clearly.

The dashboards include:

- KPI cards
- Monthly trend charts
- Yearly fall rate analysis
- Staff responsiveness benchmark comparison
- Benchmark status distribution
- KPI relationship scatter plots
- Fall risk category analysis
- Occupancy and safety trend visuals

---

## Dashboard 1: Healthcare KPI Overview

The first dashboard provides a high-level view of hospital KPI performance.

### Dashboard Components

- Average Occupancy Rate
- Average Fall Rate
- Average Staff Responsiveness Score
- Monthly Occupancy Trend
- Yearly Fall Rate Trend
- Staff Responsiveness Benchmark Comparison
- Benchmark Status Distribution
- Month and Year slicers

### Key Results

| KPI | Result | Interpretation |
|---|---:|---|
| Average Occupancy Rate | 96% | Indicates consistently high hospital utilization |
| Average Fall Rate | 2.61 | Falls per 1,000 patient days, requiring continuous monitoring |
| Average Staff Responsiveness Score | 63.09 | Slightly below benchmark target of 65 |
| Months Below Benchmark | 39 | Staff responsiveness was below benchmark in many months |

---

## Dashboard 2: KPI Relationship Analysis

The second dashboard focuses on the relationships between key healthcare KPIs.

### Relationship Areas Analyzed

1. Occupancy Rate vs Fall Rate
2. Occupancy Rate vs Staff Responsiveness
3. Staff Responsiveness vs Fall Rate

### Key Relationship Insights

- Higher occupancy is associated with higher fall rates
- Staff responsiveness tends to decline as occupancy increases
- Lower staff responsiveness is associated with higher fall rates

These patterns suggest that hospital workload pressure may affect both patient experience and patient safety outcomes.

---

## Key Insights

The analysis produced the following insights:

- The average bed occupancy rate was 96%, showing consistently high hospital utilization.
- The average staff responsiveness score was 63.09, which is slightly below the benchmark target of 65.
- Staff responsiveness fell below benchmark in 39 months.
- High occupancy periods may increase operational pressure on staff.
- Lower staff responsiveness is associated with higher fall rates.
- Occupancy, responsiveness, and fall rate should be monitored together instead of separately.
- High-risk months can be identified earlier by combining workload, responsiveness, and fall-risk indicators.

---

## Recommendations

Based on the analysis, the following recommendations were identified:

1. Monitor occupancy trends daily and add staffing support during high-demand periods.
2. Define clear response-time targets and escalate delays when workload increases.
3. Prioritize fall-prevention checks during peak occupancy months.
4. Review occupancy, responsiveness, and fall rates together in routine safety meetings.
5. Use KPI dashboards to identify below-benchmark performance early.
6. Focus improvement efforts on months and units with high occupancy and low responsiveness.

---

## Repository Structure

```text
healthcare-kpi-patient-safety-analytics/
│
├── README.md
│
├── data/
│   ├── raw/
│   │   └── healthcare_kpi_raw.xlsx
│   │
│   └── cleaned/
│       └── healthcare_kpi_cleaned.csv
│
├── python/
│   └── data_cleaning_healthcare_kpi.py
│
├── sql/
│   └── healthcare_kpi_views.sql
│
├── powerbi/
│   └── healthcare_kpi_dashboard.pbix
│
├── images/
│   ├── dashboard_1_healthcare_kpi_overview.png
│   └── dashboard_2_kpi_relationship_analysis.png
│
└── presentation/
    └── Patient_Safety_and_Satisfaction_Analytics.pdf
