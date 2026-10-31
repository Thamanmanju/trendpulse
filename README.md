# TrendPulse – YouTube Trending Videos Data Analysis

## Project Overview

TrendPulse is an end-to-end data analysis project exploring YouTube trending-video data. It demonstrates a practical data analytics workflow, from loading and processing raw data to exploratory analysis, SQL querying, and spreadsheet reporting.

The project is organized into four stages, each focusing on a different set of data analytics skills.

## Project Objectives

- Explore and process real-world YouTube trending-video data.
- Apply Python fundamentals to solve data-processing problems.
- Use NumPy and Pandas for data manipulation and analysis.
- Perform exploratory data analysis (EDA) and create visualizations.
- Store, query, and analyze structured data using SQL.
- Build spreadsheet-based summaries and business reports.
- Communicate findings through reproducible notebooks and documentation.

## Technology Stack

| Technology | Purpose |
|---|---|
| Python | Programming and data processing |
| NumPy | Numerical operations |
| Pandas | Data cleaning and manipulation |
| Matplotlib / Seaborn | Data visualization |
| Jupyter Notebook / Google Colab | Interactive analysis |
| MySQL | Relational database and SQL analysis |
| Kingsoft Spreadsheet / Excel-compatible workbook | Spreadsheet analysis and reporting |
| GitHub | Version control and project documentation |

## Project Structure

```text
trendpulse/
│
├── part1_python_foundations/
│   ├── data/
│   ├── README.md
│   └── Python notebook
│
├── part2_numpy_pandas/
│   ├── README.md
│   └── NumPy and Pandas notebook
│
├── part3_visualization_eda/
│   ├── README.md
│   └── Visualization and EDA notebook
│
├── part4_sql_spreadsheet/
│   ├── data/
│   │   ├── categories.csv
│   │   ├── videos.csv
│   │   └── trending_records.csv
│   ├── README.md
│   ├── trendpulse_analysis.sql
│   └── TrendPulse_Excel_Analysis.xlsx
│
└── README.md
```

## Project Modules

### Part 1 – Python Foundations

- Python data structures and control flow.
- Functions, loops, conditions, and reusable logic.
- Processing video records and extracting title features.
- Classifying video performance using business rules.
- Handling missing values and edge cases.

[Explore Part 1](part1_python_foundations/)

### Part 2 – NumPy and Pandas

- Working with NumPy arrays and numerical operations.
- Data loading, filtering, and transformation.
- Grouping, aggregation, and data merging.
- Handling missing values and preparing datasets for analysis.

[Explore Part 2](part2_numpy_pandas/)

### Part 3 – Visualization and Exploratory Data Analysis

- Exploring dataset structure and distributions.
- Identifying patterns and trends.
- Comparing video performance across categories and countries.
- Creating visualizations to communicate analytical findings.

[Explore Part 3](part3_visualization_eda/)

### Part 4 – SQL and Spreadsheet Analysis

- Designing relational database tables.
- Working with primary keys and foreign keys.
- Writing SQL queries using filtering, sorting, aggregation, and joins.
- Building spreadsheet lookups and pivot-table summaries.
- Applying formulas, filters, sorting, and conditional formatting.
- Cross-checking SQL results against spreadsheet calculations.

[Explore Part 4](part4_sql_spreadsheet/)

## Dataset

The project uses YouTube trending-video data, including country-level trending records and video-category metadata.

The Part 4 cleaned dataset is organized into three related CSV files:

- `categories.csv` – category identifiers and category names.
- `videos.csv` – video metadata.
- `trending_records.csv` – country-level trending records and engagement metrics.

**Data attribution:** The original dataset publisher and download URL should be added here after verification against the original dataset documentation. The dataset is used for educational analysis and is not claimed as original data.

## How to Explore the Project

1. Open the relevant Part folder.
2. Read its `README.md` for dependencies and instructions.
3. Open the notebook in Google Colab or Jupyter Notebook where applicable.
4. Follow the documented execution steps.
5. For Part 4, follow the database setup instructions and execute `trendpulse_analysis.sql`.
6. Open the spreadsheet workbook to explore the analysis and summaries.

## Key Skills Demonstrated

- Python programming and problem-solving.
- Data cleaning and transformation.
- NumPy and Pandas data analysis.
- Exploratory data analysis and visualization.
- SQL database design and querying.
- Spreadsheet analysis and reporting.
- Documentation and version control using GitHub.

## Project Status

**Completed:** All four project modules are organized in this repository.

This project represents a practical learning journey through core data analytics tools and workflows.

---

**Repository:** [TrendPulse on GitHub](https://github.com/Thamanmanju/trendpulse)

