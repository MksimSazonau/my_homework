


select r.region, sum(case when medals.medal in( 'Silver', 'Bronze') then 1 else 0 end) as total_non_gold_medal 
from (select noc,medal
from athletes_summer_games 
union all
select noc, medal
from olympic_winter_results
) as medals
left join olympic_regions as r
on r.noc = medals.noc
group by r.region 
having  sum(case when medals.medal = 'Gold' then 1 else 0 end) = 0 
and sum(case when medals.medal in( 'Silver', 'Bronze') then 1 else 0 end) >0 
order by total_non_gold_medal desc;



select r.region, sum(case when medals.medal in( 'Silver', 'Bronze') then 1 else 0 end) as total_non_gold_medal 
from olympic_regions as r
left join 
(select noc,medal
from athletes_summer_games 
union all
select noc, medal
from olympic_winter_results
) as medals
on r.noc = medals.noc
 where medals.noc in (
 (
    select noc
	from athletes_summer_games
	where medal in ('Silver','Bronze')
	union all
 	 select noc
	from olympic_winter_results
	where medal in ('Silver','Bronze')
)  
except 
(
select  noc
	from athletes_summer_games
	where medal in ('Gold')
	union all
 	 select  noc
	from olympic_winter_results
	where medal in ('Gold')
)
)
group by r.region 
order by total_non_gold_medal desc ;    




