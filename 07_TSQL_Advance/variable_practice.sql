select customer_id, first_name, last_name, phone, email, street, city, state, zip_code
	from BikeStores.sales.customers
	where last_name like 'S%' 
		and state = 'NY' 
		and phone is not null
	order by first_name;
		



declare @myVar1 int;
declare @myVar2 smallint, @myVar3 DECIMAL(5,2);
declare @myVar4 CHAR(20);

SET @myVar1 = 512315;
SET @myVar2 = 3;
SET @myVar3 = 4.25;
SET @myVar4 = '���� �̸�==>';

select @myVar1;
select @myVar2+@myVar3;
select @myVar4, userName from userTbl where height > 180; 

declare @myVar5 tinyint; 
set @myVar5 = 3;

select top(@myvar5) userName, height from userTbl order by height desc; 

select * from buyTbl;
-- ��� ���� ���� 
select AVG( convert(float, amount) ) as '��� ���� ����' from buyTbl; 


select PARSE('2021�� 2�� 39��' as date);
select try_PARSE('2021�� 2�� 39��' as date);

select parse('123.45' as float);

select GETDATE() as '���� ��¥';

select year(getdate()) as '�ݳ�'; 

select abs(-190); 

select round(1234.5678, 2); -- �Ҽ��� n�ڸ����� ǥ�� (������ ����) 

select iif(200 < 100, '��', '����') -- ���� ������ 

--���ڿ��Լ� 
select ascii('a'), ascii('A'); 
select char(97), char(65); 
select UNICODE('��'), UNICODE('��'); 
select nchar(44032); 

-- ���� ���� -- 

-- ���ڿ� ���� 
select concat('SQL ', 'Server ', 2019); 
-- ���ڿ� ������ġ ����
select charindex('Server', 'SQL Server 2019');
-- left, right
select left('SQL Server 2019', 5), right('SQL Server 2019', 6); 


select substring('Hello World!', 7, 5); -- 7��°���� 5���� ���� [7,8,9,10,11]
select substring('�ȳ��ϼ���, SQL�����Դϴ�!', 11, 2); -- 11��°���� 2���� ���� [11,12] 

select len('�ȳ��ϼ���'), len('Hello World!');
select lower('abcdefG'), upper('AabbasdqQQSA');

-- ���� ���� (L / R / LR) 
select ltrim('     Hello World!     ');
select rtrim('     Hello World!     ');
select trim ('     Hello World!     ');

-- ���� �ٲٱ� replace(A, B, C) A ���ڿ��� ���Ե� B ���ڿ��� C ���ڿ��� ġȯ 
select replace('(2016�� ��ǥ) SQL Server 2016', '2016', '2019'); 

-- ���ڿ� ���� ���� 

select format(getdate(), 'yy/MM/dd'); -- �⺻ 
/*
	��¥ ���� 
	yy / yyyy : �⵵ 
	MM : �� (MONTH) 
	dd : �� 
	hh : �� 
	mm : �� (���� ����, minute) 
	ss : �� 
*/







