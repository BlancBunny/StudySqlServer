

-- IF --
declare @var1 int 
set @var1 = 100 

if @var1 = 100
	BEGIN 
		print '@var1은 100이다' 
		select '@var1 = 100' as '결과'
	END 
else 
	BEGIN
		print '@var1은 100이 아니다' 
	END


select * from buyTbl;
use sqlDB;
go 
select userID, SUM(price * amount) as '총구매액' 
	from buyTbl 
	group by userID 
	order by SUM(price * amount) desc;


-- CASE -- 
select U.userID, U.userName, SUM(price*amount) as '총구매액',
	CASE 
		WHEN (SUM(price*amount) >= 1500) THEN N'최우수고객'
		WHEN (SUM(price*amount) >= 1000) THEN N'우수고객' 
		WHEN (SUM(price*amount) >= 1) THEN N'일반고객' 
		ELSE N'유령고객'
	END as '고객등급' 
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
	insert into userTbl values('LSG', '이상구', 1988, '서울', NULL, NULL, 170, GETDATE())
	print N'정상적으로 입력되었다.'
end try

begin catch
	print N'입력 실패' 
end catch 



-- EXEC (실행) -- 
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



