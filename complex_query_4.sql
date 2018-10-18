\c snapchat

\echo Finding Best Friends
begin transaction;

create or replace function find_best_friends (userInput text) returns table(friends text)
language sql as
$$

     select sv.username
       from SnapView as sv
            join Friendships as f on sv.username = f.username2
            join Snap as s on s.snapId = sv.snapId
      where f.username1 = userInput and s.username = userInput
   group by sv.username
     having count(sv.snapId) = (select (count(sv.snapId))
   							      from SnapView as sv
   							  		   join Snap as s on s.snapId = sv.snapId
   								 where s.username = userInput
   							  group by sv.username
                              	order by count(sv.snapId) desc
									limit 1);
;
$$;

SELECT find_best_friends('dlizhang98');

commit;