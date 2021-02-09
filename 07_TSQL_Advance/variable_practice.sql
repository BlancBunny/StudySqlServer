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
SET @myVar4 = '가수 이름==>';

select @myVar1;
select @myVar2+@myVar3;
select @myVar4, userName from userTbl where height > 180; 

declare @myVar5 tinyint; 
set @myVar5 = 3;

select top(@myvar5) userName, height from userTbl order by height desc; 

select * from buyTbl;
-- 평균 구매 개수 
select AVG( convert(float, amount) ) as '평균 구매 개수' from buyTbl; 


select PARSE('2021년 2월 39일' as date);
select try_PARSE('2021년 2월 39일' as date);

select parse('123.45' as float);

select GETDATE() as '현재 날짜';

select year(getdate()) as '금년'; 

select abs(-190); 

select round(1234.5678, 2); -- 소수점 n자리까지 표기 (음수도 가능) 

select iif(200 < 100, '참', '거짓') -- 삼항 연산자 

--문자열함수 
select ascii('a'), ascii('A'); 
select char(97), char(65); 
select UNICODE('가'), UNICODE('다'); 
select nchar(44032); 

-- 많이 쓰임 -- 

-- 문자열 결합 
select concat('SQL ', 'Server ', 2019); 
-- 문자열 시작위치 리턴
select charindex('Server', 'SQL Server 2019');
-- left, right
select left('SQL Server 2019', 5), right('SQL Server 2019', 6); 


select substring('Hello World!', 7, 5); -- 7번째부터 5개의 문자 [7,8,9,10,11]
select substring('안녕하세요, SQL서버입니다!', 11, 2); -- 11번째부터 2개의 문자 [11,12] 

select len('안녕하세요'), len('Hello World!');
select lower('abcdefG'), upper('AabbasdqQQSA');

-- 공백 제거 (L / R / LR) 
select ltrim('     Hello World!     ');
select rtrim('     Hello World!     ');
select trim ('     Hello World!     ');

-- 글자 바꾸기 replace(A, B, C) A 문자열에 포함된 B 문자열을 C 문자열로 치환 
select replace('(2016년 발표) SQL Server 2016', '2016', '2019'); 

-- 문자열 포맷 지정 

select format(getdate(), 'yy/MM/dd'); -- 기본 
/*
	날짜 포맷 
	yy / yyyy : 년도 
	MM : 월 (MONTH) 
	dd : 일 
	hh : 시 
	mm : 분 (월과 구분, minute) 
	ss : 초 
*/







