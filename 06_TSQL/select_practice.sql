use sqlDB;
go 

-- �̸��� ���ȣ�� ����� ��� ���� ��ȸ 
select * from userTbl
  	where userName='���ȣ';

-- 1970�� ���� ����̸鼭, Ű 182 �̻��� ����� ���̵�� �̸� ��ȸ 
select userID, userName from userTbl
	where birthyear >= 1970 and height >= 182; 

-- 1970�� ���� ����̰ų�, Ű 182 �̻��� ����� ���̵�� �̸� ��ȸ 
select userID, userName from userTbl
	where birthyear >= 1970 or height >= 182; 

-- Ű 180 �̻� 183 ������ ����� ���̵�, �̸�, Ű ��ȸ 
select userID, userName, height from userTbl
	where height >= 180 and height <= 183;

select userID, userName, height from userTbl
	where height between 180 and 183; -- between ~ and Ȱ��

-- ������ �泲, ����, ����� ����� ���� 
select userName, addr from userTbl
	where addr='�泲' or addr='����' or addr='���'; 

select userName, addr from userTbl
	where addr IN('�泲', '����', '���');  -- IN() Ȱ�� 

-- ���� �达�� ����� �̸��� Ű ��ȸ 

select userName, height from userTbl
	where userName like '��%';    -- ������ 

select userName, height from userTbl
	where userName like '_����';  -- �ѱ��� 
