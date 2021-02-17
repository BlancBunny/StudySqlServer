-- 사용자 레벨 리턴 함수 
create or alter function dbo.ufn_getMemLevel(@levels char(1))
returns nvarchar(5)
as
begin
	declare @result nvarchar(5); 
	set @result = case @levels
		when 'A' then  '플래티넘'
		when 'B' then  '골드'
		when 'C' then  '실버'
		when 'D' then  '브론즈' 
		else '비회원' 
	end;
	return @result;                                                                                                                                                                                             
end