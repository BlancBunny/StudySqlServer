select customer_id, first_name, last_name, phone, email, street, city, state, zip_code
	from BikeStores.sales.customers
	where last_name like 'S%' 
		and state = 'NY' 
		and phone is not null
	order by first_name;
		



declare @myVar1 int;
declare @myVar2 smallint, @myVar3 DECIMAL(5,2);
declare @myVar4 CHAR(20);

SET @myVar1 = 512315;
SET @myVar2 = 3;
SET @myVar3 = 4.25;
SET @myVar4 = '가수 이름==>';

select @myVar1;
select @myVar2+@myVar3;
select @myVar4, userName from userTbl where height > 180; 