create table testTbl(id int, userName nchar(3), age int);
go

-- DML 중 SELECT 
select * from testTbl;


-- DML 중 INSERT
insert into testTbl values (1, '홍길동', 25);
insert into testTbl(id, userName) values (2, '김현수');
insert into testTbl values (3, '홍길순'); -- 에러 (테이블 정의와 다른 형식) 
insert into testTbl (id, age) values (4, 30); 
insert into testTbl (userName, age) values ('고길동', 42); -- 에러 (id(PK) 행은 NOT NULL) 


-- identity 속성 지정 (수동) -> 테이블의 속성이 identity인 경우 id 값은 자동으로 생성 
insert into testTbl values ('성시경', 44); 

-- 강제로 id 값을 입력할 경우 identity_insert 옵션을 켜야함 
set identity_insert testTbl on; 
go
insert into testTbl (id, userName, age) values (11, '김현수', 27); 
set identity_insert testTbl off; 

-- 옵션을 끌 경우 다시 id 값 자동 생성 
insert into testTbl values ('백종원', 52); 

-- 특정 테이블의 현재 IDENTITY 값 확인 
select IDENT_CURRENT('testTbl'); -- 특정 테이블의 ID 값 확인 
select @@IDENTITY; -- 현재 세션(쿼리)에서 가장 최근에 생성된 테이블의 ID 값 확인 

select * from BikeStores.sales.order_items;
select * from ShopDB.dbo.memberTBL;

-- sales.order_items 테이블 복사 
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL);

insert into sales_order_items
	select * from BikeStores.sales.order_items;

select * from sales_order_items;



