with current_medal as ( select noc,year,
count (case when medal in ('Gold','Silver','Bronze') then  1 end ) as current_medal 
from athletes_summer_games 
group by noc,year
)
select noc, year, current_medal, 
coalesce(
lag(current_medal) over (partition by noc order by year ),0) as prev_olympic_medal,
coalesce ( 
current_medal - lag(current_medal) over (partition by noc order by year),0) as  dif_medal 
from current_medal
where noc = 'USA'

/* в целом все сделал сам и lead() тоже в принципе знаю как применять 
 * но я жестко втыкаю и не понимаю вот эту часть partition by и order by в оконной функции 
 * если сможешь то обьясни простыми словами а то через иишку нихера не могу понять 
 */
