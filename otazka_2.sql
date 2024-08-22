-- otazka č.2
SELECT 
	payroll_year,	
	category_code,
	price_name  ,
	payroll_value,
	price_one_piece,
	ROUND(AVG(payroll_value)/price_one_piece) as amount_items_kg_l
FROM t_martin_furmanek_project_SQL_primary_final hpv
WHERE	category_code IN (114201, 111301)	
		AND (payroll_year = (SELECT MIN(payroll_year) FROM t_martin_furmanek_project_SQL_primary_final)
		OR payroll_year = (SELECT MAX(payroll_year) FROM t_martin_furmanek_project_SQL_primary_final))
		AND industry_branch_code IS NULL
GROUP BY  payroll_year, category_code ;
