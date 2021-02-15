use sqlDB;
GO

create or alter procedure usp_ifElse
	@userName nvarchar(10)
as
	declare @birthyear int;
	select @birthyear = birthyear from userTbl
		where userName = @userName;

	if(@birthyear >= 1970)
		begin
			print '아직 젊군요...'
		end
	else begin
			print '나이가 지긋하네요...'
		end

go

exec usp_ifElse '조용필';