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
			print '���� ������...'
		end
	else begin
			print '���̰� �����ϳ׿�...'
		end

go

exec usp_ifElse '������';