
with first_gold as(
select s.name as atlethe_name,r.region, s.year ,s.sport ,s.event,
row_number() over (partition by r.region order by year ) as place
from athletes_summer_games as s 
left join olympic_regions as r 
on r.noc = s.noc
where medal = 'Gold' 
group by s.name, r.region, s.year ,s.sport ,s.event)
select  atlethe_name, region, year ,sport ,event from first_gold 
where place = 1 
