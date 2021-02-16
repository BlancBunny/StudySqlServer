use sqlDB;
go 

declare cur_usertbl	cursor global
	for select userName, height from userTbl;

open cur_usertbl;

declare @userName nchar(8); -- 회원 이름
declare @height smallint; -- 회원의 키 
declare @cnt int = 0;	  -- 회원수(읽은 행수)
declare @totalheight int = 0; -- 회원 키의 합계 

fetch next from cur_usertbl into @userName ,@height; -- 커서 값 읽어서 변수에 할당

-- 반복문 시작
while @@FETCH_STATUS = 0
begin
	set @cnt += 1 
	set @totalheight += @height
	fetch next from cur_usertbl into @userName, @height; 
	print concat(@username, '회원님의 신장은 ', @height, '입니다.');
end 

print '고객 키의 평균 = ' + CAST(@totalheight/@cnt as char(10));

close cur_usertbl;
deallocate cur_usertbl;

