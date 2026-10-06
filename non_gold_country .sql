
/* сука во я тупой лишней работы сделал только сейчас понял что там только одну таблицу надо было воткнуть а не лето и зиму но похуй
так даже интереснее было  */


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


select r.region, sum(case when medals.medal in( 'Silver', 'Bronze') then 1 else 0 end) as total_non_gold_medal 
from olympic_regions as r
left join 
(select noc,medal
from athletes_summer_games 
union all
select noc, medal
from olympic_winter_results
) as medals
on r.noc = medals.noc
 where medals.noc in (
 (
    select noc
	from athletes_summer_games
	where medal in ('Silver','Bronze')
	union all
 	 select noc
	from olympic_winter_results
	where medal in ('Silver','Bronze')
)  
except 
(
select  noc
	from athletes_summer_games
	where medal in ('Gold')
	union all
 	 select  noc
	from olympic_winter_results
	where medal in ('Gold')
)
)
group by r.region 
order by total_non_gold_medal desc ;    

/* короче тут добился чего вроде надо через except но как будто первый запрос проще и он выдает такойже результат
 * да иишкой пользовался но для подсказок код писать старадся сам 
 * есть пару моментов коотрфе не понятно 
 * но как то сложно обьяснить почему не понятно там с этими noc 
 */

