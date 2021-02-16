use sqlDB;
go

create trigger trg_backupUsertbl 
on userTBL
with encryption
after update, delete 
as
	declare @modType nchar(2);
	
	if (COLUMNS_UPDATED()>0) -- ������Ʈ
	begin	
		set @modType = '����';
	end 
	else -- ���� 
	begin 
		set @modType = '����'; 
	end 

	insert into backup_userTbl 
		SELECT	[userID]
				,[userName]
			    ,[birthyear]
				,[addr]
				,[mobile1]
				,[mobile2]
				,[height]
				,[mDate]
				,@modType
				,getdate()
				,USER_NAME()
				from deleted;
				
go
