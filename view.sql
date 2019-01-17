CREATE VIEW [Filmlijst]
AS
select M.movie_id, MG.genre_name
from Movie M left outer join Movie_Genre MG 
	on M.movie_id = MG.movie_id