--Gemaakt door Juriaan Pijls & Jurg Verhoeven
--HAN HBO-ICT

use FletNix
go

delete WatchHistory
delete Movie_Cast
delete Customer
delete Movie_Genre
delete Genre
delete Movie_Directors
delete Person
delete Contract
delete Country
delete Movie
delete Payment


INSERT INTO Payment (payment_method)
	VALUES ('Mastercard'),
			('Visa'),
			('Amex')
go

INSERT INTO Contract (contract_type, price_per_month, discount_percentage)
	VALUES ('Basic', 4, 0),
			('Premium', 5, 20),
			('Pro', 6, 40)
go			

insert into fletnix.dbo.country(country_name)
VALUES('Andorra'),
('United Arab Emirates'),
('Afghanistan'),
('Antigua and Barbuda'),
('Anguilla'),
('Albania'),
('Armenia'),
('Angola'),
('Antarctica'),
('Argentina'),
('American Samoa'),
('Austria'),
('Australia'),
('Aruba'),
('�land'),
('Azerbaijan'),
('Bosnia and Herzegovina'),
('Barbados'),
('Bangladesh'),
('Belgium'),
('Burkina Faso'),
('Bulgaria'),
('Bahrain'),
('Burundi'),
('Benin'),
('Saint Barth�lemy'),
('Bermuda'),
('Brunei'),
('Bolivia'),
('Bonaire'),
('Brazil'),
('Bahamas'),
('Bhutan'),
('Bouvet Island'),
('Botswana'),
('Belarus'),
('Belize'),
('Canada'),
('Cocos [Keeling] Islands'),
('Democratic Republic of the Congo'),
('Central African Republic'),
('Republic of the Congo'),
('Switzerland'),
('Ivory Coast'),
('Cook Islands'),
('Chile'),
('Cameroon'),
('China'),
('Colombia'),
('Costa Rica'),
('Cuba'),
('Cape Verde'),
('Curacao'),
('Christmas Island'),
('Cyprus'),
('Czechia'),
('Germany'),
('Djibouti'),
('Denmark'),
('Dominica'),
('Dominican Republic'),
('Algeria'),
('Ecuador'),
('Estonia'),
('Egypt'),
('Western Sahara'),
('Eritrea'),
('Spain'),
('Ethiopia'),
('Finland'),
('Fiji'),
('Falkland Islands'),
('Micronesia'),
('Faroe Islands'),
('France'),
('Gabon'),
('United Kingdom'),
('Grenada'),
('Georgia'),
('French Guiana'),
('Guernsey'),
('Ghana'),
('Gibraltar'),
('Greenland'),
('Gambia'),
('Guinea'),
('Guadeloupe'),
('Equatorial Guinea'),
('Greece'),
('South Georgia and the South Sandwich Islands'),
('Guatemala'),
('Guam'),
('Guinea-Bissau'),
('Guyana'),
('Hong Kong'),
('Heard Island and McDonald Islands'),
('Honduras'),
('Croatia'),
('Haiti'),
('Hungary'),
('Indonesia'),
('Ireland'),
('Israel'),
('Isle of Man'),
('India'),
('British Indian Ocean Territory'),
('Iraq'),
('Iran'),
('Iceland'),
('Italy'),
('Jersey'),
('Jamaica'),
('Jordan'),
('Japan'),
('Kenya'),
('Kyrgyzstan'),
('Cambodia'),
('Kiribati'),
('Comoros'),
('Saint Kitts and Nevis'),
('North Korea'),
('South Korea'),
('Kuwait'),
('Cayman Islands'),
('Kazakhstan'),
('Laos'),
('Lebanon'),
('Saint Lucia'),
('Liechtenstein'),
('Sri Lanka'),
('Liberia'),
('Lesotho'),
('Lithuania'),
('Luxembourg'),
('Latvia'),
('Libya'),
('Morocco'),
('Monaco'),
('Moldova'),
('Montenegro'),
('Saint Martin'),
('Madagascar'),
('Marshall Islands'),
('Macedonia'),
('Mali'),
('Myanmar [Burma]'),
('Mongolia'),
('Macao'),
('Northern Mariana Islands'),
('Martinique'),
('Mauritania'),
('Montserrat'),
('Malta'),
('Mauritius'),
('Maldives'),
('Malawi'),
('Mexico'),
('Malaysia'),
('Mozambique'),
('Namibia'),
('New Caledonia'),
('Niger'),
('Norfolk Island'),
('Nigeria'),
('Nicaragua'),
('The Netherlands'),
('Norway'),
('Nepal'),
('Nauru'),
('Niue'),
('New Zealand'),
('Oman'),
('Panama'),
('Peru'),
('French Polynesia'),
('Papua New Guinea'),
('Philippines'),
('Pakistan'),
('Poland'),
('Saint Pierre and Miquelon'),
('Pitcairn Islands'),
('Puerto Rico'),
('Palestine'),
('Portugal'),
('Palau'),
('Paraguay'),
('Qatar'),
('R�union'),
('Romania'),
('Serbia'),
('Russia'),
('Rwanda'),
('Saudi Arabia'),
('Solomon Islands'),
('Seychelles'),
('Sudan'),
('Sweden'),
('Singapore'),
('Saint Helena'),
('Slovenia'),
('Svalbard and Jan Mayen'),
('Slovakia'),
('Sierra Leone'),
('San Marino'),
('Senegal'),
('Somalia'),
('Suriname'),
('South Sudan'),
('S�o Tom� and Pr�ncipe'),
('El Salvador'),
('Sint Maarten'),
('Syria'),
('Swaziland'),
('Turks and Caicos Islands'),
('Chad'),
('French Southern Territories'),
('Togo'),
('Thailand'),
('Tajikistan'),
('Tokelau'),
('East Timor'),
('Turkmenistan'),
('Tunisia'),
('Tonga'),
('Turkey'),
('Trinidad and Tobago'),
('Tuvalu'),
('Taiwan'),
('Tanzania'),
('Ukraine'),
('Uganda'),
('U.S. Minor Outlying Islands'),
('United States'),
('Uruguay'),
('Uzbekistan'),
('Vatican City'),
('Saint Vincent and the Grenadines'),
('Venezuela'),
('British Virgin Islands'),
('U.S. Virgin Islands'),
('Vietnam'),
('Vanuatu'),
('Wallis and Futuna'),
('Samoa'),
('Kosovo'),
('Yemen'),
('Mayotte'),
('South Africa'),
('Zambia'),
('Zimbabwe')
go

