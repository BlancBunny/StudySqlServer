use sqlDB;
go

create trigger testTrg -- create : DDL (Data Definition Language) 
on testtbl
after delete, update -- ����, �������� Ʈ���� �߻� 
as
	print 'Ʈ���� �߻�'; 

insert into testtbl values ('������');
select * from testtbl;
update testtbl set txt = '��������!' where id = 1;
delete testtbl where id = 1;