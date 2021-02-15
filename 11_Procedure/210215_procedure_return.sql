use sqlDB;
go

create or alter proc usp_return
	@userName nvarchar(10)
as
	declare @userID char(8);
	select @userID = userID from userTbl
					where userName = @userName;
	if (@userID <> '') 
		return 0; -- ����
	else return -1;
go

declare @retVal int;
exec @retVal=usp_return '�̽±�';
select @retVal;


exec @retVal=usp_return '���±�';
select @retVal;
