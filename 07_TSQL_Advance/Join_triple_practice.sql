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

-- �̸�, ����, ������ ���Ƹ�, ���Ƹ��� 

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
select U.userID, U.userName, B.prodName, U.addr, U.mobile1 + U.mobile2 AS [����ó] 
	from userTbl U LEFT OUTER JOIN buyTbl B  -- ���ű���� ���� (���� ���̺�[userTbl] �� ��ü���� ����) 
		ON U.userID = B.userID		--> ���ų����� ���� '�����'�� �����Ͽ� ���� ��� 
	ORDER BY U.userID;

select B.prodName, U.userID, U.userName, U.addr, U.mobile1 + U.mobile2 AS [����ó] 
	from userTbl U RIGHT OUTER JOIN buyTbl B  -- ���ű���� ���� (������ ���̺�[buyTbl] �� ��ü���� ����) 
		ON U.userID = B.userID		--> ���ų����� ���� '��ǰ'�� �����Ͽ� ���� ��� 
	ORDER BY B.prodName;



