use sqlDB;
go


create or alter proc usp_trycatch
	@userID char(8),
	@name nvarchar(10),
	@birthyear int = 1900, 
	@addr nchar(2) = '서울',
	@mobile1 char(3) = NULL,
	@mobile2 char(8) = NULL,
	@height smallint = 170, 
	@mDate date = '2019-11-11'
as 
	declare @err int;
	begin try
	insert into userTbl (userID, userName, birthyear, addr, mobile1, mobile2, height, mDate)
		values (@userID, @name, @birthyear, @addr, @mobile1, @mobile2, @height, @mDate);
	end try
	begin catch
		select ERROR_NUMBER()
		select ERROR_MESSAGE()
	end catch
go

exec usp_trycatch 'SYJ', '손연재';
