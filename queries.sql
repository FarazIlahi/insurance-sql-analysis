-- ========================================================================================
-- Analysis 1: How do medical insurance charges differ between smokers and non-smokers?
-- Insight: Insurances are significantly higher for smokers compared to non-smokers.
-- ========================================================================================

SELECT smoker, 
	COUNT(*) AS total_people,	
	ROUND(AVG(charges), 2) AS average_cost,
	ROUND(MIN(charges), 2) AS min_cost,
	ROUND(MAX(charges), 2) AS max_cost
FROM insurance
GROUP BY smoker;



-- ========================================================================================
-- Analysis 2: How do insurance charges vary across different age groups?
-- Insight: Insurance charges tend to increase with age,
--			indicating a positive relationship between age and costs
-- ========================================================================================

WITH age_buckets AS(
SELECT 
age,
charges,
FLOOR((age - 18) / 10) AS bucket
FROM insurance
)
SELECT 
CASE
	WHEN bucket = 0 THEN '18-27'
	WHEN bucket = 1 THEN '28-37'
	WHEN bucket = 2 THEN '38-47'
	WHEN bucket = 3 THEN '48-57'
	ELSE '58+'
END AS age_label,
COUNT(*) AS total_people, ROUND(AVG(charges), 2) AS average_cost
FROM age_buckets
GROUP BY bucket
ORDER BY bucket ASC;



-- ========================================================================================
-- Analysis 3: Does the number of children/dependents impact insurance charges?
-- Insight: The distribution of individuals by number of children is relativly even,
--			with no clear impact on the insurance
-- ========================================================================================

SELECT children, 
	COUNT(*) AS total_people,	
	ROUND(AVG(charges), 2) AS average_cost,
	ROUND(MIN(charges), 2) AS min_cost,
	ROUND(MAX(charges), 2) AS max_cost
FROM insurance
GROUP BY children
ORDER BY children;



-- ========================================================================================
-- Analysis 4: How does body mass index (BMI) influence insurance charges?
-- Insight: Insurance charges increase alongside BMI,
--			suggesting high health risks with higher costs
-- ========================================================================================

WITH bmi_buckets AS(
SELECT 
bmi,
charges,
FLOOR((floor(bmi) - 15) / 10) AS bucket
FROM insurance
)
SELECT 
CASE
	WHEN bucket = 0 THEN '15-24'
	WHEN bucket = 1 THEN '25-34'
	WHEN bucket = 2 THEN '35-44'
	ELSE '45+'
END AS bmi_label,
COUNT(*) AS total_people, ROUND(AVG(charges), 2) AS average_cost
FROM bmi_buckets
GROUP BY bucket
ORDER BY bucket ASC;



-- ========================================================================================
-- Analysis 5: Are there significant differences in insurance charges across geographic regions?
-- Insight: There are no significant differences in insurance charges across the regions,
--			indicating geography is not a primary cost driver.
-- ========================================================================================
SELECT region, 
	COUNT(*) AS total_people,	
	ROUND(AVG(charges), 2) AS average_cost,
	ROUND(MIN(charges), 2) AS min_cost,
	ROUND(MAX(charges), 2) AS max_cost
FROM insurance
GROUP BY region
ORDER BY region;



-- ========================================================================================
-- Analysis 6: How does smoking status impact insurance charges across different age groups?
-- Insight: Smokers consistently incur higher charges compared to non-smokers across all age
--			groups, indicating that smoking is a dominant cost factor regardless of age.
-- ========================================================================================

WITH age_buckets AS(
SELECT 
age,
smoker,
charges,
FLOOR((age - 18) / 10) AS bucket
FROM insurance
)
SELECT 
CASE
	WHEN bucket = 0 THEN '18-27'
	WHEN bucket = 1 THEN '28-37'
	WHEN bucket = 2 THEN '38-47'
	WHEN bucket = 3 THEN '48-57'
	ELSE '+58'
END AS age_label,
CASE
	WHEN smoker = 0 THEN 'Nonsmoker'
	ELSE 'Smoker'
END AS Smoker,
COUNT(*) AS total_people, ROUND(AVG(charges), 2) AS average_cost
FROM age_buckets
GROUP BY bucket, smoker
ORDER BY bucket ASC;



-- ========================================================================================
-- Analysis 7: How does smoking status affect insurance charges across different BMI ranges?
-- Insight: Smokers consistently show higher charges across most BMI ranges, though some 
--			variations appear in higher BMI categories due to smaller sample size
--			and potential outliers.
-- ========================================================================================

WITH bmi_buckets AS(
SELECT 
bmi,
smoker,
charges,
FLOOR((floor(bmi) - 15) / 10) AS bucket
FROM insurance
)
SELECT 
CASE
	WHEN bucket <= 0 THEN '15-24'
	WHEN bucket <= 1 THEN '25-34'
	WHEN bucket <= 2 THEN '35-44'
	ELSE '+45'
END AS bmi_label,
CASE
	WHEN smoker = 0 THEN 'Nonsmoker'
	ELSE 'Smoker'
END AS Smoker,
COUNT(*) AS total_people, ROUND(AVG(charges), 2) AS average_cost
FROM bmi_buckets
GROUP BY bucket, smoker
ORDER BY bucket ASC;