select * from memberTBL;

select * from booksTBL;

select * from cateTBL;

select * from rentalTBL;

-- outer join 쿼리 

USE BookRentalShopDB
GO

SELECT r.rental_idx
	  ,m.memberName
	  ,c.cateName
	  ,b.bookTitle
      ,format(r.rentalDate, 'yyyy-MM-dd') as '대여일'
	  ,format(r.returnDate, 'yyyy-MM-dd') as '반납일' 
	  ,dbo.ufn_getState(r.rentalState) as '비고'
  FROM rentalTBL as r 
	right outer join booksTBL as b   -- 
	on b.book_idx = r.book_idx		
	right outer join memberTBL as m 
	on m.member_idx = r.member_idx  
	left outer join cateTBL as c
	on c.cate_idx = b.cate_idx
	where r.rental_idx is null;
	

GO


insert into booksTBL (
	cate_idx,
	bookTitle,
	bookAuthor,
	company,
	releaseDate,
	ISBN,
	price
)
values (
	'N0002',
	'순수하지 않은 감각',
	'요한나',
	'로코코',
	'19-12-17',
	'9791135445705',
	12500
);

-- update 과정 : begin tran - [update - rollback] - commit
begin tran;
select * from booksTBL;
update booksTBL
	set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.
						교육자 부모 아래서 보수적이고 모범적으로 자랐지만,
						원하는 건 무조건 손에 넣어야 하는 집요한 남자.
						그런 그를 자꾸 낯선 충동에 시달리게 하는 여자가 나타났다.
						그녀는 바로 협력사 KJ 신기주 대표의 유능한 비서, 임정은.',
	regDate = '2021-02-18'
	where book_idx = 16 
rollback;
commit;

select * from cateTBL;

-- 카테고리 입력 
begin tran;
insert into cateTBL values 
	('I0001', '대화/협상'),
	('I0002', '성공/처세'),
	('I0003', '시간관리'); 
select * from cateTBL;
rollback;
commit;

begin tran;
	delete from cateTBL where cate_idx = 'I0003';
	select * from cateTBL;
rollback;
commit;

s