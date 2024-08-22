-- otazka č.3 verze 2
-- Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

WITH calculated_changes AS (
    SELECT
        category_code,
        payroll_year,
        price_name,
        price_one_piece,
        LAG(price_one_piece) OVER (PARTITION BY category_code ORDER BY payroll_year) AS prev_avg_price_data
    FROM t_martin_furmanek_project_SQL_primary_final    
),
percentage_changes AS (
    SELECT
        category_code,
        payroll_year,
       	price_name,
        price_one_piece,
        prev_avg_price_data,
        price_one_piece - prev_avg_price_data as price_one_piece_minus_prev_avg_price_data,
        ROUND(((price_one_piece - prev_avg_price_data) / prev_avg_price_data) * 100, 2) AS percentage_change_per_year
    FROM calculated_changes
)
SELECT 
	category_code,
	payroll_year,    
    price_name,    
    price_one_piece,
    prev_avg_price_data,
    price_one_piece_minus_prev_avg_price_data,
    percentage_change_per_year,
    ROUND(AVG(percentage_change_per_year), 2) AS avg_percentage_change_per_year
FROM percentage_changes
WHERE prev_avg_price_data IS NOT NULL
GROUP BY category_code,payroll_year
ORDER BY percentage_change_per_year;
