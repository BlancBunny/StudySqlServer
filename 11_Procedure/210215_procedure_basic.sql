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

create or alter procedure usp_users -- 얘를 제일 많이 씀
as 
	select userID, userName, birthyear from userTBL;
go 



create or alter procedure usp_buyproduct
	@userID char(8)
as
	select num, userID, prodName, (price * amount) as '구매금액' 
	from buyTbl
	where userID = @userID;
go

exec usp_buyproduct 'BBK';