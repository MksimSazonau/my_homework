select sex, medal, count(medal)
from athletes_summer_games 
where medal in ('Gold', 'Silver', 'Bronze')
and sex in ('M','F')
group by sex, medal


