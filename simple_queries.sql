\c snapchat

begin transaction;

\echo Adding a friendship

create or replace function add_friend(user1 text, user2 text) returns void
language plpgsql as
$$
declare
n integer;

begin

select max(friendshipId) from Friendships into n;

insert into Friendships
	 values (user1,user2,n+1);

insert into Friendships
	 values (user2,user1,n+2);
     
return;

end
$$;

SELECT add_friend('asager','ieu');

\echo Counting the views of a story

create or replace function count_views (storyIdInput int) returns bigint
language sql as
$$

select count(username)
  from StoryView
 where storyId = storyIdInput;


$$;

SELECT * FROM count_views(5);

\echo Showing all geotags

create or replace function show_geotags () returns table(geoID int)
language sql as
$$


select geoID
  from Geotag
 
$$;

SELECT * FROM show_geotags();

\echo Showing add_geotag

create or replace function add_geotag (location varchar, geoID int) returns void
language sql as
$$

insert into Geotag
	values(location,geoID)
 
$$;

SELECT add_geotag('59.57.N 10.45.E',18);
SELECT * FROM show_geotags();

\echo Collecting stories by location

create or replace function story_location (locationInput text) returns table(storyId int, location text)
language sql as
$$

select storyId, location
from Story
where location = locationInput;

$$;

SELECT * FROM story_location('58 00 N 56 19 E');

\echo Viewing a snap

create or replace function snap_viewing (snapIdInput int, userview text) returns text
language sql as
$$

 update snapview
 	set opened = true
 	where snapId = snapIdInput and username = userview;
    
select s.media
from snap as s
join snapview as sv on sv.snapId = s.snapId
where s.username = userview and s.snapId = snapIdInput;


$$;

SELECT * FROM snap_viewing(6, 'margretw');

COMMIT;