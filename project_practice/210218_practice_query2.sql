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

