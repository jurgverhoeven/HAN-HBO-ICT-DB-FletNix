--Gemaakt door Juriaan Pijls & Jurg Verhoeven

--HAN HBO-ICT


use FletNix
go

drop table OverviewMovieAwardsPerYear
go

drop table Statussen
go

drop table AwardYearCountry
go

create table Statussen (
Status						varchar (2)	not null,
Status_uitgeschreven		varchar(10)		not null,

CONSTRAINT PK_Statussen PRIMARY KEY (Status)
)

go

create table AwardYearCountry (
Award				varchar(30)				not null,
Year				integer					not null,
Country				varchar(50)				not null,

CONSTRAINT PK_AwardYearCountry PRIMARY KEY (Award,Year),
CONSTRAINT FK_AwardYearCountry_REF_Country FOREIGN KEY (Country)
	REFERENCES Country (country_name)
)

go

create table OverviewMovieAwardsPerYear (
	Award				varchar(30)				not null,
	Year				integer					not null,
	Category			varchar(30)				not null,
	movie_id			integer					not null,
	person_id			integer					not null,
	Status				Varchar(2)				not null,

CONSTRAINT PK_OverviewMovieAwardsPerYear PRIMARY KEY (Award,Year,Category,Movie_id,Person_id),
CONSTRAINT FK_OverviewMovieAwardsPerYear_AwardYearCountry FOREIGN KEY (Award, Year)
		REFERENCES AwardYearCountry (Award, Year),
CONSTRAINT FK_Awardsperyear FOREIGN KEY (Status) 
		REFERENCES Statussen (Status) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT FK_OverviewMovieAwardsPerYear_REF_Movie FOREIGN KEY (movie_id)
		REFERENCES Movie (movie_id),
CONSTRAINT FK_OverviewMovieAwardsPerYear_REF_Person FOREIGN KEY (person_id)
		REFERENCES Person (person_id)
)

go


