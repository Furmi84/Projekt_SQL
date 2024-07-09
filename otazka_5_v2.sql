-- otazka č.5
-- Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
-- script zavislost ceny potravin a HDP

SELECT
    gdp_per_year.year,
    -- gdp_per_year.GDP,
    -- gdp_per_year.lag_gdp,
    gdp_per_year.delta_gdp_per_year_raw,
    FORMAT(gdp_per_year.delta_gdp_per_year_raw / 1000000000, 2) as delta_gdp_per_year_in_miliards,
    calculation_price_food.category_code,
    calculation_price_food.price_name,
    -- calculation_price_food.price_name,
    -- calculation_price_food.price_one_piece,
    -- calculation_price_food.value_year_before,
    ROUND(calculation_price_food.price_one_piece - calculation_price_food .value_year_before, 2) AS delta_payroll_value_per_year
	FROM 
    (SELECT 
        year,
        GDP,
        LAG(GDP) OVER (ORDER BY year) AS lag_gdp,
        ROUND(GDP - LAG(GDP) OVER (ORDER BY year), 2) AS delta_gdp_per_year_raw
    FROM 
        economies e
        WHERE country = 'czech republic' 
        AND year BETWEEN (SELECT MIN(payroll_year) FROM t_martin_furmanek_project_SQL_primary_final) AND (SELECT MAX(payroll_year) FROM t_martin_furmanek_project_SQL_primary_final)
    ) AS gdp_per_year
JOIN 
    t_martin_furmanek_project_SQL_primary_final ON gdp_per_year.year = t_martin_furmanek_project_SQL_primary_final.payroll_year
JOIN 
    (SELECT 
        payroll_year,
        category_code,
        price_name,
        price_one_piece,
        LAG(price_one_piece) OVER (partition by category_code ORDER BY payroll_year) AS value_year_before
    FROM 
        t_martin_furmanek_project_SQL_primary_final hpv
    	group by category_code,payroll_year 
    ) AS calculation_price_food
    ON t_martin_furmanek_project_SQL_primary_final.payroll_year = calculation_price_food .payroll_year
  group by calculation_price_food.category_code,gdp_per_year.year;
