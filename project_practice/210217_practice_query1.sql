use BookRentalShopDB;
go

-- 회원정보 불러오기 (이름순) 
select memberID, memberName, levels, mobile, email from memberTBL
	where levels <> 'S'
	order by levels desc, memberName;

-- 책정보
select cate_idx, bookTitle, bookAuthor, 
	interpreter, company, price
	from booksTBL
	order by price desc;

-- 시스템 함수사용 쿼리 
select	memberID, 
		concat(right(memberName, 2), ' ', left(memberName, 1)) as '미국식이름',
		dbo.ufn_getMemLevel(levels) as '회원등급',		
		mobile, 
		upper(email) as '이메일'
	from memberTBL
	where levels <> 'S'
		order by memberName;

-- 책 정보, 시스템 함수, 포맷 함수 쿼리
SELECT book_idx
	,cate_idx
	,concat (N'책제목 >', bookTitle) as bookTitle 
	,bookAuthor
	,isnull(interpreter, '역자 없음') as 'interpreter'
    ,company
	,format(releaseDate, 'yyyy년 MM월 dd일') as 'releaseDate'
    ,format(price, '#,#원') as '가격' 
  FROM booksTBL


-- 책정보 JOIN 
USE BookRentalShopDB
GO

SELECT b.book_idx 
--    ,b.cate_idx 
	  ,c.cateName
      ,b.bookTitle
      ,b.bookAuthor
      ,b.interpreter
      ,b.company
	FROM booksTBL as b
		INNER JOIN cateTBL as c 
		on b.cate_idx = c.cate_idx;


-- 대여된 책의 정보	
SELECT r.rental_idx
	  ,m.memberName
	  ,b.bookTitle
      ,format(r.rentalDate, 'yyyy-MM-dd') as 대여일
	  ,dbo.ufn_getState(r.rentalState) as 비고
	FROM rentalTBL as r 
		right outer join memberTBL as m
		on r.member_idx = m.member_idx
		left outer join booksTBL as b 
		on r.book_idx = b.book_idx
		where r.rental_idx is null;
		
GO



