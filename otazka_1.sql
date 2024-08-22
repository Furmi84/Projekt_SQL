-- Otazka č.1
-- Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

WITH callcuation_payroll AS (
SELECT	
		industry_branch_code,
		(SELECT name
			FROM czechia_payroll_industry_branch cpib 
			WHERE cpib.code = hpv.industry_branch_code
		) AS industry_branch_text,
		payroll_year,
		AVG(payroll_value) as avg_payroll_value,	
		LAG(AVG(payroll_value)) OVER ( PARTITION BY industry_branch_code ORDER by payroll_year ) AS avg_payroll_value_year_before,
		ROUND(AVG(payroll_value) - LAG(AVG(payroll_value)) OVER ( PARTITION BY industry_branch_code ORDER by payroll_year ),2) AS delta_payroll_per_year
FROM t_martin_furmanek_project_SQL_primary_final hpv
WHERE industry_branch_code IS NOT NULL
GROUP BY industry_branch_code, payroll_year
)
SELECT
	industry_branch_code,
	industry_branch_text,
	payroll_year,
	avg_payroll_value,
	avg_payroll_value_year_before,
	delta_payroll_per_year
FROM callcuation_payroll
GROUP BY industry_branch_code,payroll_year;



