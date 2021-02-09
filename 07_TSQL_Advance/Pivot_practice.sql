use sqlDB;
go


create table pivotTBL
(
	userName nvarchar(10),
	season nvarchar(2),
	amount int
);


insert into pivotTBL values ('±è¹ü¼ö', '°Ü¿ï', 10), 
							('À±Á¾½Å', '¿©¸§', 15),
							('±è¹ü¼ö', '°¡À»', 25),
							('±è¹ü¼ö', 'º½', 3),
							('±è¹ü¼ö', 'º½', 37),
							('À±Á¾½Å', '°Ü¿ï', 40),
							('±è¹ü¼ö', '¿©¸§', 14),
							('±è¹ü¼ö', '°Ü¿ï', 22),
							('À±Á¾½Å', '¿©¸§', 64);
go

select * from pivotTBL;

select * from pivotTBL
	pivot (sum(amount)
			for season
			in ([º½], [¿©¸§], [°¡À»], [°Ü¿ï])) as resultPivot; 

insert into pivotTBL values ('¼º½Ã°æ', '¿©¸§', 30);
