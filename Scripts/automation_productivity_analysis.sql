--Do companies with higher automation rates actually become more productive — and does this hold true across all industries?--
with industry_tier as (
select industry,
case when automation_rate < 0.33 then 'Low'
	 when automation_rate between  0.33 and 0.66 then 'Mid'
	 else 'High'
end as automation_tier,
cast(avg(productivity_gain) as decimal(10,2)) as avg_productivity_gain
from ai_adop
group by automation_tier, industry
order by industry ,automation_tier
)
select industry,
avg_productivity_gain
from industry_tier 