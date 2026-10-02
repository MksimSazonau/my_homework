select sport, round (avg(age),1) as avg_age, count (id) as total_athletes
from athletes_summer_games 
group by sport 
having count(id) > 500
order by avg(age) 
limit 5;


  
select sport, round (avg(age),1) as avg_age, count (id) as total_athletes
from athletes_summer_games 
group by sport 
having count(id) > 500
order by avg(age) desc  
limit 5;