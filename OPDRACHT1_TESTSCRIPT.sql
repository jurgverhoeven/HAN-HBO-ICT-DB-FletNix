--Unieke username
insert into Customer (firstname, lastname, customer_mail_address, payment_method, payment_card_number, contract_type, subscription_start, user_name, password, country_name)
	Values ('Ruben', 'Kokken', 'ikheb1geheimemailadres@gmail.com', 'Mastercard', '11003399338844774596', 'Basic', '2016-09-01', 'Rkokken', 'Bowlen', 'The Netherlands');

--Geboren in de toekomstige tijd
insert into Customer (firstname, lastname, customer_mail_address, payment_method, payment_card_number, contract_type, subscription_start, user_name, password, country_name, birth_date)
	Values ('Ruben', 'Kokken', 'ikheb1geheimemailadres@gmail.com', 'Mastercard', '11003399338844774596', 'Basic', '2016-09-01', 'kokken', 'Bowlen', 'The Netherlands', '2018-11-27');

--Email moet @
insert into Customer (firstname, lastname, customer_mail_address, payment_method, payment_card_number, contract_type, subscription_start, user_name, password, country_name)
	Values ('Ruben', 'Kokken', 'ikhebeengeheimemailadresgmail.com', 'Mastercard', '11003399338844774596', 'Basic', '2016-09-01', 'kkokken', 'Bowlen', 'The Netherlands');

--Subscription start is later dan de subscription end
insert into Customer (firstname, lastname, customer_mail_address, payment_method, payment_card_number, contract_type, subscription_start, subscription_end, user_name, password, country_name)
	Values ('Ruben', 'Kokken', 'ikhe81geheimemailadres@gmail.com', 'Mastercard', '11003399338844774596', 'Basic', '2019-09-01','2019-09-01', 'lolkokken', 'Bowlen', 'The Netherlands');

--Publication year later dan vandaag
insert into Movie(movie_id, title, duration, publication_year, price, URL, previous_part)
	Values (9, 'Johnny English Strikes again', 89, 2020, 6.50,'https://www.youtube.com/watch?v=-Qv6p6pTz5T',null);

--Link moet . bevatten
insert into Movie(movie_id, title, duration, publication_year, price, URL, previous_part)
	Values (9, 'Johnny English Strikes again', 89, 2017, 6.50,'https://www.youtubecom/watch?v=-Qv6p6pTz5T',null);

--Gender moet m of v zijn
INSERT INTO Person(person_id, lastname, firstname, gender)
	VALUES (17, 'Reevess', 'Keano', 'X');
