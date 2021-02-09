use sqlDB;
go

/*	���� �Լ� 
-����-
<�����Լ��̸�>() OVER(
	[PARTITION BY <partition_by_list>]  -> ���� ���ϱ� 
	ORDER BY <order_by_list>)			-> ���� �ű�� (1��)
										=> ���� �� ���� �ű�� (~~�߿��� 1��) 
	*/

select ROW_NUMBER() over(order by height desc, userName asc)[Űū����], userName, addr, height
	from userTbl; 
								--�ּ� ����		 -- Ű ������       -- ������ ������ 
select addr, ROW_NUMBER() over(partition by addr order by height desc, username asc)[������Ű����],
	userName, height from userTbl;

-- 1, 2, 2, 3, 4, ... 
select DENSE_RANK() over(order by height desc)[Űū����], userName, addr, height
	from userTbl;
-- 1, 2, 2, 4, 5, ... 
select RANK() over(order by height desc)[Űū����], userName, addr, height
	from userTbl;

