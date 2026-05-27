-- healthcare_kpi_views.sql
-- Project: Patient Safety and Satisfaction Analytics Using Healthcare KPI Data
-- Database: PostgreSQL
-- Purpose: Create analytical SQL views for Power BI reporting

-- NOTE:
-- Replace table name healthcare_kpi_cleaned with your actual table name if different.
-- Expected columns:
-- year_month, year, month_name, quarter,
-- average_licensed_bed_occupancy_rate,
-- unassisted_fall_rate_per_1000_patient_days,
-- staff_responsiveness_top_box_score,
-- staff_responsiveness_benchmark,
-- benchmark_status,
-- occupancy_category,
-- fall_risk_category

-- 1. Overall KPI Summary
CREATE OR REPLACE VIEW healthcare_kpi_summary AS
SELECT
    ROUND(AVG(average_licensed_bed_occupancy_rate)::numeric, 2) AS avg_occupancy_rate,
    ROUND(AVG(unassisted_fall_rate_per_1000_patient_days)::numeric, 2) AS avg_fall_rate,
    ROUND(AVG(staff_responsiveness_top_box_score)::numeric, 2) AS avg_staff_responsiveness,
    COUNT(*) AS total_months
FROM healthcare_kpi_cleaned;


-- 2. Monthly KPI Trend
CREATE OR REPLACE VIEW monthly_healthcare_kpi_trend AS
SELECT
    year_month,
    year,
    month_name,
    quarter,
    ROUND(AVG(average_licensed_bed_occupancy_rate)::numeric, 2) AS avg_occupancy_rate,
    ROUND(AVG(unassisted_fall_rate_per_1000_patient_days)::numeric, 2) AS avg_fall_rate,
    ROUND(AVG(staff_responsiveness_top_box_score)::numeric, 2) AS avg_staff_responsiveness
FROM healthcare_kpi_cleaned
GROUP BY year_month, year, month_name, quarter
ORDER BY year_month;


-- 3. Yearly KPI Summary
CREATE OR REPLACE VIEW yearly_healthcare_kpi_summary AS
SELECT
    year,
    ROUND(AVG(average_licensed_bed_occupancy_rate)::numeric, 2) AS avg_occupancy_rate,
    ROUND(AVG(unassisted_fall_rate_per_1000_patient_days)::numeric, 2) AS avg_fall_rate,
    ROUND(AVG(staff_responsiveness_top_box_score)::numeric, 2) AS avg_staff_responsiveness,
    COUNT(*) AS month_count
FROM healthcare_kpi_cleaned
GROUP BY year
ORDER BY year;


-- 4. Quarterly KPI Summary
CREATE OR REPLACE VIEW quarterly_healthcare_kpi_summary AS
SELECT
    year,
    quarter,
    ROUND(AVG(average_licensed_bed_occupancy_rate)::numeric, 2) AS avg_occupancy_rate,
    ROUND(AVG(unassisted_fall_rate_per_1000_patient_days)::numeric, 2) AS avg_fall_rate,
    ROUND(AVG(staff_responsiveness_top_box_score)::numeric, 2) AS avg_staff_responsiveness,
    COUNT(*) AS month_count
FROM healthcare_kpi_cleaned
GROUP BY year, quarter
ORDER BY year, quarter;


-- 5. Staff Responsiveness Benchmark Summary
CREATE OR REPLACE VIEW staff_benchmark_summary AS
SELECT
    benchmark_status,
    COUNT(*) AS month_count,
    ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ())::numeric, 2) AS percentage_of_months
FROM healthcare_kpi_cleaned
GROUP BY benchmark_status
ORDER BY month_count DESC;


-- 6. High-Risk Months
CREATE OR REPLACE VIEW high_risk_months AS
SELECT
    year_month,
    year,
    month_name,
    quarter,
    average_licensed_bed_occupancy_rate,
    unassisted_fall_rate_per_1000_patient_days,
    staff_responsiveness_top_box_score,
    benchmark_status,
    occupancy_category,
    fall_risk_category
FROM healthcare_kpi_cleaned
WHERE fall_risk_category = 'High Fall Risk'
   OR benchmark_status = 'Below Benchmark'
   OR occupancy_category IN ('High Occupancy', 'Very High Occupancy')
ORDER BY year_month;


-- 7. KPI Correlation Input View
-- Use this view in Power BI scatter plots or external correlation analysis.
CREATE OR REPLACE VIEW healthcare_kpi_correlation AS
SELECT
    year_month,
    average_licensed_bed_occupancy_rate AS occupancy_rate,
    unassisted_fall_rate_per_1000_patient_days AS fall_rate,
    staff_responsiveness_top_box_score AS staff_responsiveness
FROM healthcare_kpi_cleaned
WHERE average_licensed_bed_occupancy_rate IS NOT NULL
  AND unassisted_fall_rate_per_1000_patient_days IS NOT NULL
  AND staff_responsiveness_top_box_score IS NOT NULL
ORDER BY year_month;


-- 8. Fall Risk Category Summary
CREATE OR REPLACE VIEW fall_risk_category_summary AS
SELECT
    fall_risk_category,
    COUNT(*) AS month_count,
    ROUND(AVG(unassisted_fall_rate_per_1000_patient_days)::numeric, 2) AS avg_fall_rate,
    ROUND(AVG(average_licensed_bed_occupancy_rate)::numeric, 2) AS avg_occupancy_rate,
    ROUND(AVG(staff_responsiveness_top_box_score)::numeric, 2) AS avg_staff_responsiveness
FROM healthcare_kpi_cleaned
GROUP BY fall_risk_category
ORDER BY month_count DESC;
