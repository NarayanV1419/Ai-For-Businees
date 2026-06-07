-- Which industry scaled up the number of AI deployments most rapidly between 2020 and 2030? --
with year_avg as (
select industry,year, round(avg(deployment_count),2) as avg_deployment
from ai_adop
where year between 2020 and 2030
group by year, industry
), yoy as (
select industry ,year,
avg_deployment ,
LAG(avg_deployment) over(partition by industry order by year) as prev_year_deployment,
round(avg_deployment  - LAG(avg_deployment) over(partition by industry order by year) ,2) as yoy_growth
from year_avg 
order by industry ,year
)
select dense_rank() over(order by avg(yoy_growth)) as growth_rank, industry, round(avg(yoy_growth),2) as avg_yoy_growth
from yoy
where yoy_growth is not null
group by industry 
order by growth_rank 