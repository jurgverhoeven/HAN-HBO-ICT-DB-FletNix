use FletNix
go


--Fi.: Alle records voor de movies “Matrix” en “Matrix Reloaded”. Gebruik de YouTube link naar de trailer van de films als URL. Tabellen: Genre, Movie, Person, Movie_Cast (3 acteurs), Movie_Genre. 

INSERT INTO Genre (Genre.genre_name, Genre.description)
	VALUES ('Actie', 'Creative works characterized by emphasis on exciting action sequences '),
			('Drama', 'Fictional division between comedy and tragedy'),
			('Family', 'Movies suitable for a wide range of age groups'),
			('Sci-Fi', 'Fictional movies  dealing with imaginative content such as futuristic settings, futuristic science and technology, space travel, time travel, parallel universes, and extraterrestrial life');

go

INSERT INTO Movie (movie_id, title, duration, publication_year, price, URL, previous_part)
	VALUES (1, 'Matrix, The', 136, 1999, 2.50, 'https://www.youtube.com/watch?v=vKQi3bBA1y8', null),
			(2, 'Matrix Reloaded, The', 138, 2003, 2.50, 'https://www.youtube.com/watch?v=zmYE3tg26Qc', 1);

go

INSERT INTO Movie_Genre (Movie_Genre.movie_id, Movie_Genre.genre_name)
	VALUES (1, 'Sci-Fi'),
			(1, 'Actie'),
			(2, 'Sci-Fi'),
			(2, 'Actie');

go

INSERT INTO Person (person_id, lastname, firstname, gender)
	VALUES (1, 'Reeves', 'Keanu', 'M'),
			(2, 'Fishburne', 'Laurence', 'M'),
			(3, 'Moss', 'Carrie-Anne', 'V');

go

INSERT INTO Movie_Cast (movie_id, person_id, role)
	VALUES (1, 1, 'Neo'),
			(1, 2, 'Morpheus'),
			(1, 3, 'Trinity'),
			(2, 1, 'Neo'),
			(2, 2, 'Morpheus'),
			(2, 3, 'Trinity');

go

--Fii.: Minimaal 5 andere movies (waarvan minimaal 2  met cast en directors). Zorg ervoor dat alle movies verschillende prijzen hebben. Tabellen: Genre, Movie, Person, Movie_Cast, Movie_Directors, Movie_Genre 
INSERT INTO Genre (Genre.genre_name, Genre.description)
	VALUES ('Avontuur', 'Moet een groot aantal opeenvolgende en onderling gerelateerde scènes bevatten van personages die deelnemen.'),
			('Thriller', 'Moet bevatten veel sensationele scènes of een verhaal dat sensationeel of spannend is.'),
			('Komedie', 'Vrijwel alle scènes moeten personages bevatten die deelnemen aan humoristische of komische ervaringen.'),
			('Fantasie', 'Moet een groot aantal opeenvolgende scènes van afgebeelde personages bevatten om een ​​magisch en / of mystiek verhaal over de hele titel te bewerkstelligen.'),
			('Misdrijf', '	Whether the protagonists or antagonists are criminals this should contain numerous consecutive and inter-related scenes of characters participating, aiding, abetting, and/or planning criminal behavior or experiences usually for an illicit goal');

go

INSERT INTO Movie (movie_id, title, duration, publication_year, price, URL, previous_part)
	VALUES (3, 'Skyfall', 143, 2012,3.50, 'https://www.youtube.com/watch?v=6kw1UVovByw',null),
			(4, 'Need for speed', 132, 2014, 3.50, 'https://www.youtube.com/watch?v=u3wtVI-aJuw',null),
			(5, 'Johnny English Strikes again', 89, 2018, 6.50,'https://www.youtube.com/watch?v=-Qv6p6pTz5I',null),
			(6, 'Fast & Furious 8', 136, 2017, 5.50, 'https://www.youtube.com/watch?v=uisBaTkQAEs',null),
			(7, 'Battleship', 131, 2012, 3.50, 'https://www.youtube.com/watch?v=cp3646Zf8rg',null),
			(8, 'Pirates Of The Caribbean Dead Men Tell No Tales', 129, 2017, 5.50, 'https://www.youtube.com/watch?v=-6StS7p5TdQ',null);

