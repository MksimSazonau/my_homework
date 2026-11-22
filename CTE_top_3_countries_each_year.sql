


with top_countries as (
select s.year,r.region,
count (case when s.medal = 'Gold' then 1 end) as gold_count,
count (case when s.medal = 'Silver' then 1 end) as silver_count,
dense_rank () over (partition by year order by 
count (case when s.medal = 'Gold' then 1 end) desc,
count (case when s.medal = 'Silver' then 1 end) desc) as rank_in_year 
from study_db_scheme.athletes_summer_games as s
left join olympic_regions as r 
on s.noc = r.noc
group by s.year, r.region
) 
select year, region, gold_count,silver_count,rank_in_year 
from top_countries 
where rank_in_year between 1 and 3 


with count_medals as (
select s.year,r.region,
sum (case when s.medal = 'Gold' then 1 else 0 end) as gold_count,
sum (case when s.medal = 'Silver' then 1 else 0 end) as silver_count
from study_db_scheme.athletes_summer_games as s
left join olympic_regions as r 
on s.noc = r.noc
group by s.year, r.region
),
rank_in_year as (select year,region,gold_count,silver_count,
dense_rank () over (partition by year order by gold_count desc , silver_count desc) as rank_in_year 
from count_medals
)
select year, region,gold_count,silver_count,rank_in_year
from rank_in_year 
where rank_in_year between 1 and 3




