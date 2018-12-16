--Gemaakt door Juriaan Pijls & Jurg Verhoeven
--HAN HBO-ICT

--Geboortedatum niet na huidige datum
--Email moet @ bevatten
--URL heeft .

use master
go

drop database FletNix
go

create database FletNix;
go

use FletNix
go

create table Movie(
	movie_id				integer			NOT NULL,
	title					varchar(255)	NOT NULL,
	duration				integer			NULL,
	description				varchar(255)	NULL,
	publication_year		integer			NULL,
	cover_image				varchar(255)	NULL,
	previous_part			integer			NULL,
	price					numeric(5,2)	NOT NULL,
	URL						varchar(255)	NULL,

	CONSTRAINT PK_MOVIE PRIMARY KEY (movie_id),
	CONSTRAINT FK_MOVIE_REF_MOVIE FOREIGN KEY (previous_part)
		REFERENCES Movie (movie_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT CK_MOVIE_PUBLICATION_YEAR CHECK (publication_year BETWEEN 1890 AND YEAR(GETDATE())),
	CONSTRAINT CK_MOVIE_URL_CONTAINS_DOT CHECK (URL like '%.%')
)

go

create table Payment(
	payment_method			varchar(10)		NOT NULL,

	CONSTRAINT PK_PAYMENT PRIMARY KEY (payment_method)
)

go

create table Contract(
	contract_type			varchar(10)		NOT NULL,
	price_per_month			numeric(5,2)	NOT NULL,
	discount_percentage		numeric(2)		NOT NULL,

	CONSTRAINT PK_CONTRACT_TYPE PRIMARY KEY (contract_type)
)

go

create table Country(
	country_name			varchar(50)		NOT NULL,

	CONSTRAINT PK_COUNTRY PRIMARY KEY (country_name)
)

go

create table Customer(
	customer_mail_address	varchar(255)	NOT NULL,
	lastname				varchar(50)		NOT NULL,
	firstname				varchar(50)		NOT NULL,
	payment_method			varchar(10)		NOT NULL,
	payment_card_number		varchar(30)		NOT NULL,
	contract_type			varchar(10)		NOT NULL,
	subscription_start		date			NOT NULL,
	subscription_end		date			NULL,
	user_name				varchar(30)		NOT NULL,
	password				varchar(50)		NOT NULL,
	country_name			varchar(50)		NOT NULL,
	gender					char(1)			NULL,
	birth_date				date			NULL,

	CONSTRAINT PK_CUSTOMER PRIMARY KEY (customer_mail_address),
	CONSTRAINT FK_CUSTOMER_REF_PAYMENT FOREIGN KEY (payment_method)
		REFERENCES Payment (payment_method) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_CUSTOMER_REF_CONTRACT FOREIGN KEY (contract_type)
		REFERENCES Contract (contract_type) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_CUSTOMER_REF_COUNTRY FOREIGN KEY (country_name)
		REFERENCES Country (country_name) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT CK_SUBSCRIPTION_START_SUBSCRIPTION_END CHECK ((subscription_start < subscription_end)),
	CONSTRAINT UQ_USERNAME UNIQUE (user_name),
	CONSTRAINT CK_BIRTH_DATE CHECK (birth_date < GETDATE()),
	CONSTRAINT CK_CUSTOMER_MAIL_ADDRESS CHECK (customer_mail_address like '%@%')
)

go

create table WatchHistory(
	movie_id				integer			NOT NULL,
	customer_mail_address	varchar(255)	NOT NULL,
	watch_date				date			NOT NULL,
	price					numeric(5,2)	NOT NULL,
	invoiced				bit				NOT NULL,

	CONSTRAINT PK_WATCHHISTORY PRIMARY KEY (movie_id, customer_mail_address, watch_date),
	CONSTRAINT FK_WATCHHISTORY_REF_CUSTOMER FOREIGN KEY (customer_mail_address)
		 REFERENCES Customer (customer_mail_address) ON UPDATE CASCADE ON DELETE NO ACTION,
	CONSTRAINT FK_WATCHHISTORY_REF_MOVIE FOREIGN KEY (movie_id)
		REFERENCES Movie (movie_id) ON UPDATE CASCADE ON DELETE NO ACTION
)

go

create table Genre(
	genre_name				varchar(255)	NOT NULL,
	description				varchar(255)	NULL,
	
	CONSTRAINT PK_GENRE PRIMARY KEY (genre_name)
)

go

create table Movie_Genre(
	movie_id				integer			NOT NULL,
	genre_name				varchar(255)	NOT NULL,

	CONSTRAINT PK_MOVIE_GENRE PRIMARY KEY (movie_id, genre_name),
	CONSTRAINT FK_MOVIE_GENRE_REF_MOVIE FOREIGN KEY (movie_id)
		REFERENCES Movie (movie_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_MOVIE_GENRE_REF_GENRE FOREIGN KEY (genre_name)
		REFERENCES Genre (genre_name) ON UPDATE CASCADE ON DELETE CASCADE
)

go

create table Person(
	person_id				integer			NOT NULL,
	lastname				varchar(50)		NOT NULL,
	firstname				varchar(50)		NOT NULL,
	gender					char(1)			NULL,

	CONSTRAINT PK_PERSON PRIMARY KEY (person_id),
	CONSTRAINT CK_GENDER CHECK (gender IN ('M', 'F'))
)

go

create table Movie_Cast(
	movie_id				integer			NOT NULL,
	person_id				integer			NOT NULL,
	role					varchar(255)	NOT NULL,

	CONSTRAINT PK_MOVIE_CAST PRIMARY KEY (movie_id, person_id, role),
	CONSTRAINT FK_MOVIE_CAST_REF_PERSON FOREIGN KEY (person_id)
		REFERENCES Person (person_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_MOVIE_CAST_REF_MOVIE FOREIGN KEY (movie_id)
		REFERENCES Movie (movie_id) ON UPDATE CASCADE ON DELETE CASCADE
)

go

create table Movie_Directors(
	movie_id				integer			NOT NULL,
	person_id				integer			NOT NULL,

	CONSTRAINT PK_MOVIE_DIRECTORS PRIMARY KEY (movie_id, person_id),
	CONSTRAINT FK_MOVIE_DIRECTORS_REF_MOVIE FOREIGN KEY (movie_id)
		REFERENCES Movie (movie_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_MOVIE_DIRECTORS_REF_PERSON FOREIGN KEY (person_id)
		REFERENCES Person (person_id) ON UPDATE CASCADE ON DELETE CASCADE
)

go