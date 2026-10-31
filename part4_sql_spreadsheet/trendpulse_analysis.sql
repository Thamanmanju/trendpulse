
-- =====================================================
-- TrendPulse Project - Part 4 SQL Analysis
-- Database: TrendPulse
-- Tables: categories, videos, trending_records
-- =====================================================

-- 1. Filter: Find all US trending records
SELECT *
FROM trending_records
WHERE country = 'US';


-- 2. Sorting and LIMIT: Top 10 videos by views
SELECT video_id, country, views
FROM trending_records
ORDER BY views DESC
LIMIT 10;


-- 3. DISTINCT: List all available countries
SELECT DISTINCT country
FROM trending_records
ORDER BY country;


-- 4. Column aliases: Display readable column names
SELECT
    video_id AS Video_ID,
    country AS Country,
    views AS Total_Views,
    likes AS Total_Likes
FROM trending_records
LIMIT 10;


-- 5. GROUP BY: Average views by country
SELECT
    country,
    ROUND(AVG(views), 2) AS average_views
FROM trending_records
GROUP BY country
ORDER BY average_views DESC;


-- 6. INNER JOIN: Category-wise trending performance
SELECT
    c.category_name,
    tr.country,
    COUNT(*) AS trending_count,
    ROUND(AVG(tr.views), 2) AS average_views
FROM trending_records AS tr
INNER JOIN videos AS v
    ON tr.video_id = v.video_id
INNER JOIN categories AS c
    ON v.category_id = c.category_id
GROUP BY c.category_name, tr.country
HAVING COUNT(*) > 100
ORDER BY trending_count DESC;


-- 7. INNER JOIN: Trending records with video details
SELECT
    tr.video_id,
    v.title,
    v.channel_title,
    tr.country,
    tr.views
FROM trending_records AS tr
INNER JOIN videos AS v
    ON tr.video_id = v.video_id
LIMIT 20;


-- 8. LEFT JOIN: Include videos even if they have no trending record
SELECT
    v.video_id,
    v.title,
    COUNT(tr.record_id) AS trending_occurrences
FROM videos AS v
LEFT JOIN trending_records AS tr
    ON v.video_id = tr.video_id
GROUP BY v.video_id, v.title
ORDER BY trending_occurrences DESC
LIMIT 20;


-- 9. RIGHT JOIN: Include all categories
SELECT
    c.category_id,
    c.category_name,
    COUNT(v.video_id) AS video_count
FROM videos AS v
RIGHT JOIN categories AS c
    ON v.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY video_count DESC;


-- =====================================================
-- SQL and Spreadsheet Cross-checks
-- =====================================================

-- 10. Count US trending records
SELECT
    COUNT(*) AS us_trending_records
FROM trending_records
WHERE country = 'US';


-- 11. Overall average views
SELECT
    ROUND(AVG(views), 2) AS overall_average_views
FROM trending_records;

