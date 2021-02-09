select * from userTbl;
select * from buyTbl;

select * from buyTbl where userID = 'BBK';

select * from buyTbl inner join userTbl on buyTbl.userID = userTbl.userID;

select buyTbl.userID, userName, prodName, addr, mobile1+ '-' + left(mobile2, 4) + '-' + right(mobile2, 4) as [ฟฌถ๔รณ]
	from buyTbl inner join userTbl on buyTbl.userID = userTbl.userID;	

