-- otazka č.2
select 
	payroll_year,	
	category_code,
	price_name  ,	
	round(avg(payroll_value)/price_one_piece) as amount_items_kg_l
from t_martin_furmanek_project_SQL_primary_final hpv
where	category_code in (114201, 111301)	
		and (payroll_year = (SELECT MIN(payroll_year) FROM t_martin_furmanek_project_SQL_primary_final)
		or payroll_year = (SELECT MAX(payroll_year) FROM t_martin_furmanek_project_SQL_primary_final))
		and industry_branch_code is null
group by  payroll_year, category_code ;