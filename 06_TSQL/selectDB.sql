use sqlDB;
go 

-- �̸��� ���ȣ�� ����� ��� ���� ��ȸ 
select * from userTbl
  	where userName='���ȣ';

-- 1970�� ���� ����̸鼭, Ű 182 �̻��� ����� ���̵�� �̸� ��ȸ 
select userID, userName from userTbl
	where birthyear >= 1970 and height >= 182; 

-- 1970�� ���� ����̰ų�, Ű 182 �̻��� ����� ���̵�� �̸� ��ȸ 
select userID, userName from userTbl
	where birthyear >= 1970 or height >= 182; 

-- Ű 180 �̻� 183 ������ ����� ���̵�, �̸�, Ű ��ȸ 
select userID, userName, height from userTbl
	where height >= 180 and height <= 183;

select userID, userName, height from userTbl
	where height between 180 and 183; -- between ~ and Ȱ��

-- ������ �泲, ����, ����� ����� ���� 
select userName, addr from userTbl
	where addr='�泲' or addr='����' or addr='���'; 

select userName, addr from userTbl
	where addr IN('�泲', '����', '���');  -- IN() Ȱ�� 

-- ���� �达�� ����� �̸��� Ű ��ȸ 
select userName, height from userTbl
	where userName like '��%';    -- ������ 

select userName, height from userTbl
	where userName like '_����';  -- �ѱ��� 


-- �������� 
select userName, height from userTbl 
	where height > 177; 

select userName, height from userTbl
	where height > (select height from userTbl where userName = '���ȣ');
				-- 177 ��ſ� '�̸��� ���ȣ�� ����� Ű' �� ��ü ���� 

select userName, height from userTbl
	where height > any (select height from userTbl where addr = '�泲'); 
					-- ( > 170 or > 173 ) 
	-- any(=some) : ���������� ������� �� �̻��� ��, or �� ������ ���� 
	-- [ = ANY (��������) ] == [ IN (��������) ]

select userName, height from userTbl
	where height > all (select height from userTbl where addr = '�泲'); 
					-- ( > 170 and > 173 ) 
	-- all : ���������� ������� �� �̻��� ��, and �� ������ ����


-- ORDER BY (����) 
select userName, mDate from userTbl ORDER BY mDate; 

select userName, mDate from userTbl order by mDate DESC; -- DESC : ��������
select userName, mDate from userTbl order by mDate ASC; -- ASC : ��������(Default) 


-- DISTINCT (�ߺ� ����) 
select DISTINCT addr from userTbl; 

-- TOP(N) : ���� N�� ��� 
select TOP(5) * from userTbl
	order by mDate desc; 
	/* N �ڸ��� �� �� �ִ� �͵� 
		- ���� 
		- ����, ����, �������� (count(*)/100) <- ��ü ������ 1% 
		- TOP(N) PERCENT <- N% 
		- TOP(N) PERCENT WITH TIES <- N% (���� ���� �ִٸ� ������ �ʰ��ص� ���) 
	*/ 

-- TABLESAMPLE(N PERCENT) : N% ���ø� (���� ������, ���� �ٻ�ġ) 
select * from userTbl TABLESAMPLE (40 PERCENT);



-- OFFSET / PATCH : ������ ���� �� ��ŭ �ǳ� �� �� ��� 
select userID, userName, birthyear from userTbl
	order by birthyear  

select userID, userName, birthyear from userTbl
	order by birthyear 
	OFFSET 4 ROWS;   -- �� 4���� ���� 

select userID, userName, birthyear from userTbl
	order by birthyear
	OFFSET 4 rows
	FETCH NEXT 3 ROWS ONLY; -- �� 4���� ���� �� 3���ุ ���  



-- SELECT INTO (���̺� ����) -> ���� ����(PK, FK ��) �� ������� ����
select * into buyTbl2 from buyTbl;
select * from buyTbl2;
select userID, prodName into buyTbl3 from buyTbl; 
select * from buyTbl3;


