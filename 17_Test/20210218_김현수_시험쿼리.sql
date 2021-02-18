-- 1번 문항 아래의 그림과 같이 결과가 나오도록 쿼리를 작성하세요
-- 1-1 사용자 정보가 아래와 같이 결과가 나옵니다
select 
	lower(Email) as 'email',
	Mobile, 
	Names, 
	Addr 
	from membertbl
	order by Names desc;

-- 1-2 책 정보가 아래와 같이 결과가 나옵니다. 
select names, author, releaseDate, price from bookstbl;


-- 2번 문항 아래의 그림과 같이 결과가 나오도록 쿼리를 작성하세요. 시스템(내장) 함수를 사용하세요
-- 2-1 사용자 정보가 아래와 같이 나옵니다. 
select top 10
	concat(right(Names, 2), ', ', left(Names, 1)) as '변경이름',
	levels, 
	left(Addr, 2) as '도시',
	lower(Email) as '이메일'
from membertbl;

-- 2-2 책 정보가 아래와 같이 나옵니다. 
select 
	Idx,
	concat('제목 : ', Names) as 'Names',
	concat('저자 > ', Author) as 'Author',
	format(ReleaseDate, 'yyyy년 MM월 dd일') as '출판일',
	ISBN,
	format(Price, '#,#원') as '가격'
 from bookstbl order by idx desc;


-- 3번 문항 
-- 3-1 Inner Join을 사용하여 아래와 같이 결과가 나옵니다.
select 
	b.Idx as '번호',
	b.Division as '장르번호',
	d.Names as '장르',
	b.Names as '책제목',
	b.Author as '저자'
 from bookstbl	as b
	inner join divtbl as d
	on b.Division = d.Division
	where b.Division = 'B002';

-- 3-2 Outer Join을 사용하여 아래와 같이 결과가 나옵니다. 서점에서 책을 한번도 빌리지 않은 회원입니다.
select 
	m.Names,
	m.Levels,
	m.Addr,
	r.rentalDate
from rentaltbl as r
	right outer join membertbl as m
	on r.memberIdx = m.Idx
	where rentalDate is null;


-- 4번 문항
begin tran;
-- 4-1 책 장르 테이블(divtbl)에 아래와 같은 데이터가 들어갑니다.
insert into divtbl values 
	('I002', '자기개발서');

select * from divtbl;
rollback;
commit;


begin tran;
-- 4-2 회원정보에서 성명건 회원의 등급과 주소를 변경하는 쿼리를 작성합니다.
update membertbl 
	set addr = '부산시 해운대구',
		Mobile = '010-6683-7732'
	where Names = '성명건' 

select * from membertbl where Names = '성명건';
rollback;
commit;


-- 5번 문항 집계쿼리, 통계쿼리를 사용하여 아래와 같이 나오도록 합니다. 
select d.names, sum(Price) as '총합계금액' from bookstbl as b
	inner join divtbl as d
	on b.Division = d.Division
	group by rollup (d.Names);

	