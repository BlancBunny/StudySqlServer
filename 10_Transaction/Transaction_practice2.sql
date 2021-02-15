use tempdb;
go
 
create table bankbook (
	uName nvarchar(10),
	uMoney int,
	constraint CK_money check (uMoney >= 0)
);
go

insert into bankbook values (N'구매자', 1000);
insert into bankbook values (N'판매자', 0);

select * from bankbook;

update bankbook set uMoney = uMoney - 500 where uName = N'구매자';
update bankbook set uMoney = uMoney + 500 where uName = N'판매자';
--구매자가 판매자에게 500원 송금
select * from bankbook;

update bankbook set uMoney = uMoney - 600 where uName = N'구매자';
update bankbook set uMoney = uMoney + 600 where uName = N'판매자';
-- 독립적인 트랜잭션 수행으로 2번 update 쿼리만 실행
-- 1번 쿼리는 check 제약 조건으로 인해 오류 발생 (잔고가 0원 미만으로 내려갈수 없음)
select * from bankbook; 

update bankbook set uMoney = uMoney - 600 where uName = N'판매자';
-- 복구 
select * from bankbook; 

begin tran 
	update bankbook set uMoney = uMoney - 600 where uName = N'구매자';
	update bankbook set uMoney = uMoney + 600 where uName = N'판매자';
commit tran 
select * from bankbook; 
-- 의도한 결과와 다름 (check 제약조건의 논리적 오류는 롤백되지 않음) 

update bankbook set uMoney = uMoney - 600 where uName = N'판매자';
-- 복구 
select * from bankbook; 

begin try
	begin tran
		update bankbook set uMoney = uMoney - 600 where uName = N'구매자';
		update bankbook set uMoney = uMoney + 600 where uName = N'판매자';
	commit tran
end try
begin catch
	rollback
end catch
select * from bankbook; 