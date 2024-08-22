-- otazka č.4
-- Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

 WITH calculated_change_salary AS (
 	SELECT	
		industry_branch_code,
		payroll_year as payroll_salary,		
		payroll_value as avg_month_salary,
		LAG(payroll_value) OVER (PARTITION BY category_code ORDER BY payroll_year) AS prev_avg_month_salary	
	FROM t_martin_furmanek_project_SQL_primary_final hpv
	WHERE industry_branch_code IS NULL
	GROUP BY payroll_year
),
calculated_changes_food AS (
    SELECT
        category_code,
        payroll_year,
        price_name,
        price_one_piece as food_price,
        LAG(price_one_piece) OVER (PARTITION BY category_code ORDER BY payroll_year) AS prev_avg_price_data
    FROM t_martin_furmanek_project_SQL_primary_final
),
price_salary_percentage AS (
SELECT
		payroll_year,
		category_code,
        price_name,
        food_price,
		ROUND(((avg_month_salary - prev_avg_month_salary) / prev_avg_month_salary) * 100, 2) AS percentage_change_salary,
		ROUND(((food_price - prev_avg_price_data) / prev_avg_price_data) * 100, 2) AS percentage_change_food_price        
FROM calculated_changes_food ccf
JOIN calculated_change_salary AS ccs ON ccf.payroll_year = ccs.payroll_salary
WHERE ccf.prev_avg_price_data IS NOT NULL AND ccs.prev_avg_month_salary IS NOT NULL
)
SELECT 	
	payroll_year,
	category_code,
    	price_name,
    	food_price,
	percentage_change_food_price,
	percentage_change_salary,
	percentage_change_food_price - percentage_change_salary
FROM price_salary_percentage
WHERE percentage_change_food_price - percentage_change_salary > 10
GROUP BY payroll_year;
