/*
	: 블록 주석 
*/
-- : 한줄 주석

use BikeStores;
select * from sales.customers;
select * from production.products;

-- DB 조회 
EXEC sp_helpdb;
-- 테이블 조회
EXEC sp_tables @table_type = "'table'";
-- 열 이름 조회
EXEC sp_columns @table_name = 'stocks', @table_owner = 'production';