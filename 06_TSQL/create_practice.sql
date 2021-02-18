use tempdb;
go

create database sqlDB;
go 
--DB 생성 

USE sqlDB;

create table userTbl
(
	userID		char(8) NOT NULL PRIMARY KEY,
	userName	nvarchar(10) not null, 
	birthyear	 int not null,
	addr		nchar(2) not null,		-- 지역 
	mobile1		char(3),			-- 휴대폰 국번 
	mobile2		char(8),			-- 휴대폰 나머지 
	height		smallint,
	mDate		date 

);
go

CREATE TABLE buyTbl
(
	num			INT IDENTITY NOT NULL PRIMARY KEY, -- 순번(PK) 
	userID		char(8) not null	-- 아이디(FK)
	FOREIGN KEY REFERENCES userTbl(userID), 
	prodName	nchar(6) not null,	-- 물품명
	groupName	nchar(4),			-- 분류
	price		int not null,		-- 단가 
);
GO 