use tempdb;
go
 
create table bankbook (
	uName nvarchar(10),
	uMoney int,
	constraint CK_money check (uMoney >= 0)
);
go

insert into bankbook values (N'������', 1000);
insert into bankbook values (N'�Ǹ���', 0);

select * from bankbook;

update bankbook set uMoney = uMoney - 500 where uName = N'������';
update bankbook set uMoney = uMoney + 500 where uName = N'�Ǹ���';
--�����ڰ� �Ǹ��ڿ��� 500�� �۱�
select * from bankbook;

update bankbook set uMoney = uMoney - 600 where uName = N'������';
update bankbook set uMoney = uMoney + 600 where uName = N'�Ǹ���';
-- �������� Ʈ����� �������� 2�� update ������ ����
-- 1�� ������ check ���� �������� ���� ���� �߻� (�ܰ� 0�� �̸����� �������� ����)
select * from bankbook; 

update bankbook set uMoney = uMoney - 600 where uName = N'�Ǹ���';
-- ���� 
select * from bankbook; 

begin tran 
	update bankbook set uMoney = uMoney - 600 where uName = N'������';
	update bankbook set uMoney = uMoney + 600 where uName = N'�Ǹ���';
commit tran 
select * from bankbook; 
-- �ǵ��� ����� �ٸ� (check ���������� ���� ������ �ѹ���� ����) 

update bankbook set uMoney = uMoney - 600 where uName = N'�Ǹ���';
-- ���� 
select * from bankbook; 

begin try
	begin tran
		update bankbook set uMoney = uMoney - 600 where uName = N'������';
		update bankbook set uMoney = uMoney + 600 where uName = N'�Ǹ���';
	commit tran
end try
begin catch
	rollback
end catch
select * from bankbook; 