USE [sqlDB]
GO

-- 트랜잭션 COMMIT/ROLLBACK (try-catch 문) 
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
			   ,'권지용'
			   ,1988
			   ,'서울'
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
			   ,'선글라스'
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
