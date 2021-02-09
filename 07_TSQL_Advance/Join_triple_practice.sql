USE sqlDB;
go 

create table stdTbl (
	stdName nvarchar(10) not null primary key,
	addr	nchar(4) not null );
go 

create table clubTbl (
	clubName nvarchar(10) not null primary key,
	roomNo	nchar(4) not null );
go 

create table stdclubTbl (
	num int identity not null primary key,
	stdName nvarchar(10) not null
	foreign key references stdTbl(stdName), 
	clubName nvarchar(10) not null
	foreign key references clubTbl(clubName)
	);
go 


select * from stdTbl;
select * from clubTbl;
select * from stdclubTbl;

-- 이름, 지역, 가입한 동아리, 동아리실 

-- INNER JOIN 
select S.stdName, S.addr, C.clubName, C.roomNo from stdTbl S
	inner join stdclubTbl SC on S.stdName = SC.stdName
	inner join clubTbl C on SC.clubName = C.clubName
	order by S.stdName;

select C.clubName, S.stdName, S.addr, C.roomNo from stdTbl S
	inner join stdclubTbl SC on S.stdName = SC.stdName
	inner join clubTbl C on SC.clubName = C.clubName
	order by C.clubName;

-- OUTER JOIN
select U.userID, U.userName, B.prodName, U.addr, U.mobile1 + U.mobile2 AS [연락처] 
	from userTbl U LEFT OUTER JOIN buyTbl B  -- 구매기록을 본다 (왼쪽 테이블[userTbl] 의 전체내용 포함) 
		ON U.userID = B.userID		--> 구매내역이 없는 '사용자'도 포함하여 내용 출력 
	ORDER BY U.userID;

select B.prodName, U.userID, U.userName, U.addr, U.mobile1 + U.mobile2 AS [연락처] 
	from userTbl U RIGHT OUTER JOIN buyTbl B  -- 구매기록을 본다 (오른쪽 테이블[buyTbl] 의 전체내용 포함) 
		ON U.userID = B.userID		--> 구매내역이 없는 '물품'도 포함하여 내용 출력 
	ORDER BY B.prodName;



