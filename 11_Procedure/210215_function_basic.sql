use sqlDB;
go

create or alter function ufn_getAge(@birthyear int)
	returns int
as 
	begin
		declare @age int 
		set @age = year(getdate()) - @birthyear + 1;
		return(@age) 
	end
go 

select dbo.ufn_getAge(1995);

