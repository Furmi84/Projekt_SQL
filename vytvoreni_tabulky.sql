/*Vytvoření tabulky*/

create or replace table t_martin_furmanek_project_SQL_primary_final(
	WITH payroll_data AS (
    SELECT	
        cp.industry_branch_code,
        cp.payroll_year AS payroll_year,        
        cp.value AS payroll_value        
    FROM czechia_payroll cp
    WHERE cp.value_type_code = 5958         
         and cp.calculation_code = 100
    GROUP BY cp.industry_branch_code, cp.payroll_year, cp.value
	),
	price_data AS (
    	SELECT
        	cp.category_code,
        	cp.value as price_one_piece,
        	YEAR(cp.date_to) AS period_year,
        	cpc.name AS price_name     
    	FROM czechia_price cp
    	left JOIN czechia_price_category cpc 
        	ON cp.category_code = cpc.code 
    	GROUP BY cp.category_code, period_year, cpc.name
	)
	SELECT
    	payroll_data.industry_branch_code,
    	payroll_data.payroll_year,
    	payroll_data.payroll_value,
    	price_data.category_code,
    	price_data.price_name,
    	price_data.price_one_piece    
	FROM payroll_data
	JOIN price_data
		ON payroll_data.payroll_year = price_data.period_year	
);