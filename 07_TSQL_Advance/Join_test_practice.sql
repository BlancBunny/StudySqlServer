use sqlDB;
go

create table stdTestTbl(
	id	int not null primary key,
	stdName nvarchar(8) not null,
	region nvarchar(10)
);

create table clubTestTbl(
	club_id int not null primary key, 
	clubName nvarchar(10) not null,
	buildingNum nvarchar(20) not null,
	descriptions nvarchar(20)
);

create table stdclubTestTbl (
	id int not null primary key, 
	std_id int not null 
	foreign key references stdTestTbl(id),
	club_id int not null 
	foreign key references clubTestTbl(club_id)
);

