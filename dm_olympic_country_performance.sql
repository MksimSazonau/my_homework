create table dm_olympic_country_performance as 
with games_data as ( select name,noc,year,season,sport,event,medal from athletes_summer_games 
union  all
select name,noc,year,season,sport,event,medal  from olympic_winter_results 
),
game_stats as  ( select r.region as region_name, g.year, g.season,
count (distinct g.name ) as total_athletes,
count (case when g.medal = 'Gold' then 1 end ) as gold_count,
count (case when g.medal = 'Silver' then 1 end ) as silver_count,
count (case when g.medal = 'Bronze' then 1 end ) as bronze_count,
count (case when g.medal in ('Gold','Silver','Bronze') then 1 end ) as total_medals
from games_data as g  left join olympic_regions as r 
using (noc)
group by  r.region, g.year, g.season
 ),
 ranked_stats as ( select *,
 coalesce (lag(total_medals) over (partition by region_name ,season order by year),0) as prev_season_medals,
 dense_rank () over (partition by year, season order by  total_medals desc) as country_rank_in_games
 from game_stats 
 )
 select region_name, year,season,total_athletes,gold_count,silver_count, bronze_count ,
 total_medals,prev_season_medals,country_rank_in_games from dm_olympic_country_performance
 
 
 
 
 
 
