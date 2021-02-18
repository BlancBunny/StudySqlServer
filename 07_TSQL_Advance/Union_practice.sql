-- UNION / UNION ALL / EXCEPT / INTERSECT 

use sqlDB;
select stdName, addr from stdTbl;
select clubName, roomNo from clubTbl;


-- UNION / UNION ALL : 두 쿼리의 결과를 행으로 합치는 것 
-- 각 열 단위는 호환되는 데이터 형식이어야 한다. 
-- UNION 은 중복제거, 순서정렬 기능이 있고 UNION ALL은 그대로 합친다 
select stdName, addr from stdTbl
	UNION
select clubName, roomNo from clubTbl; 

select stdName, addr from stdTbl
	UNION ALL
select clubName, roomNo from clubTbl;



-- EXCEPT / INTERSECT 
select userName, mobile1 + mobile2 as '연락처' from userTbl;


-- A EXCEPT B  => A 중에서 B는 빼고 동작
select userName, mobile1 + mobile2 as '연락처' from userTbl
	EXCEPT 
select userName, mobile1 + mobile2 from userTbl where mobile1 is null; 


-- A INTERSECT B => A 중에서 B만 출력 
select userName, mobile1 + mobile2 as '연락처' from userTbl
	INTERSECT
select userName, mobile1 + mobile2 from userTbl where mobile1 is null; 