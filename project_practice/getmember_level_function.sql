-- ����� ���� ���� �Լ� 
create or alter function dbo.ufn_getMemLevel(@levels char(1))
returns nvarchar(5)
as
begin
	declare @result nvarchar(5); 
	set @result = case @levels
		when 'A' then  '�÷�Ƽ��'
		when 'B' then  '���'
		when 'C' then  '�ǹ�'
		when 'D' then  '�����' 
		else '��ȸ��' 
	end;
	return @result;                                                                                                                                                                                             
end