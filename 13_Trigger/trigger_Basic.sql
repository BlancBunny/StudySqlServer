use sqlDB;
go

create trigger testTrg -- create : DDL (Data Definition Language) 
on testtbl
after delete, update -- 삭제, 수정에서 트리거 발생 
as
	print '트리거 발생'; 

insert into testtbl values ('마마무');
select * from testtbl;
update testtbl set txt = '마마무뉴!' where id = 1;
delete testtbl where id = 1;