-- GROUP BY 
-- ��ǰ�� �� ���ż� 
select userID, SUM(amount) AS [����] from buyTbl group by userID;

-- ���� �Լ� 

/*
	���� �Լ�(�� �̸�) AS [�̸�] / '�̸�' 
	AVG() : ��� 
	MIN() : �ּҰ�
	MAX() : �ִ밪
	COUNT() : ���� ���� 
	COUNT_BIG() : ���� ���� (bigint ��) 
	STDEV() : ǥ������ 
	VAR() : �л� 
*/

-- ��� AVG() 
select avg(amount) as '��� ���� ����' from buyTbl; 
-- ���� ����� 2.91 ������ amount�� �������̹Ƿ� 2�� ���´�. ���� �Ǽ������� ��ȯ 
select avg(amount*1.0) as '��� ���� ����' from buyTbl; 

-- ���� ū Ű�� ���� ���� Ű�� ȸ�� �̸��� Ű�� ��� 
select userName, max(height), Min(height) from userTbl; -- GROUP BY ���� �����Ƿ� ���� 
select userName, max(height), Min(height) from userTbl group by userName; 
-- �׳� ��ü ����� ��µǹǷ� ����
-- ���� ������ ����Ͽ� ��� ��� 
select userName, height from userTbl
	where height = (select max(height) from userTbl) 
		or height = (select min(height) from userTbl); 


-- �� ������ ���� COUNT() 
select count(*) as 'ȸ��' from userTbl; 
select count(*) as '���ų���' from buyTbl;
-- �޴����� �ִ� ȸ���� COUNT() 
select count(mobile1) as '�޴����� �ִ� �����' from userTbl; 


-- ���� �Լ� + ����     HAVING �� 
select userID, sum(price * amount) as '���̵� ���űݾ�' from buyTbl 
	-- where sum(price * amount) > 1000    : ���� �Լ��� where ���� ����� �� ���� 
	group by userID
	having sum(price * amount) > 1000;  
	-- GROUP BY [���� ���] HAVING [����] ������ �ۼ� 
	
/* ROLLUP() / CUBE()	�߰� ���� �Լ� 
	ROLLUP() : �׷캰 ���� / �����谡 �ʿ��� ��� (���� ����)
	CUBE() : ���� ������ ��� ���� ���� ������ ���踦 ���� 
			 Grand Total (������) �� ���� �������� ��� �����ǹǷ� 
			 1ȸ ���� �ʿ� <- �ý��� ������ ����, �� �Ⱦ� 
*/ 


select num, groupName, sum(price * amount) as '���' from buyTbl
	group by ROLLUP (groupName, num); 
	-- groupName �� �������� ����, ������, ������ 
select num, groupName, sum(price * amount) as '���' from buyTbl
	group by ROLLUP (num, groupName); 
	-- num �� �������� ���� (num�� ���� ���� PK �̹Ƿ� �ǹ� ����) 
select groupName, sum(price * amount) as '���' from buyTbl
	group by ROLLUP (groupName); 
	-- �׷�ȭ ���� �ʰ� ������, �����踸 ��� 
	

-- WITH �� : CTE�� ǥ���ϱ� ���� ���� 
-- CTE : ? 
-- ������� CTE / ����� CTE �� ���� 

-- ������� CTE 
with cte_tmp(userID, total) -- total�� sum(price * amount) �� ġȯ 
as ( 
	select userID, sum(price * amount) as 'total' 
		from buyTbl
		group by userID ) 
select * from cte_tmp order by total desc; 

-- without CTE 
select userID, sum(price * amount) as 'total' 
	from buyTbl
	group by userID
	order by sum(price * amount) desc; 
	-- userID �� �հ踦 ��� / userID �� �׷�ȭ, �����Ѿ� ������������ ���� 

