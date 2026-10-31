# Part 4: SQL and Spreadsheet

## Overview
This folder contains SQL analysis and spreadsheet work for the TrendPulse project.

## Data
All required CSV files will be stored in the data/ directory.

## Dependencies
See requirements.txt for any required Python packages. SQL and spreadsheet tools should be documented where applicable.

## How to Run
Run the SQL scripts in a compatible SQL environment and open the Excel workbook to inspect the spreadsheet analysis.

## Design Decisions
Use readable SQL queries, clear spreadsheet formulas, and explanations of important findings.


## Excel Spreadsheet Analysis

### 1. Tool Used
- Kingsoft Spreadsheet (WPS Office)
- MySQL Workbench for SQL analysis

### 2. Workbook Structure

File: `TrendPulse_Excel_Analysis.xlsx`

The workbook contains four worksheets:

| Worksheet | Description |
|---|---|
| Trending_Data | 46,000 trending records |
| Videos | 14,699 unique video records |
| Categories | 17 category records |
| Analysis | Pivot Table and business KPI summary |

### 3. Data Lookup

Used VLOOKUP to retrieve category information.

**Videos worksheet:**

```excel
=VLOOKUP(D2,Categories!$A$2:$B$18,2,FALSE)
```

This maps each category ID to its category name.

**Trending_Data worksheet:**

```excel
=VLOOKUP(B2,Videos!$A$2:$D$14700,4,FALSE)
```

This retrieves the category ID using video_id.

```excel
=VLOOKUP(I2,Categories!$A$2:$B$18,2,FALSE)
```

This retrieves the category name.

Both lookup operations were filled down and validated.

### 4. Pivot Table

Created a Pivot Table using the `Trending_Data` worksheet.

- Source range: `A1:J46001`
- Rows: `category_name`
- Columns: `country`
- Values: Average of `views`
- Filters: None

**Purpose:** Compare average video views across categories and countries.

### 5. Excel Formulas

| Business metric | Formula |
|---|---|
| Total records | `=COUNTA(Trending_Data!A2:A46001)` |
| US trending records | `=COUNTIF(Trending_Data!C2:C46001,"US")` |
| Total views | `=SUM(Total_Views)` |
| Average views | `=AVERAGE(Total_Views)` |

### 6. Filters and Sorting

- Enabled filters on the Trending_Data worksheet.
- Applied descending sorting on the views column.
- Tested country filtering using the country column.

### 7. Conditional Formatting

Applied conditional formatting to:

`Trending_Data!E2:E46001`

Rule: Highlight cell values greater than the 90th percentile of views.

Formula:

```excel
=PERCENTILE($E$2:$E$46001,0.9)
```

Used a green fill to highlight the highest-performing records.

### 8. Named Range

Created the named range:

`Total_Views`

Reference:

```excel
=Trending_Data!$E$2:$E$46001
```

Used the named range in the following formulas:

```excel
=SUM(Total_Views)
=AVERAGE(Total_Views)
```

### 9. SQL and Excel Cross-Check

Compared two metrics between MySQL and Kingsoft Spreadsheet.

| Metric | SQL result | Excel result |
|---|---:|---:|
| Total trending records | 46000 | 46000 |
| Overall average views | [1179665] | [1179665] |

Both results should agree. The average views comparison is rounded to two decimal places.

### 10. Workbook Output

The completed workbook provides category-level and country-level average views, lookup-based category information, headline business metrics, filters, sorting and conditional formatting.
