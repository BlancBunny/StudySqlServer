use sqlDB;
go

create procedure usp_users
as 
	select userID, userName, birthyear from userTBL;
go 

alter procedure usp_users
as 
	select userID, userName, birthyear from userTBL;
go 

create or alter procedure usp_users -- �긦 ���� ���� ��
as 
	select userID, userName, birthyear from userTBL;
go 



create or alter procedure usp_buyproduct
	@userID char(8)
as
	select num, userID, prodName, (price * amount) as '���űݾ�' 
	from buyTbl
	where userID = @userID;
go

exec usp_buyproduct 'BBK';