INSERT INTO FletNix.dbo.Person (person_id, lastname, firstname, gender)
SELECT CAST (Id AS int) AS person_id,
		LEFT (LName,50) AS lastname,
		LEFT (FName, 50) AS firstname,
		CAST (Gender as char(1)) AS gender
FROM MYIMDB.dbo.Imported_Person


INSERT INTO FletNix.dbo.Movie (movie_id, title, duration, description, publication_year, cover_image, previous_part, price, URL)
SELECT CAST (Id AS int) AS movie_id,
		LEFT (Name,50) AS title,
		NULL AS duration,
		NULL AS description,
		CAST (Year AS int) AS publication_year,
		NULL AS cover_image,
		NULL AS previous_part,
		2.50 AS price,
		NULL AS URL
FROM MYIMDB.dbo.Imported_Movie


INSERT INTO FletNix.dbo.Customer(lastname,firstname,gender,birth_date,customer_mail_address, payment_method, payment_card_number, contract_type, subscription_start, user_name, password, country_name)
			VALUES	('Alakbarov','Umied','M','2000-1-7','U.Alakbarov@student.han.nl', 'Mastercard', '0987654321234567876543', 'Pro', GETDATE(), 'user1', 'wachtwoord1', 'The Netherlands'),
					('Awater','Dominic','M','1998-10-31','D.Awater1@student.han.nl', 'Mastercard', '8765432345678987654321', 'Pro', GETDATE(), 'user2', 'wachtwoord2', 'The Netherlands'),
					('Blijderveen','Roel','M','1995-12-10','RWM.vanBlijderveen@student.han.nl', 'Mastercard', '123456765432345654', 'Pro', GETDATE(), 'user3', 'wachtwoord3', 'The Netherlands'),
					('Bodd�','Lyon','M','2000-6-1','LLS.Bodde@student.han.nl', 'Mastercard', '3456789098712345', 'Pro', GETDATE(), 'user4', 'wachtwoord4', 'The Netherlands'),
					('Dammer','Robin','F','1997-7-27','RAJD.Dammer@student.han.nl', 'Mastercard', '098765123456654876098', 'Pro', GETDATE(), 'user5', 'wachtwoord5', 'The Netherlands'),
					('Gelderman','Caspar','M','2000-11-29','CL.Gelderman@student.han.nl', 'Mastercard', '9876543456789876543', 'Pro', GETDATE(), 'user6', 'wachtwoord6', 'The Netherlands'),
					('Gerritsen','Fabian','M','1999-8-3','F.Gerritsen@student.han.nl', 'Mastercard', '093875647389203', 'Pro', GETDATE(), 'user7', 'wachtwoord7', 'The Netherlands'),
					('Giling','Jasper','M','1999-3-4','JK.Giling@student.han.nl', 'Mastercard', '67584930264738273289', 'Pro', GETDATE(), 'user8', 'wachtwoord8', 'The Netherlands'),
					('Guelen','Thijs-Jan','M','1999-7-6','TJHH.Guelen@student.han.nl', 'Visa', '09871234677899', 'Pro', GETDATE(), 'user9', 'wachtwoord9', 'The Netherlands'),
					('Hajou','Abdel','M','2001-9-7','A.Hajou@student.han.nl', 'Visa', '536468578677979896574', 'Basic', GETDATE(), 'user10', 'wachtwoord10', 'The Netherlands'),
					('Hegeman','Sem','M','1996-9-21','SJT.Hegeman@student.han.nl', 'Visa', '76767585464354325452', 'Basic', GETDATE(), 'user11', 'wachtwoord11', 'The Netherlands'),
					('Heide','Jelle','M','1998-9-10','J.vanderHeide@student.han.nl', 'Visa', '0987654352432', 'Basic', GETDATE(), 'user12', 'wachtwoord12', 'The Netherlands'),
					('Huijskes','Roland','M','1997-4-17','RCM.Huijskes@student.han.nl', 'Visa', '123456789101112131415161718', 'Basic', GETDATE(), 'user13', 'wachtwoord13', 'The Netherlands'),
					('Josso','Benjamin','M','1998-7-10','BCR.Josso@student.han.nl', 'Visa', '64754545457575868', 'Basic', GETDATE(), 'user14', 'wachtwoord14', 'The Netherlands'),
					('Klabbers','Coen','M','2000-7-4','C.Klabbers@student.han.nl', 'Visa', '437827947238947', 'Basic', GETDATE(), 'user15', 'wachtwoord15', 'The Netherlands'),
					('Philipsen','Nick','M','1999-9-8','NJJW.Philipsen@student.han.nl', 'Visa', '08786543234567', 'Basic', GETDATE(), 'user16', 'wachtwoord16', 'The Netherlands'),
					('Pijls','Juriaan','M','1998-8-9','JM.Pijls@student.han.nl', 'Visa', '86968968686764533', 'Pro', GETDATE(), 'user17', 'wachtwoord17', 'The Netherlands'),
					('Schreuders','Joey','M','1998-3-9','JHH.Schreuders@student.han.nl', 'Visa', '8967543212345678', 'Basic', GETDATE(), 'user18', 'wachtwoord18', 'The Netherlands'),
					('Schuur','Rick','M','2000-10-2','RD.Schuur@student.han.nl', 'Visa', '2345670987653', 'Premium', GETDATE(), 'user19', 'wachtwoord19', 'The Netherlands'),
					('Slot','Youri','M','1995-1-22','Y.Slot@student.han.nl', 'Visa', '8743897483787429', 'Premium', GETDATE(), 'user20', 'wachtwoord20', 'The Netherlands'),
					('Stap','Tygo','M','1999-5-13','T.Stap@student.han.nl', 'Amex', '48579437246839264', 'Premium', GETDATE(), 'user21', 'wachtwoord21', 'The Netherlands'),
					('Stokhof','Emma','F','1995-11-6','ECJ.Stokhof@student.han.nl', 'Amex', '768553323245', 'Premium', GETDATE(), 'user22', 'wachtwoord22', 'The Netherlands'),
					('Stoter','Sylvana','F','1992-5-11','S.Stoter@student.han.nl', 'Amex', '38927489734297494', 'Premium', GETDATE(), 'user23', 'wachtwoord23', 'The Netherlands'),
					('Uuden','Frank','M','1996-10-18','FD.vanUuden@student.han.nl', 'Amex', '478352637489427798', 'Premium', GETDATE(), 'user24', 'wachtwoord24', 'The Netherlands'),
					('Verhoeven','Jurg','M','2001-3-17','JHA.Verhoeven@student.han.nl', 'Amex', '3464782368497308', 'Pro', GETDATE(), 'user25', 'wachtwoord25', 'The Netherlands'),
					('Verwegen','Vinnie','M','1996-6-14','V.Verwegen@student.han.nl', 'Amex', '8374837892748', 'Premium', GETDATE(), 'user26', 'wachtwoord26', 'The Netherlands'),
					('Wijnia','Sara','F','1997-12-14','SL.Wijnia@student.han.nl', 'Amex', '656383457564636282', 'Premium', GETDATE(), 'user27', 'wachtwoord27', 'The Netherlands'),
					('Wingens','Stijn','M','2000-6-3','SAM.Wingens@student.han.nl', 'Amex', '000000000000000000001', 'Premium', GETDATE(), 'user28', 'wachtwoord28', 'The Netherlands');

