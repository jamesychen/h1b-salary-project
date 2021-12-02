-- overview 

select * from h1b_salary.salaries


-- h1b approve rate in a single year

  select ROUND(100.00 * 
        (select count(*) 
         from h1b_salary.salaries
         where case_status = 'CERTIFIED' and extract(year from start_date) = '2020')
         / count(*), 2) as approved_rate
from h1b_salary.salaries
where extract(year from start_date) = '2020'

-- (improved) h1b approve rate in a single year

select 
        ROUND(100.00 * 
        sum(case when case_status = 'CERTIFIED' and extract(year from start_date) = '2020' then 1 else 0 end)
       /sum(case when extract(year from start_date) = '2020' then 1 else 0 end)
        ,2) as approved_rate
from h1b_salary.salaries             
