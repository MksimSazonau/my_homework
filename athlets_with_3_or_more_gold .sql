

select name, games, sport , count (distinct event) as gold_medals_count
from athletes_summer_games 
where medal = 'Gold'
group by name, games, sport 
having  count (distinct event) >= 3 
order by gold_medals_count desc



select distinct name, games, sport , count (distinct event) as gold_medals_count
from athletes_summer_games 
where medal = 'Gold'
and games = '2016 Summer'
group by name, games, sport 
having  count (distinct event) >= 3 
order by gold_medals_count desc 