INSERT INTO FletNix.dbo.Genre(genre_name, description)
SELECT DISTINCT CAST (Genre AS varchar(255)) AS genre_name,
		NULL AS description
FROM MYIMDB.dbo.Imported_Genre

INSERT INTO FletNix.dbo.Movie_Genre (movie_id, genre_name)
	SELECT DISTINCT CAST (Id AS int) AS movie_id,
			CAST (Genre AS varchar(255)) AS genre_name
FROM MYIMDB.dbo.Imported_Genre

INSERT INTO FletNix.dbo.Movie_Cast (movie_id, person_id, role)
SELECT DISTINCT	CAST (Mid AS int) AS movie_id,
				CAST (Pid AS int) AS person_id,
				LEFT (Role,255) AS role
FROM MYIMDB.dbo.Imported_Cast

INSERT INTO FletNix.dbo.Person (person_id, lastname, firstname, gender)
SELECT DISTINCT	CAST(Id as int)+845465 as person_id,
				LEFT(LName,50) as lastname,
				LEFT(FName,50) as fistname,
				NULL as gender
FROM MYIMDB.dbo.Imported_Directors

INSERT INTO FletNix.dbo.Movie_Directors (movie_id, person_id)
SELECT CAST (Mid as int) as movie_id,
				CAST (Did as int)+845465 as person_id
FROM MYIMDB.dbo.Imported_Movie_Directors