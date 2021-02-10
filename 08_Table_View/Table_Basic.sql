--use tempdb;
--go 

/*
create database tableDB;
GO
*/

use tableDB;
go 
drop table buyTBL;
drop table userTBL;

create table userTBL (
	userID		char(8)			not null	primary key, 
	userName	nvarchar(10)	not null,
	birthyear	int				not null	default year(getdate()), 
	addr		nchar(2)		not null	default '서울',
	mobile1		char(3)			null,
	mobile2		char(8)			null,
	height		smallint		null		default 170,
	eMail		varchar(50)		not null	unique,   -- 이메일 추가 210210 14:25
	mDate		date			null	
);

create table buyTBL (
	num			int			not null , 
	userID		char(8)		not null
		foreign key references userTBL(userID),
	prodName	nchar(6)	not null,
	groupName	nchar(4)	null,
	price		int			not null,
	amount		smallint	not null
);
go

select * from buyTBL;
