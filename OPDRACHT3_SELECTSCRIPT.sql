--Gemaakt door Juriaan Pijls & Jurg Verhoeven
--HAN HBO-ICT

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
select distinct M.title, M.publication_year
from Movie M inner join Movie_Cast MC on M.movie_id = MC.movie_id
	inner join Person P on MC.person_id = P.person_id
where P.firstname = 'Arnold' and P.lastname = 'Schwarzenegger'

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
DROP VIEW top_100_minst_bekeken_films
go

CREATE VIEW top_100_minst_bekeken_films AS
	select top(100) M.title, COUNT(WH.movie_id) AS [number of times watched]
	from Movie M left outer join WatchHistory WH on M.movie_id = WH.movie_id
	group by WH.movie_id, M.title
	order by [number of times watched]asc
go

select *
from top_100_minst_bekeken_films

--Opdracht H
--Alle movies die in de afgelopen twee maanden het meest bekeken zijn, gesorteerd naar het aantal keren dat ze gekeken werden. Toon alleen movies die minimaal één keer bekeken zijn [movie title, publication_year, number of times watched]. Maak een View voor deze informatiebehoefte. De sortering kun je niet binnen de view doen, laat die buiten de view. 
DROP VIEW minst_bekeken_in_2_maanden
GO

CREATE VIEW minst_bekeken_in_2_maanden AS
	select M.title, M.publication_year, COUNT(WH.movie_id) AS [number of times watched]
	from Movie M left outer join WatchHistory WH on M.movie_id = WH.movie_id
	where WH.watch_date > DATEADD(month, -2, GETDATE())
	group by WH.movie_id, M.title, M.publication_year
go

select *
from minst_bekeken_in_2_maanden
order by [number of times watched]

--Opdracht I
--Alle movies die meer dan 8 genres hebben [title, publication_year]
select title, publication_year
from Movie
where movie_id in (	select movie_id
						from Movie_Genre
						group by movie_id
						having COUNT(genre_name) > 8)

--Opdracht J
--Alle vrouwen die in Horror movies en Family movies gespeeld hebben [firstname,lastname]. 
select distinct P.firstname, P.lastname
from Movie_Cast MC left outer join Person P on  MC.person_id = P.person_id
where P.gender = 'F'
and MC.movie_id in (select movie_id
										from Movie_Genre
										where genre_name = 'Horror'
											and movie_id in (	select movie_id
																from Movie_Genre
																where genre_name = 'Family'))
			
--Opdracht K
--De director die tot nu toe de meeste films geproduceerd heeft [firstname, lastname]. 
select P.firstname, P.lastname, COUNT(MC.movie_id) as aantal
from Movie_Directors MC left outer join Person P on MC.person_id = P.person_id
group by MC.person_id, firstname, lastname
order by aantal desc

--Opdracht L
--Alle Genres en het percentage dat de films uit het bepaalde genre uitmaken t.o.v. het totale aantal films [genre, percentage], gesorteerd op meest populaire genre. Maak een View voor deze informatiebehoefte. Je mag ook eerst één of meerdere (hulp-)views maken om de informatiebehoefte op te lossen. 
DROP VIEW Percentage_Films
go

CREATE VIEW Percentage_Films AS
	select genre_name,
			count(genre_name) AS Aantal,
			count(genre_name) * 100 / (select count(*) from Movie_Genre) as movie_percent
	from Movie_Genre 
	group by genre_name
go

select *
from Percentage_Films
order by movie_percent desc


--Opdracht M
--Gebruikers [mail_adress] en het gemiddelde aantal films die elke gebruiker per dag kijkt. Toon alleen gebruikers die gemiddeld 2 of meer films per dag kijken, met het grootste gemiddelde bovenaan. Maak een View voor deze informatiebehoefte. Je mag ook eerst één of meerdere (hulp-)views maken om de informatiebehoefte op te lossen. 
DROP VIEW Gemiddelde_film_tijd
go


create function dbo.bepaal_datum(@eindDatum date, @datumNu date)
returns date
AS
BEGIN
	IF (@eindDatum is null)
		return @datumNu
	ELSE IF (@eindDatum<@datumNu)
		return @eindDatum
	
		return @datumNu
	
END

CREATE view Gemiddelde_film_tijd AS
	select WH.customer_mail_address, (COUNT(movie_id)/DATEDIFF(DAY, subscription_start, dbo.bepaal_datum(subscription_end, GETDATE()))) as [gemiddelde aantal films]
	from WatchHistory WH inner join Customer C on WH.customer_mail_address = C.customer_mail_address
	group by WH.customer_mail_address, subscription_start
	having (COUNT(movie_id)/DATEDIFF(DAY, subscription_start, dbo.bepaal_datum(subscription_end, GETDATE()))) > 1
go

select *
from Gemiddelde_film_tijd
order by [gemiddelde aantal films] desc