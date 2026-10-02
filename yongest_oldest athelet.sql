select distinct  name, sex, age, sport, medal, year 
from athletes_summer_games 
where medal is not null 
and trim(medal) <>' '
order by age;

select distinct  name, sex, age, sport, medal, year 
from athletes_summer_games 
where medal is not null 
and trim(medal) <>' '
and age is not null
order by age desc;



