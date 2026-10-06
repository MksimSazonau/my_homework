select r.region ,
min(s.year) as first_year, max (s.year) as last_year, 
max (s.year) - min(s.year) as years_active, count(distinct name ) as total_unique_athletes
from olympic_regions as r 
left join athletes_summer_games as s 
on r.noc = s.noc 
group by  r.region
order by years_active desc;


-- запрос написал сам только чутка подглядел арифметику колонок но я сам помню что можно с ними делать математику на прямую 