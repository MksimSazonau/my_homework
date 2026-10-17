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


/* короче тут какая то хуйня с базой и он для фелпса каждое соревнование записано по три одинаковых строчки то есть просто count 
умножал весь резльтат за год на 3 поэто счиатл count по event */