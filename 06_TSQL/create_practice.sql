use tempdb;
go

create database sqlDB;
go 
--DB ���� 

USE sqlDB;

create table userTbl
(
	userID		char(8) NOT NULL PRIMARY KEY,
	userName	nvarchar(10) not null, 
	birthyear	 int not null,
	addr		nchar(2) not null,		-- ���� 
	mobile1		char(3),			-- �޴��� ���� 
	mobile2		char(8),			-- �޴��� ������ 
	height		smallint,
	mDate		date 

);
go

CREATE TABLE buyTbl
(
	num			INT IDENTITY NOT NULL PRIMARY KEY, -- ����(PK) 
	userID		char(8) not null	-- ���̵�(FK)
	FOREIGN KEY REFERENCES userTbl(userID), 
	prodName	nchar(6) not null,	-- ��ǰ��
	groupName	nchar(4),			-- �з�
	price		int not null,		-- �ܰ� 
);
GO 