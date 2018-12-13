use FletNix
go

--Opdracht A:
--Alle films gesorteerd naar genre [movie title, publication year, genre]
select M.title, M.publication_year, G.genre_name
from Movie M inner join Movie_Genre G on M.movie_id = G.movie_id
order by G.genre_name

--Opdracht B:
--Alle movies die tussen 1990 en 2010 geproduceerd zijn.
select title, publication_year
from Movie
where publication_year > 1989 and publication_year < 2010

--Opdracht C:
--Alle klanten die op dit moment actief zijn (i.e. subscription_end moet leeg zijn) [customer lastname, firstname, subscription_start] 
select lastname, firstname, subscription_start
from Customer
where subscription_end is null

--Opdracht D:
--De cast uit alle Terminator movies uit het jaar 1991 [id, title, firstname, lastname, role] 
select M.movie_id, M.title, P.firstname, P.lastname, MC.role
from Movie M inner join Movie_Cast MC on M.movie_id = MC.movie_id
	inner join Person P on MC.person_id = P.person_id
where M.title like '%terminator%'

--Opdracht E:
--Alle movies waarin de acteur “Arnold Schwarzenegger” een rol speelt [movie title, publication year] 
select M.title, M.publication_year
from Movie M inner join Movie_Cast MC on M.movie_id = MC.movie_id
	inner join Person P on MC.person_id = P.person_id
where P.firstname like 'Arnold' and P.lastname like 'Schwarzenegger'

--Opdracht F:
--Alle gebruikers met openstaande kosten [Customer lastname, firstname, total price] Maak een View voor deze informatiebehoefte. 
DROP VIEW openstaande_kosten;
go

CREATE VIEW openstaande_kosten AS
	select SUM(WH.price) AS total_price, C.lastname, C.firstname
	from Customer C inner join WatchHistory WH on C.customer_mail_address = WH.customer_mail_address
	where WH.invoiced = 0
	group by WH.customer_mail_address, C.lastname, C.firstname;
go

select *
from openstaande_kosten

--Opdracht G:
--Toon 100 movies die tot nu toe het minst bekeken zijn, gesorteerd naar het aantal keren dat ze gekeken werden. Dit houdt ook 0 keer in [movie title, number of times watched]. Maak een View voor deze informatiebehoefte. 
DROP VIEW minst_bekeken_videos;
go

CREATE VIEW minst_bekeken_videos AS
select TOP (100) M.title, SUM(M.movie_id) AS malen_bekeken
from Movie M inner join WatchHistory WH on M.movie_id = WH.movie_id
group by M.title
order by SUM(M.movie_id)
go

select *
from minst_bekeken_videos

--Opdracht H
--Alle movies die in de afgelopen twee maanden het meest bekeken zijn, gesorteerd naar het aantal keren dat ze gekeken werden. Toon alleen movies die minimaal één keer bekeken zijn [movie title, publication_year, number of times watched]. Maak een View voor deze informatiebehoefte. De sortering kun je niet binnen de view doen, laat die buiten de view. 
