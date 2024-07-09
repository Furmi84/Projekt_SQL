-- Otazka č.1
-- Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
-- Skript ukazuje, kterym odvetmim behem let mzdy klesaji

with callcuation_payroll as (
select	
		industry_branch_code,
		(select name
			from czechia_payroll_industry_branch cpib 
			where cpib.code = hpv.industry_branch_code
		) as industry_branch_text,
		payroll_year,
		avg(payroll_value) as avg_payroll_value,	
		LAG(avg(payroll_value)) OVER ( PARTITION BY industry_branch_code ORDER by payroll_year ) as avg_payroll_value_year_before,
		round(avg(payroll_value) - LAG(avg(payroll_value)) OVER ( PARTITION BY industry_branch_code ORDER by payroll_year ),2) AS delta_payroll_per_year
from t_martin_furmanek_project_SQL_primary_final hpv
where industry_branch_code is not null
group by  industry_branch_code, payroll_year
)
select 
	industry_branch_code,
	industry_branch_text,
	payroll_year,
	avg_payroll_value,
	avg_payroll_value_year_before,
	delta_payroll_per_year
from callcuation_payroll
	where delta_payroll_per_year < 0
group by industry_branch_code,payroll_year;