\c snapchat

\echo Showing most popular geotag
begin transaction;

create or replace function show_popgeotag () returns table(geoID int)
language sql as
$$

SELECT geoID
  FROM PhotoFilter
 WHERE filterID in ( 	SELECT t.filterID
                      	  FROM (SELECT s.filterID, count(s.filterID)
							    FROM Story AS s
						        GROUP BY s.filterID) as t
                      GROUP BY t.filterID
                      ORDER BY count(t.filterID) DESC
                         LIMIT 1

		             )
;


 
$$;
SELECT * FROM show_popgeotag()

commit;