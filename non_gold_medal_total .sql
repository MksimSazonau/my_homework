select r.region, sum(case when medals.medal in( 'Silver', 'Bronze') then 1 else 0 end) as total_non_gold_medal 
from (select noc,medal
from athletes_summer_games 
union all 
select noc, medal
from olympic_winter_results
) as medals
left join olympic_regions as r
on r.noc = medals.noc
group by r.region 
having  sum(case when medals.medal = 'Gold' then 1 else 0 end) = 0 
and sum(case when medals.medal in( 'Silver', 'Bronze') then 1 else 0 end) >0 
order by total_non_gold_medal desc;

/* короче тут нахуевертил но вроде как результат выдало нужный 
 * да подсматривал в иишку но старался все свм разобрать 
 * в целом каждую строчку понимаю 
 */


select r.region 
from (
select noc
from athletes_summer_games 
where medal in ('Silver', 'Bronze')

union all 

select noc from olympic_winter_results 
where medal in ('Silver', 'Bronze')
) as medals 
left join olympic_regions as r 
on medals.noc = r.noc 
group by r.region 

except

select r.region 
from(
select noc
from athletes_summer_games 
where medal = 'Gold'

union all 

select noc 
from olympic_winter_results 
where medal = 'Gold'
) as gold_medals
left join olympic_regions as r 
on gold_medals.noc = r.noc 
group by r.region


/* здесь хуярил через except но пиздец поплыл вроде золотые страны убрал а как сложить 
 * поплыл и хуй толком разобрался поэтому мне кажеться здесь первый вариант был бы более проще и логичнее 
 */





/* короче если сильно жестко нахуевертил то гвори как есть потому что бля у меня тут затупы жесткие 
 * да я юзал иишку но толь для того что бы понять задачу код она мне не помогала почти писать только подсказки давала 
 */


 