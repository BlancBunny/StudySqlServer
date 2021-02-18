create or alter function ufn_getState(@rentalState char(1))
returns nvarchar(5)
as
begin
	declare @result nvarchar(5);
	set @result = case @rentalState
				when '1' then '대여중'
				when '2' then '반납'
				when '3' then '연체중'
				else '분실'
	end
	return @result;
end 

go