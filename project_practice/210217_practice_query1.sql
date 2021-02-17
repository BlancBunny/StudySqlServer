use BookRentalShopDB;
go

-- ȸ������ �ҷ����� (�̸���) 
select memberID, memberName, levels, mobile, email from memberTBL
	where levels <> 'S'
	order by levels desc, memberName;

-- å����
select cate_idx, bookTitle, bookAuthor, 
	interpreter, company, price
	from booksTBL
	order by price desc;

-- �ý��� �Լ���� ���� 
select	memberID, 
		concat(right(memberName, 2), ' ', left(memberName, 1)) as '�̱����̸�',
		dbo.ufn_getMemLevel(levels) as 'ȸ�����',		
		mobile, 
		upper(email) as '�̸���'
	from memberTBL
	where levels <> 'S'
		order by memberName;

-- å ����, �ý��� �Լ�, ���� �Լ� ����
SELECT book_idx
	,cate_idx
	,concat (N'å���� >', bookTitle) as bookTitle 
	,bookAuthor
	,isnull(interpreter, '���� ����') as 'interpreter'
    ,company
	,format(releaseDate, 'yyyy�� MM�� dd��') as 'releaseDate'
    ,format(price, '#,#��') as '����' 
  FROM booksTBL


-- å���� JOIN 
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


-- �뿩�� å�� ����	
SELECT r.rental_idx
	  ,m.memberName
	  ,b.bookTitle
      ,format(r.rentalDate, 'yyyy-MM-dd') as �뿩��
	  ,dbo.ufn_getState(r.rentalState) as ���
	FROM rentalTBL as r 
		right outer join memberTBL as m
		on r.member_idx = m.member_idx
		right outer join booksTBL as b 
		on r.book_idx = b.book_idx
		where r.rental_idx is null;
		
GO

-- ���� - intellisense - ���� ĳ�� ���ΰ�ħ (Ctrl + shift + R)