go

INSERT INTO Movie_Genre (Movie_Genre.movie_id, Movie_Genre.genre_name)
	VALUES (3, 'Actie'),
			(3, 'Avontuur'),
			(3, 'Thriller'),
			(4, 'Actie'),
			(4, 'Misdrijf'),
			(4, 'Thriller'),
			(5, 'Actie'),
			(5, 'Avontuur'),
			(5, 'Komedie'),
			(6, 'Actie'),
			(6, 'Misdrijf'),
			(6, 'Thriller'),
			(7, 'Actie'),
			(7, 'Avontuur'),
			(7, 'Sci-Fi'),
			(8, 'Actie'),
			(8, 'Avontuur'),
			(8, 'Fantasie');

go

INSERT INTO Person (person_id, lastname, firstname, gender)
	VALUES (4, 'Depp', 'Johnny', 'M'),
			(5, 'Bardem', 'Javier', 'M'),
			(6, 'Rush', 'Geoffrey', 'M'),
			(7, 'Thwaites','Brenton', 'M'),
			(8, 'Scodelario', 'Kaya', 'V'),
			(9, 'McNally', 'Kevin','M'),
			(10, 'Bruckheimer', 'Jerry', 'M'),
			(11, 'Craig', 'Daniel', 'M'),
			(12, 'Dench', 'Judi', 'V'),
			(13, 'Fiennes', 'Ralph', 'M'),
			(14, 'Harris', 'Naomie', 'V'),
			(15, 'Marlohe', 'Bérénice', 'V'),
			(16, 'Broccoli', 'Barbara', 'V');

go

INSERT INTO Movie_Cast (movie_id, person_id, role)
	VALUES (8, 4, 'Captain Jack Sparrow'),
			(8, 5, 'Captain Salazar'),
			(8, 6, 'Captain Hector Barbossa'),
			(8, 7, 'Henry Turner'),
			(8, 8, 'Carina Smyth'),
			(8, 9, 'Gibbs'),
			(3, 11, 'James Bond'),
			(3, 12, 'M'),
			(3, 5, 'Silva'),
			(3, 13, 'Gareth Mallory'),
			(3, 14, 'Eve'),
			(3, 15, 'Severine');

go

INSERT INTO Movie_Directors (movie_id, person_id)
	VALUES (8, 10),
		   (3, 16);

go









INSERT INTO Country (country_name)
	VALUES ('The Netherlands'),
			('Belgium');

go

INSERT INTO Payment (payment_method)
	VALUES ('Mastercard'),
			('Visa'),
			('Amex');

go

INSERT INTO Contract (contract_type, price_per_month, discount_percentage)
	VALUES ('Basic', 4, 0),
			('Premium', 5, 20),
			('Pro', 6, 40);

go

INSERT INTO Customer (firstname, lastname, customer_mail_address, payment_method, payment_card_number, contract_type, subscription_start, user_name, password, country_name)
	VALUES ('Jurg', 'Verhoeven', 'jurgmill@gmail.com', 'Mastercard', '11002299338844775566', 'Pro', '2012-01-01', 'jurgmill', 'wachtwoord1', 'The Netherlands'),
			('Juriaan', 'Pijls', 'jpijls22@gmail.com', 'Amex', '55664477338822991100', 'Pro', '2012-01-01', 'jpijls22', 'wachtwoord2', 'The Netherlands'),
			('Jan', 'Janssen', 'janjanssen@hotmail.com', 'Visa', '886677554433221100', 'Basic', '2018-11-21', 'jjans', 'wachtwoord3', 'Belgium'),
			('Henk', 'Klaassen', 'h.klaassen@live.nl', 'Amex', '77665544332211889900', 'Basic', '2018-10-21', 'hklaassen123', 'wachtwoord4', 'The Netherlands'),
			('Klaas', 'Saalk', 'klaassaalk@gmail.com', 'Visa', '88220011899337755110', 'Premium', '2018-09-21', 'saalkklaas', 'wachtwoord5', 'Belgium'),
			('Frenk', 'Okopter', 'Frenkindelucht@gmail.com', 'Visa', '88667755443322153', 'Premium', '2018-12-03', 'Frenkocopter','jijweetniet', 'The Netherlands'),
			('Rolando', 'Snelheidsduivel', 'ikracevoorbij@hotmail.com', 'Amex', '77665544332211884512', 'Basic', '2018-04-07', 'Vroem', 'Ikbenvoorbijgegaan', 'Belgium'),
			('Jaap', 'Vaak', 'jaapje123@gmail.com', 'Mastercard', '88220011899337756124', 'Premium', '2012-06-11', 'Jaapje', 'wachtwoord6', 'The Netherlands'),
			('Rickert', 'Hieew', 'hieewtjes.R@live.nl', 'Visa', '88220011899337755132', 'Premium', '2012-09-21','HieeweR', 'wachtwoord7', 'Belgium'),
			('Ruben', 'Kokken', 'ikhebeengeheimemailadres@gmail.com', 'Mastercard', '11003399338844774596', 'Basic', '2016-09-01', 'Rkokken', 'Bowlen', 'The Netherlands'); 

