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

## SQL Analysis and Query Results

The database contains three related tables:

- `categories`: category information
- `videos`: video details and category references
- `trending_records`: country-wise trending statistics

### Database record counts

| Table | Record count |
|---|---:|
| categories | 17 |
| videos | 14,699 |
| trending_records | 46,000 |

### SQL Queries

#### 1. Filter trending records by country (WHERE)

```sql
SELECT *
FROM trending_records
WHERE country = 'US';
```

**Purpose:** Retrieves trending records from the United States.

#### 2. Find the top 10 videos by views (ORDER BY and LIMIT)

```sql
SELECT video_id, country, views
FROM trending_records
ORDER BY views DESC
LIMIT 10;
```

**Purpose:** Identifies the 10 highest-view trending records.

#### 3. Find unique countries (DISTINCT)

```sql
SELECT DISTINCT country
FROM trending_records;
```

**Purpose:** Lists the unique countries represented in the dataset.

#### 4. Use column aliases

```sql
SELECT
    video_id,
    views AS total_views,
    likes AS total_likes,
    comment_count AS total_comments
FROM trending_records
LIMIT 10;
```

**Purpose:** Uses readable aliases for the selected columns.

#### 5. Calculate average views by country (GROUP BY)

```sql
SELECT
    country,
    ROUND(AVG(views), 2) AS average_views
FROM trending_records
GROUP BY country;
```

**Purpose:** Compares average trending-record views across countries.

#### 6. Find categories with more than 100 trending records (GROUP BY and HAVING)

```sql
SELECT
    c.category_name,
    COUNT(*) AS trending_record_count
FROM trending_records AS tr
INNER JOIN videos AS v
    ON tr.video_id = v.video_id
INNER JOIN categories AS c
    ON v.category_id = c.category_id
GROUP BY c.category_id, c.category_name
HAVING COUNT(*) > 100
ORDER BY trending_record_count DESC;
```

**Purpose:** Identifies categories with a substantial number of trending records.

#### 7. INNER JOIN — trending records with video details

```sql
SELECT
    tr.video_id,
    tr.country,
    tr.views,
    v.title,
    v.channel_title
FROM trending_records AS tr
INNER JOIN videos AS v
    ON tr.video_id = v.video_id
LIMIT 20;
```

**Purpose:** Combines matching trending records with their video details.

**Why INNER JOIN?** Only records with a matching video in both tables are returned.

#### 8. LEFT JOIN — retain all videos

```sql
SELECT
    v.video_id,
    v.title,
    tr.country,
    tr.views
FROM videos AS v
LEFT JOIN trending_records AS tr
    ON v.video_id = tr.video_id
LIMIT 20;
```

**Purpose:** Keeps all videos, including videos without a matching trending record.

**Why LEFT JOIN?** The videos table is the left table, so all its records are retained.

#### 9. RIGHT JOIN — retain all categories

```sql
SELECT
    c.category_id,
    c.category_name,
    v.video_id,
    v.title
FROM videos AS v
RIGHT JOIN categories AS c
    ON v.category_id = c.category_id
ORDER BY c.category_id;
```

**Purpose:** Keeps every category, including categories without a matching video.

**Why RIGHT JOIN?** The categories table is on the right, so all its records are retained.

### SQL and Spreadsheet Cross-Check

| Metric | Spreadsheet result | SQL result |
|---|---:|---:|
| US trending records | 16,000 | Pending verification |
| Overall average views | 1,179,665 | Pending verification |

The spreadsheet results will be compared with the corresponding SQL query results to confirm consistency.

### Spreadsheet Analysis

The workbook `TrendPulse_Excel_Analysis.xlsx` contains four worksheets:

1. `Trending_Data` — trending records and lookup results.
2. `Videos` — video details and category names.
3. `Categories` — category ID and category name mapping.
4. `Analysis` — pivot table and business metrics.

**Spreadsheet techniques used:**

- VLOOKUP to retrieve category names and category IDs.
- Pivot table showing average views by category and country.
- COUNTIF to count US trending records.
- COUNTA to count trending records.
- SUM and AVERAGE to calculate view metrics.
- Filters and descending sorting by views.
- Conditional formatting to highlight the top 10% of views.
- Named range `Total_Views` used in formulas.

### Join Design Decisions

- **INNER JOIN:** Used when only matching records are required.
- **LEFT JOIN:** Used when all videos must remain in the result, even if no trending record exists.
- **RIGHT JOIN:** Used when all categories must remain in the result, even if no video belongs to a category.

### Conclusion

SQL was used to retrieve, filter, aggregate, and combine relational data. Spreadsheet analysis was used to create lookup columns, summarize results with a pivot table, apply conditional formatting, and calculate business metrics. Comparing both tools helps validate the analysis.


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
