# Call Center Workforce & Performance Analytics

An end-to-end personal data analytics project focused on call center performance, workforce efficiency, and customer service quality.

## Project Overview

This project uses Excel, SQL Server, and Power BI to clean, transform, model, and analyze call center data. Two interactive dashboards support performance comparisons across teams, shifts, and agents.

## Business Objectives

- Monitor operational KPIs and customer service quality.
- Compare performance across teams and shifts.
- Evaluate agent workload and efficiency.
- Identify opportunities for further investigation and improvement.

## Dataset

| Metric | Value |
|---|---:|
| Records | 320 |
| Agents | 12 |
| Teams | 3 |
| Shifts | 3 |
| Calls handled | 14,468 |

This is a personal learning project using practice data, not verified production data.

## Tools & Skills

- **Excel:** Data cleaning, standardization, PivotTables.
- **SQL Server / SSMS:** Filtering, aggregation, joins, and subqueries.
- **Power Query:** Data transformation, missing values, and date correction.
- **Power BI:** Star schema, one-to-many relationships, DAX measures, interactive dashboards, and conditional formatting.
- **Data analysis:** KPI comparison, descriptive insights, and recommendations.

## Data Model

- `Callcenter`: Fact table containing operational performance records.
- `DimAgent`: Agent and team dimension.
- `DimDate`: Date dimension.

The dimension tables filter the fact table through one-to-many relationships.

## Dashboards

### 1. Call Center Overview

![Call Center Overview](05.%20Screenshots/Dashboard_1.png)

Overall KPIs, team comparisons, top agents by calls handled, and interactive team and shift filters.

### 2. Workforce & Efficiency

![Workforce and Efficiency](05.%20Screenshots/Dashboard_2.png)

Agent performance, average handling time, workload distribution by shift, and occupancy trends.

## Key Insights

- **Team C:** Highest call volume (4,927) and FCR (78.81%), but highest AHT (7.85) and lowest CSAT (4.30) among teams.
- **Team A:** Lowest AHT (7.59), alongside the lowest team FCR (77.87%).
- **Team B:** Highest team CSAT (4.35), despite the lowest call volume (4,651).
- **Evening shift:** Highest call volume (4,871), highest AHT (7.78), and lowest FCR (77.38%) among shifts.
- **Afternoon shift:** Highest FCR (79.62%), but lowest CSAT (4.31).
- **Morning shift:** Lowest AHT (7.60) and highest CSAT (4.34).

These are descriptive comparisons, not evidence of causal relationships.

## Recommendations

- Investigate handling time and resolution quality in the evening shift.
- Compare call types and complexity before drawing conclusions about agent performance.
- Evaluate performance using multiple KPIs rather than call volume alone.
- Validate occupancy calculations and source data before using occupancy metrics for operational decisions.

## Project Files

| Resource | File |
|---|---|
| Dataset | [Excel workbook](01.%20Dataset/CallCenter.xlsx) |
| SQL | [Analysis queries](02.%20SQL/CallCenter_Analysis.sql) |
| Power BI | [Interactive report (.pbix)](03.%20Power%20BI/CallCenter_Dashboard.pbix) |
| Documentation | [Project report (PDF)](04.%20Report/CallCenter_Project_Report.pdf) |
| Visuals | [Dashboard screenshots](05.%20Screenshots/) |

## How to Explore

1. View the dashboard screenshots above or download the PDF report.
2. Download the Excel dataset and SQL script to explore the analysis.
3. Open the PBIX file using Power BI Desktop. Refreshing the report may require updating local data source connections.

## Limitations

The analysis is based on a limited practice dataset. Differences in KPIs do not establish causation. Occupancy values above 100%, if present, require validation of the source data and calculation logic.