go

INSERT INTO WatchHistory (movie_id, customer_mail_address, watch_date, price, invoiced)
	VALUES (1, 'jurgmill@gmail.com', '2018-11-14', 2.50, 1),
			(2,'jurgmill@gmail.com', '2018-11-14', 2.50, 1),
			(6, 'jurgmill@gmail.com', '2018-11-16', 5.50, 1),
			(7, 'jurgmill@gmail.com', '2018-11-17', 3.50, 0),
			(1, 'jpijls22@gmail.com', '2018-11-15', 2.50, 1),
			(3, 'jpijls22@gmail.com', '2018-11-15', 3.50, 1),
			(4, 'jpijls22@gmail.com', '2018-11-16', 3.50, 1),
			(5, 'jpijls22@gmail.com', '2018-11-16', 6.50, 1),
			(6, 'jpijls22@gmail.com', '2018-11-17', 5.50, 0),
			(7, 'jpijls22@gmail.com', '2018-11-17', 3.50, 0),
			(8, 'jpijls22@gmail.com', '2018-11-18', 5.50, 0),
			(1, 'janjanssen@hotmail.com', '2018-11-18', 2.50, 0),
			(2, 'janjanssen@hotmail.com', '2018-11-19', 2.50, 0),
			(1, 'h.klaassen@live.nl', '2018-11-14', 2.50, 1),
			(6, 'h.klaassen@live.nl', '2018-11-14', 5.50, 1),
			(7,  'h.klaassen@live.nl', '2018-11-15', 3.50, 1),
			(1, 'klaassaalk@gmail.com', '2018-11-19', 2.50, 0),
			(5, 'klaassaalk@gmail.com', '2018-11-20', 6.50, 0),
			(8, 'klaassaalk@gmail.com', '2018-11-20', 5.50, 0),
			(1, 'Frenkindelucht@gmail.com', '2018-11-13', 2.50, 1),
			(2, 'Frenkindelucht@gmail.com', '2018-11-13', 2.50, 1),
			(4, 'Frenkindelucht@gmail.com', '2018-11-14', 3.50, 1),
			(5, 'Frenkindelucht@gmail.com', '2018-11-14', 6.50, 1),
			(1, 'ikracevoorbij@hotmail.com', '2018-11-19', 2.50, 0),
			(3, 'ikracevoorbij@hotmail.com', '2018-11-19', 3.50, 0),
			(1, 'jaapje123@gmail.com', '2018-11-14', 2.50, 1),
			(1, 'hieewtjes.R@live.nl', '2018-11-20', 2.50, 0),
			(5, 'hieewtjes.R@live.nl', '2018-11-20', 6.50, 0),
			(6, 'hieewtjes.R@live.nl', '2018-11-20', 5.50, 0),
			(1, 'ikhebeengeheimemailadres@gmail.com', '2018-11-20', 2.50, 0),
			(7, 'ikhebeengeheimemailadres@gmail.com', '2018-11-20', 3.50, 0);

go

--10 Customers met watchhistories. De customers hebben alle ‘The Matrix’ in de afgelopen week gezien. 
--Verder heeft elke customer nog 3 andere movies in de laatste twee weken gezien. 
--Tabellen: Customer, Watchhistory