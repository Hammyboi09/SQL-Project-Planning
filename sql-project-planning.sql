set @count:=1;
select min(Start_Date) as d1, max(End_Date) as d2 from
(select Start_Date, End_Date, case when
date_sub(End_Date, interval 1 day) in (select End_Date from Projects) then @count:=@count else @count:=@count+1 end as nn
from Projects
) as tab1
group by nn
order by count(End_Date), d1