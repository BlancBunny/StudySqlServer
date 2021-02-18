use sqlDB;
go


create or alter proc usp_error
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
	insert into userTbl (userID, userName, birthyear, addr, mobile1, mobile2, height, mDate)
		values (@userID, @name, @birthyear, @addr, @mobile1, @mobile2, @height, @mDate);

	select @err = @@ERROR;
	if @err != 0
	begin 
		print '###' + @name + '을(를) Insert에 실패했습니다. ###'
	end;

	return @err; 
go

declare @errNum int;
exec @errNum = usp_error 'WDT', '우당탕';
if (@errNum != 0)
	select @errNum;
