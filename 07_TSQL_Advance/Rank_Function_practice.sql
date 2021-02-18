use sqlDB;
go

/*	순위 함수 
-형식-
<순위함수이름>() OVER(
	[PARTITION BY <partition_by_list>]  -> 기준 정하기 
	ORDER BY <order_by_list>)			-> 순위 매기기 (1등)
										=> 기준 별 순위 매기기 (~~중에서 1등) 
	*/

select ROW_NUMBER() over(order by height desc, userName asc)[키큰순위], userName, addr, height
	from userTbl; 
								--주소 별로		 -- 키 순으로       -- 가나다 순으로 
select addr, ROW_NUMBER() over(partition by addr order by height desc, username asc)[지역별키순위],
	userName, height from userTbl;

-- 1, 2, 2, 3, 4, ... 
select DENSE_RANK() over(order by height desc)[키큰순위], userName, addr, height
	from userTbl;
-- 1, 2, 2, 4, 5, ... 
select RANK() over(order by height desc)[키큰순위], userName, addr, height
	from userTbl;

