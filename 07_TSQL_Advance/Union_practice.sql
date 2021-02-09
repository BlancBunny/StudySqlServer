-- UNION / UNION ALL / EXCEPT / INTERSECT 

use sqlDB;
select stdName, addr from stdTbl;
select clubName, roomNo from clubTbl;


-- UNION / UNION ALL : �� ������ ����� ������ ��ġ�� �� 
-- �� �� ������ ȣȯ�Ǵ� ������ �����̾�� �Ѵ�. 
-- UNION �� �ߺ�����, �������� ����� �ְ� UNION ALL�� �״�� ��ģ�� 
select stdName, addr from stdTbl
	UNION
select clubName, roomNo from clubTbl; 

select stdName, addr from stdTbl
	UNION ALL
select clubName, roomNo from clubTbl;



-- EXCEPT / INTERSECT 
select userName, mobile1 + mobile2 as '����ó' from userTbl;


-- A EXCEPT B  => A �߿��� B�� ���� ����
select userName, mobile1 + mobile2 as '����ó' from userTbl
	EXCEPT 
select userName, mobile1 + mobile2 from userTbl where mobile1 is null; 


-- A INTERSECT B => A �߿��� B�� ��� 
select userName, mobile1 + mobile2 as '����ó' from userTbl
	INTERSECT
select userName, mobile1 + mobile2 from userTbl where mobile1 is null; 