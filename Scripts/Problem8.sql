-- Do the top 20% most AI-mature companies account for 80% of all cost savings globally? --
with maturity_basket as (
select NTILE(5) over(order by  avg(ai_maturity_score) desc) as maturity_basket,company_id ,
round(cast(avg(ai_maturity_score) as decimal),2) as avg_maturity_score
from ai_adop
group by company_id 
),bucket_saving as (
select mb.maturity_basket, round(sum(aa.cost_savings),2) as total_cost_saving
from maturity_basket as mb
join ai_adop as aa
on mb.company_id = aa.company_id 
group by mb.maturity_basket 
order by mb.maturity_basket
),
global_total as (
select sum(cost_savings) as global_saving
from ai_adop
)
select bs.maturity_basket,
bs.total_cost_saving ,
gt.global_saving ,round(bs.total_cost_saving *100 / gt.global_saving,2) as pct_of_global_saving,
case when bs.maturity_basket = 1 and round(bs.total_cost_saving*100 / gt.global_saving,2) >= 80 then 'Parito_holds'
	 when bs.maturity_basket = 1 then 'Parito_does_not_hold'
	 else '-'
end as parito_verdict
from bucket_saving as bs
cross join global_total as gt