use sqlDB;
go 

-- 이름이 김경호인 사람의 모든 정보 조회 
select * from userTbl
  	where userName='김경호';

-- 1970년 이후 출생이면서, 키 182 이상인 사람의 아이디와 이름 조회 
select userID, userName from userTbl
	where birthyear >= 1970 and height >= 182; 

-- 1970년 이후 출생이거나, 키 182 이상인 사람의 아이디와 이름 조회 
select userID, userName from userTbl
	where birthyear >= 1970 or height >= 182; 

-- 키 180 이상 183 이하인 사람의 아이디, 이름, 키 조회 
select userID, userName, height from userTbl
	where height >= 180 and height <= 183;

select userID, userName, height from userTbl
	where height between 180 and 183; -- between ~ and 활용

-- 지역이 경남, 전남, 경북인 사람의 정보 
select userName, addr from userTbl
	where addr='경남' or addr='전남' or addr='경북'; 

select userName, addr from userTbl
	where addr IN('경남', '전남', '경북');  -- IN() 활용 

-- 성이 김씨인 사람의 이름과 키 조회 
select userName, height from userTbl
	where userName like '김%';    -- 전범위 

select userName, height from userTbl
	where userName like '_종신';  -- 한글자 


-- 서브쿼리 
select userName, height from userTbl 
	where height > 177; 

select userName, height from userTbl
	where height > (select height from userTbl where userName = '김경호');
				-- 177 대신에 '이름이 김경호인 사람의 키' 로 대체 가능 

select userName, height from userTbl
	where height > any (select height from userTbl where addr = '경남'); 
					-- ( > 170 or > 173 ) 
	-- any(=some) : 서브쿼리의 결과값이 둘 이상일 때, or 의 역할을 수행 
	-- [ = ANY (서브쿼리) ] == [ IN (서브쿼리) ]

select userName, height from userTbl
	where height > all (select height from userTbl where addr = '경남'); 
					-- ( > 170 and > 173 ) 
	-- all : 서브쿼리의 결과값이 둘 이상일 때, and 의 역할을 수행


-- ORDER BY (정렬) 
select userName, mDate from userTbl ORDER BY mDate; 

select userName, mDate from userTbl order by mDate DESC; -- DESC : 내림차순
select userName, mDate from userTbl order by mDate ASC; -- ASC : 오름차순(Default) 


-- DISTINCT (중복 제거) 
select DISTINCT addr from userTbl; 

-- TOP(N) : 상위 N개 출력 
select TOP(5) * from userTbl
	order by mDate desc; 
	/* N 자리에 들어갈 수 있는 것들 
		- 숫자 
		- 변수, 수식, 서브쿼리 (count(*)/100) <- 전체 갯수의 1% 
		- TOP(N) PERCENT <- N% 
		- TOP(N) PERCENT WITH TIES <- N% (동일 값이 있다면 갯수를 초과해도 출력) 
	*/ 

-- TABLESAMPLE(N PERCENT) : N% 샘플링 (순서 무작위, 개수 근사치) 
select * from userTbl TABLESAMPLE (40 PERCENT);



-- OFFSET / PATCH : 지정한 행의 수 만큼 건너 뛴 후 출력 
select userID, userName, birthyear from userTbl
	order by birthyear  

select userID, userName, birthyear from userTbl
	order by birthyear 
	OFFSET 4 ROWS;   -- 앞 4개행 생략 

select userID, userName, birthyear from userTbl
	order by birthyear
	OFFSET 4 rows
	FETCH NEXT 3 ROWS ONLY; -- 앞 4개행 생략 후 3개행만 출력  



-- SELECT INTO (테이블 복사) -> 제약 조건(PK, FK 등) 은 복사되지 않음
select * into buyTbl2 from buyTbl;
select * from buyTbl2;
select userID, prodName into buyTbl3 from buyTbl; 
select * from buyTbl3;


-- GROUP BY 
-- 물품별 총 구매수 
select userID, SUM(amount) AS [수량] from buyTbl group by userID;

-- 집계 함수 

/*
	집계 함수(행 이름) AS [이름] / '이름' 
	AVG() : 평균 
	MIN() : 최소값
	MAX() : 최대값
	COUNT() : 행의 개수 
	COUNT_BIG() : 행의 개수 (bigint 형) 
	STDEV() : 표준편차 
	VAR() : 분산 
*/

-- 평균 AVG() 
select avg(amount) as '평균 구매 개수' from buyTbl; 
-- 실제 결과가 2.91 이지만 amount가 정수형이므로 2가 나온다. 따라서 실수형으로 변환 
select avg(amount*1.0) as '평균 구매 개수' from buyTbl; 

-- 가장 큰 키와 가장 작은 키의 회원 이름과 키를 출력 
select userName, max(height), Min(height) from userTbl; -- GROUP BY 절에 없으므로 오류 
select userName, max(height), Min(height) from userTbl group by userName; 
-- 그냥 전체 결과가 출력되므로 오류
-- 서브 쿼리를 사용하여 결과 출력 
select userName, height from userTbl
	where height = (select max(height) from userTbl) 
		or height = (select min(height) from userTbl); 


-- 총 데이터 개수 COUNT() 
select count(*) as '회원' from userTbl; 
select count(*) as '구매내역' from buyTbl;
-- 휴대폰이 있는 회원만 COUNT() 
select count(mobile1) as '휴대폰이 있는 사용자' from userTbl; 


-- 집계 함수 + 조건     HAVING 절 
select userID, sum(price * amount) as '아이디별 구매금액' from buyTbl 
	-- where sum(price * amount) > 1000    : 집계 함수는 where 절에 사용할 수 없음 
	group by userID
	having sum(price * amount) > 1000;  
	-- GROUP BY [집계 대상] HAVING [조건] 순서로 작성 
	
/* ROLLUP() / CUBE()	중간 집계 함수 
	ROLLUP() : 그룹별 총합 / 소집계가 필요한 경우 (단일 차원)
	CUBE() : 결합 가능한 모든 값에 대해 다차원 집계를 생성 
			 Grand Total (총집계) 가 양쪽 쿼리에서 모두 생성되므로 
			 1회 제거 필요 <- 시스템 연산이 많음, 잘 안씀 
*/ 


select num, groupName, sum(price * amount) as '비용' from buyTbl
	group by ROLLUP (groupName, num); 
	-- groupName 을 기준으로 정렬, 소집계, 총집계 
select num, groupName, sum(price * amount) as '비용' from buyTbl
	group by ROLLUP (num, groupName); 
	-- num 을 기준으로 정렬 (num은 구매 내역 PK 이므로 의미 없음) 
select groupName, sum(price * amount) as '비용' from buyTbl
	group by ROLLUP (groupName); 
	-- 그룹화 하지 않고 소집계, 총집계만 출력 
	

-- WITH 절 : CTE를 표현하기 위한 구문 
-- CTE : ? 
-- 비재귀적 CTE / 재귀적 CTE 로 나뉨 

-- 비재귀적 CTE 
with cte_tmp(userID, total) -- total을 sum(price * amount) 로 치환 
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
	-- userID 와 합계를 출력 / userID 로 그룹화, 구매총액 내림차순으로 정렬 

