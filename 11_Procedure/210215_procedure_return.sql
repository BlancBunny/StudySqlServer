use sqlDB;
go

create or alter proc usp_return
	@userName nvarchar(10)
as
	declare @userID char(8);
	select @userID = userID from userTbl
					where userName = @userName;
	if (@userID <> '') 
		return 0; -- 성공
	else return -1;
go

declare @retVal int;
exec @retVal=usp_return '이승기';
select @retVal;


exec @retVal=usp_return '나승기';
select @retVal;
