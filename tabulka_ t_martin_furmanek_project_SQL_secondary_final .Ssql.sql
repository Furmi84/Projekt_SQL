CREATE OR REPLACE table t_martin_furmanek_project_SQL_secondary_final AS
WITH europe_summary AS (
    SELECT 
    country as region,
	year,
	GDP,
	population as summary_population,
	gini,
	taxes,
	fertility,
	mortaliy_under5 
    FROM economies e
    WHERE country LIKE '%Europe%'
    AND country NOT LIKE '%Asia%'
),
europe_detail AS (
    SELECT *
    FROM countries c
    WHERE region_in_world LIKE '%europe%'
)
SELECT 
 	*
FROM 
    europe_summary, europe_detail;


