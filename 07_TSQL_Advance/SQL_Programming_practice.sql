

-- IF --
declare @var1 int 
set @var1 = 100 

if @var1 = 100
	BEGIN 
		print '@var1�� 100�̴�' 
		select '@var1 = 100' as '���'
	END 
else 
	BEGIN
		print '@var1�� 100�� �ƴϴ�' 
	END


select * from buyTbl;
use sqlDB;
go 
select userID, SUM(price * amount) as '�ѱ��ž�' 
	from buyTbl 
	group by userID 
	order by SUM(price * amount) desc;


-- CASE -- 
select U.userID, U.userName, SUM(price*amount) as '�ѱ��ž�',
	CASE 
		WHEN (SUM(price*amount) >= 1500) THEN N'�ֿ����'
		WHEN (SUM(price*amount) >= 1000) THEN N'�����' 
		WHEN (SUM(price*amount) >= 1) THEN N'�Ϲݰ�' 
		ELSE N'���ɰ�'
	END as '�����' 
	from buyTbl B 
	right outer join userTbl U 
	on B.userID = U.userID 
	group by U.userID , U.userName
	order by SUM(price * amount) desc 


-- WHILE -- 
declare @i int = 1
declare @hap bigint = 0

WHILE (@i <= 100)
BEGIN 
		set @hap += @i
		set @i += 1
END

print @hap


-- TRY/CATCH --
use sqlDB;
go

begin try
	insert into userTbl values('LSG', '�̻�', 1988, '����', NULL, NULL, 170, GETDATE())
	print N'���������� �ԷµǾ���.'
end try

begin catch
	print N'�Է� ����' 
end catch 



-- EXEC (����) -- 
use sqlDB; 
GO 

declare @sql varchar(100);
set @sql = 'select * from userTbl where userID = ''EJW'' '; 
EXEC(@sql);


-- Dynamic EXEC -- 
declare @curDATE DATE;
declare @curYEAR VARCHAR(4);
declare @curMonth VARCHAR(2);
declare @curDay VARCHAR(2); 
declare @sql2 VARCHAR(100);

set @curDATE = GETDATE();
set	@curYEAR = YEAR(@curDATE);
set	@curMonth = month(@curDATE);
set	@curDay = day(@curDATE);

set @sql2 = 'create table myTbl' + @curYEAR + '_' + @curMonth + '_' + @curDay;
set @sql2 += '(id INT, name NCHAR(10))';
select @sql2;
exec (@sql2) 



