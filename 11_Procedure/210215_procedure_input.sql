USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 2021-02-15 오후 2:11:48 ******/
CREATE OR ALTER   procedure usp_user4 -- 얘를 제일 많이 씀
	@txtValue nvarchar(20),
	@outValue int output -- return parameter 
as 
	insert into testTBL3 values (@txtValue);
	select @outValue = IDENT_CURRENT('testTBL3'); -- testTBL의 현재 Identity 값 
go 

declare @myValue int;
exec usp_user4 '테스트값 4', @myValue output;

select @myValue as '현재값';