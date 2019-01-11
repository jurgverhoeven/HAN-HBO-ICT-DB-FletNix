use FletNix
go


INSERT INTO Statussen (Status, Status_uitgeschreven)
	VALUES	('W', 'WON'),
			('N', 'Nominated')
go

INSERT INTO AwardYearCountry (Award, Year, Country)
	VALUES	('Academy Awards', 2000, 'The Netherlands'),
			('BAFTA Awards', 2000, 'New Zealand')
go

INSERT INTO Person (person_id, firstname, lastname)
	VALUES	(1, 'Paul', 'Rubell'),
			(1000020, 'David', 'Rosenbloom'),
			(1000021, 'Andrew', 'Mondshein'),
			(1000003, 'Richard', 'Hymns'),
			(1000004, 'Dane', 'Davis'),
			(1000005, 'John', 'Gaeta'),
			(1000006, 'Steve', 'Courtley'), 
			(1000007, 'Jon', 'Thum'),
			(1000008, 'David', 'Lee'),
			(1000009, 'John', 'Reitz'),
			(1000010, 'Gregg', 'Rudloff'),
			(1000011, 'David', 'Campbell'),
			(1000012, 'Dane', 'Davis'),
			(1000013, 'Tom', 'Bellfort'),
			(1000014, 'Bob', 'Beemer'),
			(1000015, 'Bill', 'Pope'),
			(1000016, 'Conrad', 'Hall'),
			(1000028, 'Owen', 'Paterson'),
			(1000018, 'Zach', 'Staenberg'),
			(1000017, 'Tariq', 'Anwar')
go

INSERT INTO OverviewMovieAwardsPerYear (Award, Year, Category, movie_id, person_id, Status)
	VALUES	('Academy Awards', 2000, 'Best Film Editing', 207992, 450813, 'W'),
			('Academy Awards', 2000, 'Best Film Editing', 160492, 176884, 'N'),
			('Academy Awards', 2000, 'Best Film Editing', 160492, 1, 'N'),
			('Academy Awards', 2000, 'Best Film Editing', 160492, 1000020, 'N'),
			('Academy Awards', 2000, 'Best Film Editing', 303564, 1000021, 'N'),

			('Academy Awards', 2000, 'Best Sound Effects Editing', 112290, 251397, 'N'),
			('Academy Awards', 2000, 'Best Sound Effects Editing', 112290, 1000003, 'N'),
			('Academy Awards', 2000, 'Best Sound Effects Editing', 207992, 1000004, 'W'),
			('Academy Awards', 2000, 'Best Sound Effects Editing', 313474, 65453, 'N'),

			('Academy Awards', 2000, 'Best Visual Effects', 313474, 251981, 'N'),
			('Academy Awards', 2000, 'Best Visual Effects', 313474, 91712, 'N'),
			('Academy Awards', 2000, 'Best Visual Effects', 207992, 1000005, 'N'),
			('Academy Awards', 2000, 'Best Visual Effects', 207992, 440853, 'W'),
			('Academy Awards', 2000, 'Best Visual Effects', 207992, 1000006, 'N'),
			('Academy Awards', 2000, 'Best Visual Effects', 207992, 1000007, 'N'),

			('BAFTA Awards', 2000, 'Best Sound', 207992, 1000008, 'W'),
			('BAFTA Awards', 2000, 'Best Sound', 207992, 1000009, 'W'),
			('BAFTA Awards', 2000, 'Best Sound', 207992, 1000010, 'W'),
			('BAFTA Awards', 2000, 'Best Sound', 207992, 1000011, 'W'),
			('BAFTA Awards', 2000, 'Best Sound', 207992, 1000012, 'W'),
			('BAFTA Awards', 2000, 'Best Sound', 207992, 65453, 'N'),
			('BAFTA Awards', 2000, 'Best Sound', 207992, 1000013, 'N'),
			('BAFTA Awards', 2000, 'Best Sound', 207992, 1000014, 'N'),

			('BAFTA Awards', 2000, 'Best Cinematography', 207992, 1000015, 'N'),
			('BAFTA Awards', 2000, 'Best Cinematography', 13789, 1000016, 'W'),

			('BAFTA Awards', 2000, 'Best Production Design', 207992, 1000028, 'N'),
			('BAFTA Awards', 2000, 'Best Production Design', 304862, 364716, 'W'),

			('BAFTA Awards', 2000, 'Best Editing', 207992, 1000018, 'N'),
			('BAFTA Awards', 2000, 'Best Editing', 13789, 1000017, 'W'),
			('BAFTA Awards', 2000, 'Best Editing', 13789, 183753, 'W')