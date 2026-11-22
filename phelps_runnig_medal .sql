with mikael_phelps as (
select name, games,year,  count (distinct case when medal in ('Gold', 'Silver','Bronze') then event end ) as medals_on_game
from athletes_summer_games
where name = 'Michael Fred Phelps, II' 
group by name,games,year 
)
select name, year,games, medals_on_game,
SUM(medals_on_game) OVER (ORDER BY Year ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as runnig_total_medal
from mikael_phelps
group by name, year,games, medals_on_game


