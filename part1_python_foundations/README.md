# Part 1: Python Foundations

## Overview
This part demonstrates core Python programming skills through analysis of YouTube trending-video data from the United States, Great Britain, and India.

## Files and Folder Structure
- `trendpulse_part1_python_foundations.ipynb` — Google Colab notebook containing the analysis.
- `data/USvideos.csv` — United States video records.
- `data/GBvideos.csv` — Great Britain video records.
- `data/INvideos.csv` — India video records.
- `data/categories.csv` — Video category lookup data.

## Topics Covered
1. Configuration variables and formatted output.
2. Loading CSV datasets and validating required columns.
3. Data type conversion, missing values, and error handling.
4. Lists, dictionaries, tuples, and sets.
5. Variable scope and reusable functions.
6. String processing, loops, `range()`, `break`, and `continue`.
7. Conditional logic and rule-based video classification.
8. Counting and summarizing results by country and category.

## Requirements
- Python 3
- pandas

## How to Run
1. Open the notebook in Google Colab.
2. Upload the four CSV files when prompted, if needed.
3. Run all cells from top to bottom.
4. Review the printed summaries, data-cleaning results, and classification counts.

## Data Cleaning and Classification
The notebook converts numeric fields and boolean flags, handles invalid or missing values, and reports conversion failures. It also applies documented engagement thresholds to classify videos into categories such as Viral Hit, Steady Performer, Divisive, Low Engagement, and Unrated.

## Dataset Attribution
Dataset: YouTube Trending Video Statistics, including country-specific CSV files and category metadata.

Original source and attribution: Verify these details against the original dataset download or its accompanying documentation before publishing the final attribution.

## Notes
This is an educational data-analysis project. The datasets are included for analysis and are not claimed as original work.
