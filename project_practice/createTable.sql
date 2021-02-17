use BookRentalShopDB;
go

create table memberTBL (
	member_idx		int identity(1,1)	not null primary key,
	memberName		nvarchar(50)		not null,
	memberID		varchar(20)			not null, 
	memberPW		varchar(250)		not null, 
	levels			char(1)				not null,
	mobile			varchar(20)			null,
	eMail			nvarchar(50)		null,
	address			nvarchar(200)		null,
	regDate			date				null,
	lastLoginDt		datetime			null,
	loginIpAddr		varchar(15)			null
);

create table booksTBL(
	book_idx		int identity(1,1)	not null primary key, 
	cate_idx		varchar(8)			not null,
	bookTitle		nvarchar(100)		not null,
	-- bookSubTitle	
	bookAuthor		nvarchar(100)		not null,
	interpreter		nvarchar(100)		null,
	company			nvarchar(100)		not null,
	releaseDate		date				not null,
	ISBN			varchar(13)			null,
	price			decimal(10,0)		null,
	descriptions	nvarchar(MAX)		null,
	regDate			date				null
);
alter table booksTBL add constraint FK_booksTBL_cateTBL 
	foreign key(cate_idx) references cateTBL.cate_idx;
	-- booksTBL�� cate_idx ������ cateTBL.cate_idx ���� �����ϴ� ���� ���� �߰�
	-- booksTBL : �ܷ�Ű, �ڽ�


create table cateTBL (
	cate_idx		varchar(8)			not null primary key,
	cateName		nvarchar(50)		not null
);

create table rentalTBL (
	rental_idx		int identity(1,1)	not null primary key,
	member_idx		int					not null,
	book_idx		int					not null,
	rentalDate		datetime			null,
	returnDate		datetime			null,
	rentalState		char(1)				null,	-- 1 : �뿩, 2 : �ݳ�, 3 : ��ü ���
);
alter table rentalTBL add constraint FK_rentalTBL_memberTBL
	foreign key(member_idx) references memberTBL.member_idx;
	-- rentalTBL ���̺� FK �������� �߰�
	-- rentalTBL�� member_idx �࿡�� memberTBL.member_idx �� ����


alter table rentalTBL add constraint FK_rentalTBL_booksTBL
	foreign key(book_idx) references booksTBL.book_idx;
	-- rentalTBL ���̺� FK �������� �߰� 
	-- rentalTBL�� book_idx �࿡�� booksTBL.book_idx �� ���� 


	

