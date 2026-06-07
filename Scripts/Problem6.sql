-- Q7. Do companies that invest more hours in AI training for employees reach higher AI adoption levels? --
with training_tier as (select industry,employee_ai_training_hours,round(cast(ai_adoption_level as decimal),2) as ai_adoption_level,
case when employee_ai_training_hours < 50 then 'Low'
	 when employee_ai_training_hours between 50 and 100 then 'Mid'
	 else 'High'
end as training_tier
from ai_adop),
tier_defin as (
select industry,training_tier,round(avg(ai_adoption_level),2) as industry_avg_adoption_level
from training_tier 
group by training_tier, industry
order by training_tier, industry
)
select *
from tier_defin 