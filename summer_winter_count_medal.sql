select case when r.region is null or r.region = ''  then 'Неизвестно' else r.region end as region,
count (case when medals.medal = 'Gold' then 1 end) as gold_count,
count (case when medals.medal = 'Silver' then 1 end) as silver_count,
count (case when medals.medal = 'Bronze' then 1 end) as bronze_count,
count (case when medals.medal <> '' then 1 end ) as total_medals
from (
select noc,medal 
from athletes_summer_games 
union all
select noc, medal 
from olympic_winter_results) as medals
left join olympic_regions as r 
on medals.noc = r.noc 
group by case when r.region is null or r.region = ''  then 'Неизвестно' else r.region end
order by total_medals desc    










