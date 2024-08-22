-- otazka č.5
-- Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
-- script zavislost platu a HDP

SELECT
    gdp_per_year.year,
    -- gdp_per_year.GDP,
    -- gdp_per_year.lag_gdp,
    -- gdp_per_year.delta_gdp_per_year_raw,
    FORMAT(gdp_per_year.delta_gdp_per_year_raw / 1000000000, 2) AS delta_gdp_per_year_in_miliards,
    -- t_martin_furmanek_project_SQL_primary_final.payroll_year,
    -- t_martin_furmanek_project_SQL_primary_final.payroll_value,
    -- calculation.value_year_before,
    ROUND(t_martin_furmanek_project_SQL_primary_final.payroll_value - calculation_payroll .value_year_before, 2) AS delta_payroll_value_per_year
FROM 
    (SELECT 
        year,
        GDP,
        LAG(GDP) OVER (ORDER BY year) AS lag_gdp,
        ROUND(GDP - LAG(GDP) OVER (ORDER BY year), 2) AS delta_gdp_per_year_raw
    FROM 
        economies e
    WHERE 
        country = 'czech republic' 
        AND year BETWEEN (SELECT MIN(payroll_year) FROM t_martin_furmanek_project_SQL_primary_final) AND (SELECT MAX(payroll_year) FROM t_martin_furmanek_project_SQL_primary_final)
    ) AS gdp_per_year
JOIN 
    t_martin_furmanek_project_SQL_primary_final ON gdp_per_year.year = t_martin_furmanek_project_SQL_primary_final.payroll_year
JOIN 
    (SELECT 
        payroll_year,
        payroll_value,
        LAG(payroll_value) OVER (ORDER BY payroll_year) AS value_year_before
    FROM 
        t_martin_furmanek_project_SQL_primary_final hpv
    WHERE 
        industry_branch_code IS null
    group by payroll_year 
    ) AS calculation_payroll 
    ON t_martin_furmanek_project_SQL_primary_final.payroll_year = calculation_payroll .payroll_year
GROUP BY gdp_per_year.year;
