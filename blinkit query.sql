RENAME TABLE `tableconvert.com_de681h`
TO BlinkIT_Sales;


-- Total Rows
SELECT COUNT(*) AS Total_Rows
FROM BlinkIT_Sales;

SELECT *
FROM BlinkIT_Sales
LIMIT 10;

SHOW COLUMNS FROM BlinkIT_Sales;


SELECT `Item Identifier`
FROM BlinkIT_Sales;


-- Duplicate count
SELECT `Item Identifier`,
       COUNT(*) AS Duplicate_Count
FROM BlinkIT_Sales
GROUP BY `Item Identifier`
HAVING COUNT(*) > 1;


-- Total Sales
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM BlinkIT_Sales;


-- Average Sales
SELECT AVG(Sales),2 AS Average_Sales
FROM BlinkIT_Sales;


-- Duplicate Products
SELECT `Item Identifier`,
       COUNT(*) AS Duplicate_Count
FROM BlinkIT_Sales
GROUP BY `Item Identifier`
HAVING COUNT(*) > 1;

-- Sales by Item Type
SELECT `Item Type`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM BlinkIT_Sales
GROUP BY `Item Type`
ORDER BY Total_Sales DESC;


-- Sales by Fat Content
SELECT `Item Fat Content`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM BlinkIT_Sales
GROUP BY `Item Fat Content`;


-- Sales by Outlet Size
SELECT `Outlet Type`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM BlinkIT_Sales
GROUP BY `Outlet Type`
ORDER BY Total_Sales DESC;


-- Sales by Location Type
SELECT `Outlet Location Type`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM BlinkIT_Sales
GROUP BY `Outlet Location Type`;

-- Top 10 Selling Products
SELECT `Item Identifier`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM BlinkIT_Sales
GROUP BY `Item Identifier`
ORDER BY Total_Sales DESC
LIMIT 10;


-- Highest Rated Products
SELECT `Item Identifier`,
       Rating
FROM BlinkIT_Sales
ORDER BY Rating DESC
LIMIT 10;


-- Sales by Establishment Year
SELECT `Outlet Establishment Year`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM BlinkIT_Sales
GROUP BY `Outlet Establishment Year`
ORDER BY `Outlet Establishment Year`;


-- Average Visibility by Item Type
SELECT `Item Type`,
       ROUND(AVG(`Item Visibility`),4) AS Avg_Visibility
FROM BlinkIT_Sales
GROUP BY `Item Type`
ORDER BY Avg_Visibility DESC;


-- Top 5 Outlets by Sales
SELECT `Outlet Identifier`,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM BlinkIT_Sales
GROUP BY `Outlet Identifier`
ORDER BY Total_Sales DESC
LIMIT 5;

-- Sales Performance Category
SELECT `Item Identifier`,
       Sales,
       CASE
           WHEN Sales > 300 THEN 'High Sales'
           WHEN Sales BETWEEN 150 AND 300 THEN 'Medium Sales'
           ELSE 'Low Sales'
       END AS Sales_Category
FROM BlinkIT_Sales;

-- Rank Item Types by Sales
SELECT `Item Identifier`,
       Sales,
       RANK() OVER (ORDER BY Sales DESC) AS Sales_Rank
FROM BlinkIT_Sales;

-- Top Outlet in Each Location
SELECT *
FROM (
    SELECT
        `Outlet Location Type`,
        `Outlet Identifier`,
        SUM(Sales) AS Total_Sales,
        RANK() OVER (
            PARTITION BY `Outlet Location Type`
            ORDER BY SUM(Sales) DESC
        ) AS rk
    FROM BlinkIT_Sales
    GROUP BY `Outlet Location Type`, `Outlet Identifier`
) AS x
WHERE rk = 1;




