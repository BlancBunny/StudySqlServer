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
