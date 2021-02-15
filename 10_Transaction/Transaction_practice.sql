USE [sqlDB]
GO

-- Ʈ����� COMMIT/ROLLBACK (try-catch ��) 
BEGIN TRY
	begin tran 
	INSERT INTO [dbo].[userTbl]
			   ([userID]
			   ,[userName]
			   ,[birthyear]
			   ,[addr]
			   ,[mobile1]
			   ,[mobile2]
			   ,[height]
			   ,[mDate])
		 VALUES
			   ('KJY'
			   ,'������'
			   ,1988
			   ,'����'
			   ,'010'
			   ,'12112317'
			   ,'175'
			   ,getdate());

	INSERT INTO [dbo].[buyTbl]
			   ([userID]
			   ,[prodName]
			   ,[groupName]
			   ,[price]
			   ,[amount])
		 VALUES
			   ('KJY'
			   ,'���۶�'
			   ,NULL
			   ,30000000
			   ,1)
	-- ROLLBACK 
	COMMIT
END TRY 
BEGIN CATCH 
	ROLLBACK
END CATCH 
GO
