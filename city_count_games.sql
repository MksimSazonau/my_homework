select city, count(distinct games) as count_games 
from athletes_summer_games 
group by city 
order by count(distinct games) desc
limit 10;
