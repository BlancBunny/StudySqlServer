use sqlDB;
go

create or alter proc usp_return
	@userName nvarchar(10)
as
	declare @userID char(8);
	select @userID = userID from userTbl
					where userName = @userName;
	if (@userID <> '') 
		return 0; -- ¼º°ø
	else return -1;
go

declare @retVal int;
exec @retVal=usp_return 'ÀÌ½Â±â';
select @retVal;


exec @retVal=usp_return '³ª½Â±â';
select @retVal;
