use sqlDB;
go


create table pivotTBL
(
	userName nvarchar(10),
	season nvarchar(2),
	amount int
);


insert into pivotTBL values ('�����', '�ܿ�', 10), 
							('������', '����', 15),
							('�����', '����', 25),
							('�����', '��', 3),
							('�����', '��', 37),
							('������', '�ܿ�', 40),
							('�����', '����', 14),
							('�����', '�ܿ�', 22),
							('������', '����', 64);
go

select * from pivotTBL;

select * from pivotTBL
	pivot (sum(amount)
			for season
			in ([��], [����], [����], [�ܿ�])) as resultPivot; 

insert into pivotTBL values ('���ð�', '����', 30);
