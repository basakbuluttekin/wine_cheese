use wine_database;

SELECT * FROM country_data;
SELECT * FROM province_data;
SELECT * FROM winery_data;
SELECT * FROM wine_data;
SELECT * FROM variety_data;

## Query_1 = Number of wines, wineries and provinces per country:

SELECT c.country AS 'Country',COUNT(DISTINCT p.province_id) AS Number_of_Provinces,
				 COUNT(DISTINCT wd.winery_id) AS Number_of_Wineries, 
                 COUNT(DISTINCT w.wine_id) AS Number_of_Wines,
                 round(COUNT(DISTINCT w.wine_id) / COUNT(DISTINCT wd.winery_id)) AS wine_per_winery_ratio
FROM wine_data AS w
JOIN winery_data AS wd ON w.winery_id = wd.winery_id
JOIN province_data AS p ON w.province_id = p.province_id
JOIN country_data AS c ON p.country_id = c.country_id
GROUP BY c.country
ORDER BY Number_of_wines DESC;

## Query_2 = Grading points of the wines to make it clear:

SELECT wine_quality, COUNT(*) AS Wine_Count
FROM (
    SELECT wine_name, price_USD, points,
        CASE
            WHEN points > 96 THEN 'Excellent'
            WHEN points > 92 THEN 'Very Good'
            WHEN points > 88 THEN 'Good'
            WHEN points > 84 THEN 'Average'
            ELSE 'Poor'
        END AS Wine_Quality
    FROM wine_data
) AS subquery
GROUP BY wine_quality
ORDER BY Wine_Count DESC;

## Query_3 grouping the wines based on rating data for each country:

SELECT c.country AS 'Country', 
	   p.province AS 'Province', 
       subquery.wine_quality, 
       COUNT(*) AS Wine_Count
FROM (
    SELECT w.wine_name, w.price_USD, w.points,
        CASE
            WHEN w.points > 96 THEN 'Excellent'
            WHEN w.points > 92 THEN 'Very Good'
            WHEN w.points > 88 THEN 'Good'
            WHEN w.points > 84 THEN 'Average'
            ELSE 'Poor'
        END AS Wine_Quality,
        w.province_id
    FROM wine_data AS w
) AS subquery
JOIN province_data AS p ON p.province_id = subquery.province_id
JOIN country_data AS c ON c.country_id = p.country_id
GROUP BY c.country, p.province, subquery.wine_quality
ORDER BY Wine_Count DESC;



## Query_4 Finding the wineries with the most variety (with variety names):

SELECT wd.winery_id AS 'Winery ID', 
	   c.country AS 'Country', 
       p.province AS 'Province', 
       wd.winery AS 'Winery', 
					COUNT(DISTINCT w.variety_id) AS variety_count, 
                    GROUP_CONCAT(DISTINCT v.variety) AS variety_names
FROM wine_data AS w
JOIN winery_data AS wd ON w.winery_id = wd.winery_id
JOIN province_data AS p ON w.province_id = p.province_id
JOIN country_data AS c ON p.country_id = c.country_id
JOIN variety_data AS v ON w.variety_id = v.variety_id
GROUP BY wd.winery_id, wd.winery, p.province, c.country
ORDER BY COUNT(DISTINCT w.variety_id) ASC
LIMIT 20;


## Query_5 The most and least expensive wine:

SELECT wd.wine_name AS 'Wine Name' ,
	   wd.price_USD AS 'Wine Price (USD)' , 
       cd.country AS 'Country', 
       pd.province AS 'Province'
FROM wine_data wd
JOIN province_data pd ON wd.province_id = pd.province_id
JOIN country_data cd ON pd.country_id = cd.country_id
WHERE wd.price_USD = (SELECT MAX(price_USD) FROM wine_data) 
   OR wd.price_USD = (SELECT MIN(price_USD) FROM wine_data WHERE price_USD > 0)
ORDER BY wd.price_USD DESC;

