\c snapchat

\echo Showing All Stories

begin transaction;

create or replace function show_stories (userInput text) returns table(media text)
language sql as
$$


select media
  from Story
 where storyId in ( select storyid
                      from PersonalUserStory
		             where username in (select username2
                                          from Friendships
							             where username1 = userInput));
 
$$;

SELECT show_stories('dlizhang98');

commit;