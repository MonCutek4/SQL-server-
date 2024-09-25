-- lấy tất cả sản phẩm 
select  [ProductName]
from [dbo].[Products];
--giá bán , số lượng , sản phẩm , số lượng 
select  [ProductName],[UnitPrice],[QuantityPerUnit]
from [dbo].[Products];
-- lấy ten quốc gia khách hàng đó 
select  [CompanyName],[Country]
from [dbo].[Customers];

select [CategoryName]
from dbo.Categories;


-- câu lênh si cồ 
-- tên cty sdt nhà cung cấp hàng 
select [CompanyName],[Phone]
from[dbo].[Suppliers]

-- lấy tất cả các cột 
select *
from [dbo].[Products];


--  lấy dl riêng biệt , ko trùng 
-- tên quốc giiai khác  nhau 
select distinct [Country]
from [dbo].[Customers];

-- lấy mã bưu điện khác nhay 

select distinct PostalCode 
from Suppliers;

-- họ , danh hiệu 
select distinct LastName, TitleOfCourtesy
from Employees;

-- select top  giới hạn số lượng dòng ( %) tra về khi gọi select 
-- 5 dòng đâu trong bản customers
select top 10 *
from Customers;

-- employees
-- lấy 30 phần trăm nhân viên 

select top 30 percent *
from Employees

-- mkh ko trùng 5 dòng dl đầu tiên 

select distinct top 5 CustomerID 
from Orders;


-- bí danh alias   AS 
-- láy company nâme = công ty , mã bưu diện 
select CompanyName as [tên công ty ],
		PostalCode as [mã bưu điện ],
		City "thành phố "
from Customers;

-- last nảme họ fisrt name tên 
select LastName "họ", FirstName "tên"
from Employees

-- lấy 15 dòng đầu tất cả cột oder 
-- tên thay thế o 
select top 15 o.*  
from Orders as o;
-- productname = tên sp
-- supplierlid = mã nhà cung cấp
-- categoryID = mã thể loại 
-- product = p 
-- top 5 
select top 5 ProductName "tên sp", SupplierID" mã nhà cung cấp ", CategoryID"mã thể loại"
from Products as p 

--nhỏ nhất / lớn nhất  
-- select min / select max 

select min(UnitPrice) as "min price"
from Products
-- ngày gần nhất 
-- từ bản oder 
select max(OrderDate) "max order date"
from Orders 

-- lấy mã tên số lượng tồn kho lớn nhât 
-- số lươg hàng tồn kho lớn nhất 
select  max(UnitsInStock) "hàng tồn kho lớn nhất "
from Products
--tuổi đời của nhân viên lớn nhất công ty 
select  min(BirthDate) "tuổi lớn nhất "
from Employees


-- count , sum , avg / đếm , tổng , tbinh 
-- đêm sl khác customer 
select COUNT (*) as"number of customer "
from Customers

--tổng tiền vận chuyển tất cả đơn đătj hàng 
select sum(Freight) as "sumfreight"
from Orders

-- trung bìng công số lượng đặc hàng 
select AVG (Quantity) as "avg Quantity"
from [Order Details]

-- tính tổng số lượng hàng tồn kho 
select count (*) as "numberof product ", sum(UnitsInStock) as "total " ,
avg(UnitPrice) as "avg"
from Products

select count (*) as "số lượng hàng "
from Orders 

select count (OrderID) as "cách 2 "
from Orders

-- order by 
-- sắp xếp kết quả trả về  của truy vấn 
-- asc  tăng dần , desc giảm dần  

-- liệt kê tất cả nahf cung cấp theo thứ tự tất cả đơn vị 
select *
from Suppliers
order by CompanyName ASC ; 

-- giảm dần tât cả sp 
select *
from Products
order by UnitPrice desc ;

-- liệt kê tất cả nhân viên theo thứ tự 
select *
from Employees
order by LastName  , FirstName  ;

--1 sp có số lượng bán cao nhât 
select top 1 *
from  [Order Details] 
order by Quantity desc;

select OrderID
from Orders
order by OrderDate Desc;

select ProductName, UnitPrice, UnitsInStock
from Products
order by UnitsInStock desc;

-- + , -  * , / , % chia lấy dư 

-- tính hàng tồn kho 
select ProductID, ProductName, (UnitsInStock-UnitsOnOrder) as "StokRemaining"
from Products

-- tính gtri chi tiết đơn hàng 
select  OrderID , ProductID, 
(UnitPrice*Quantity) as "ordet detailValue"
from [Order Details]

-- tính tỉ lệ giá vận chuyển 

select 
(AVG([Freight])/max([Freight])) as FreightRatio 
from Orders 
-- liệt kê tất cả các sp và giá sp giảm 10% 
select ProductID, ProductName,(UnitPrice*10)/100
as UniitPrice 
from Products

--truy vấn where
-- lộc dl <> khác  sắp xếp kết quả last name
select *
from Employees
where City='London'
order by lastName ASC;

-- giao muộn
select OrderID, RequiredDate, ShipAddress
from Orders
where ShippedDate > RequiredDate;


-- giao muộn
select count(*) AS "số đơn muôn"
from Orders
where ShippedDate > RequiredDate;

select *
from [Order Details]
where Discount>0.1;

-- bt 
select *
from Orders
where ShipCountry ='France' -- condition

-- and , or , not 
select *
from Products
where UnitsInStock < 50 or UnitsInStock > 100

select *
from Orders
where ShipCountry = 'Brazil'and RequiredDate < ShippedDate

select *
from Products
where UnitPrice >=100 and CategoryID =1

select *
from Products
where UnitPrice < 100 and CategoryID <> 1
--bt1
select *
from Orders
where Freight >= 50 and Freight <=100
--bt2
SELECT *
FROM Products
WHERE [UnitsInStock]>20 AND [UnitsOnOrder]<20;

-- between  trong 1 khoang nhất định 

select *
from Products
where UnitPrice between 10 and 20 

select  *
from Orders
where OrderDate between '1996-07-01' and '1996-07-31'

select  Sum (Freight) as "totalfreight july "
from Orders
where OrderDate between '1996-07-01' and '1996-07-31'

--bt1 
select *
from Orders 
where OrderDate between '1997-01-01' and '1997-12-31' AND ShipVia=3

-- like chuỗi 

 select *
 from Customers
 where Country like 'A%'

 select *
 from Orders
 where ShipCity like '%A%'

 select *
 from  Orders
 where ShipCountry like '%U%'

  select *
 from  Orders
 where ShipCountry like 'U_'

 select *
 from Suppliers
 where CompanyName like '%B%'

 -- wildcard   ký tự đại diện 

 select *
 from Customers
 where ContactName like 'A%' -- có không nhiều 

 select *
 from Customers
 where ContactName  like 'H_%'

 select *
 from Orders
 where ShipCity like 'L[u,o]%'

 
 select *
 from Orders
 where ShipCity like 'L[^u,o]%'

select OrderID, ShipCity
from Orders
where ShipCity like 'L[a-e]%'

select *
from Suppliers
where CompanyName like 'A%[^b]%'


-- in / not in 
-- lấy những đơn hàng theo đk 

select *
from Orders
where ShipCountry='Germany'

-- dùng in 

select *
from Orders
where ShipCountry in ('Germany','UK','Brazil')

select *
from Orders
where ShipCountry not in ('Germany','UK','Brazil')

-- not null , null 

select count (*)
from Orders
where ShippedDate is null 

select *
from Customers
where Region is null

-- group by  nhóm dl

select CustomerID , count(OrderID) as "total"
from Orders 
group by CustomerID

select SupplierID , AVG(UnitPrice)
from Products
group by SupplierID

select CategoryID, sum(UnitsInStock)
from Products
group by CategoryID


select ShipCountry, ShipCity, min(Freight) 
	,max(Freight)
from Orders
group by ShipCountry, ShipCity


-- day , month , year 

select CustomerID , count(*),
year(orderDate) as "year"
from Orders
where year ( OrderDate) =1997 
GROUP by CustomerID , year(orderDate)

-- having   condition( đúng sai ) 
-- khi guorp by phát sinh cột mới  phải dùng having chứ không dùng where

--ex 

select CustomerID, count (OrderId) as"totalOrder" 
from Orders
group by CustomerID
having count (OrderId) > 20 -- côt đã group by lại 
order by count (OrderId) DESC 

select SupplierID, sum( UnitsInStock) as " total UnitsINStock " ,avg( UnitPrice) as "AVG UnitPrice" 
from Products
group by SupplierID
having  sum( UnitsInStock)>30 and avg( UnitPrice) <50 

select MONTH(ShippedDate) as "Month ", sum(Freight) "total"
from Orders
where ShippedDate between '1996-07-01' and '1996-12-31'
group by MONTH(ShippedDate)
having sum(Freight) > 1000
order by MONTH(ShippedDate) ASC

select ShipCity, count (OrderID)
from Orders
group by shipCity 
having count (OrderID) >16
order by sum(OrderID) DESC

------------------------------------------------ÔN Tập-------------------------------------------------------

-- truy vấn dl table 
Select p.ProductID, p.ProductName,c.CategoryID,c.CategoryName
from Products "p", Categories "c"
where c.CategoryID=p.CategoryID     -- chung cái id  mới dùng chung đc 

select o.EmployeeID , count (o.OrderID) " total", e.LastName , e.FirstName
from Orders "o", Employees "e"
where o.EmployeeID = e.EmployeeID
group by o.EmployeeID , e.LastName , e.FirstName

--vd2
select c.CustomerID,c.CompanyName,c.ContactName,count (o.OrderID) "totalOrder", c.Country
from Customers "c" , Orders "o"
where c.CustomerID =o.CustomerID 
group by c.CustomerID,c.CompanyName,c.ContactName, c.Country
having c.Country ='uk'

select top 1 s.SupplierID,s.CompanyName, count(p.ProductID) "totalProducts "
from Products "p" , Suppliers "s"
where s.SupplierID=p.SupplierID
group by s.SupplierID,s.CompanyName 
order by count(p.ProductID) desc 

select o.OrderID,sum(od.UnitPrice*od.Quantity) "tổng tiền"
from Orders "o", [Order Details] "od"
where o.OrderID=od.OrderID
group by o.OrderID

-- vd 7 3 table 
select o.OrderID,e.LastName,e.FirstName, e.EmployeeID, sum(od.Quantity*od.UnitPrice) "tổng tiền "
from [Order Details] "od", Orders "o", Employees "e"
where od.OrderID = o.OrderID and o.EmployeeID = e.EmployeeID
group by o.OrderID,e.LastName,e.FirstName, e.EmployeeID


select o.OrderID,c.ContactName,s.CompanyName,o.ShipCountry,year(o.ShippedDate)"year"
from Orders "o" , Customers "c", Shippers "S"
where o.CustomerID=c.CustomerID and o.ShipVia= s.ShipperID and  
c.Country = 'UK' and year(o.OrderDate) = '1997'

 
 -- truy vấn dl từ nhiều bảng 
 --exercise 
 select count(OrderID) " number of orders", o.ShipCountry
 from Orders "o", Customers "c",Shippers "s" 
 where o.CustomerID=c.CustomerID and o.ShipVia=s.ShipperID
 and c.City <>'USA'
 group by o.ShipCountry
 having count(OrderID) >= 100 

 -- union / union all hợp 
 -- kết hợp kết quả 
 -- cùng số lượng cột ...cùng kiểu
 -- union all    tất cả
 select OrderID from [Order Details]
 where UnitPrice between 100 and 200
 union
 select orderID from [Order Details] 
 where Quantity in (10,20)

 -- union all ko co distinst 
 select OrderID from [Order Details] where UnitPrice between 100 and 200
 union all
 select OrderID   from [Order Details] where Quantity in (10,20)


 -- lấy tất cả quốc gia từ 2 table  suppliers và customer 
 select distinct  country  -- ko bị trùng lập 
 from Suppliers

 select distinct  country  
 from Customers

 -- union
 select distinct  country  -- ko bị trùng lập 
 from Suppliers
 union
 select distinct  country  
 from Customers
 --union all
 select distinct  country  -- ko bị trùng lập 
 from Suppliers
 union all
 select distinct  country  
 from Customers

 -- bài tập phân biêt

 select city , Country
 from Customers
 where Country like 'U%'
 union 
 select city , Country
 from Suppliers
 where city = 'London'
 union 
 select ShipCity, ShipCountry
 from  Orders
 where ShipCountry ='USA'

 -- câuk lênh join  / inner join 
 -- cùng kiểu 
 select c.CategoryID, c.CategoryName,p.ProductID,p.ProductName
 from Categories "c"
 inner join Products "p"
 ON c.CategoryID = p.CategoryID

  select c.CategoryID, c.CategoryName,count(p.ProductID) ,p.ProductName
 from Categories "c"
 inner join Products "p"
 ON c.CategoryID = p.CategoryID
 Group by c.CategoryID, c.CategoryName,p.ProductName


 select o.OrderID,c.CompanyName
 from Orders "o"
 inner join  Customers "c"    -- giao nhau lấy phần giao 
 on o.CustomerID = c.CustomerID
 -- trả về tất cả hàng khi có ít nhất 1 gtri ở cả 2 bảng 


 -- left join trả lại tất cả dòng bản chính  // lấy table đầu và phần giao //

 select c.CategoryID, c.CategoryName,p.ProductID,p.ProductName
 from Categories "c"
Left join Products "p"
 ON c.CategoryID = p.CategoryID

  select c.CategoryID, c.CategoryName,count(p.ProductID)
 from Categories "c"
 inner join Products "p"
 ON c.CategoryID = p.CategoryID
 group by c.CategoryID, c.CategoryName

  select c.CategoryID, c.CategoryName,count(p.ProductID)
 from Categories "c"
left join Products "p"   -- lấy tất 
 ON c.CategoryID = p.CategoryID
 group by c.CategoryID, c.CategoryName


 -- subquery 

 --liệt kê toàn bộ sp
 select ProductID, ProductName, UnitPrice
 from Products

 -- tìm giá tb của các sp
 select AVG (UnitPrice) "tb"
 from Products

 -- loc sp giá > giá tb 
 select ProductID, ProductName, UnitPrice
 from Products
 where UnitPrice > 28.4962
 -- câu lệnh lòngg vào trongg
 select ProductID, ProductName, UnitPrice
 from Products
 where UnitPrice > (
	 select AVG (UnitPrice) "tb"
	 from Products
 );


 -- loc ra nhung khach hàng co so don hàng > 10 
 select c.CustomerID,c.CompanyName, count(o.OrderID)
 from Customers "c"
 left join Orders "o"
 on c.CustomerID = o.CustomerID
 group by c.CustomerID,c.CompanyName
 having count(o.OrderID) >10

 --sub query 
 select *
 from Customers
	 where CustomerID in (
			 select CustomerID
			 from Orders 
			 group by CustomerID
			 having count(OrderID)>10
 )

 -- tính tổng tiền cho tuèng đơn hàng 
 select o.*,(
   select sum(od.Quantity* od.UnitPrice)
   from [Order Details] od
   where o.OrderID = od.OrderID
  -- Group by od.OrderID
 ) as "total"
 from Orders "o"
 

 -- loc ra tên sp và tong so don hàg của sp 
 select ProductName, totalOrders
 from (
	select p.ProductID , p.ProductName,(
		select count (*) 
			from [Order Details] od
			where od.ProductID = p.ProductID
	  ) as "totalOrders"
 from Products "p"
 ) AS temp;

 -- bt 
 select o.OrderID,
 (
	select count(*)
	from [Order Details] "od"
	where o.OrderID=od.OrderID
 ) as "total"
 from Orders "o"

 -- thứ tự thực thi 

 --select distinct 9 top 11 ,,8
 --from 1
 --full /L/R 4 outer join 2 on 3
 --where 5
 --group by 6
 --having 7
 --order by 10 

 select p.CategoryID, count(p.ProductName) as "totalProducts" --5
 from  Products "p" --1
 where p.CategoryID  in (1,2,3,4,5,6,7,8,9) -- 2
 group by p.CategoryID --3
 having count(p.ProductName) >=10 --totalProduct chưa tồn tại  -- 4
 order by totalProducts asc  -- 6 


 -- bt 
 select top 3  p.ProductID , o.Discount,o2.ShipCountry --9 --8
 from Products "p" -- 1
 inner join [Order Details] "o" --2
 on p.ProductID = o.ProductID	--3
 inner join Orders "o2"        --4
 on o.OrderID = o2.OrderID		--5
 where o.Discount=0.25 and o2.ShipCountry= 'Germany' --6
 order by p.CategoryID Desc; --7

 -- truy vấn csdl năng cao 
 -- CTE ( bảng tạm thời tạo ra trong qá trình truy vấn  )

 -- with 
with short_e as (
	select EmployeeID, LastName, FirstName
	from Employees
)
select * from short_e



--vd1 
 -- lấy thông tin

 select 
	OrderID, OrderDate,Freight,
	(select sum (Quantity*UnitPrice)
		from [Order Details] "od"
		where od.OrderID=o.OrderID
	) "totalPrice"
 from Orders "o";
 --CTE 
 with OrderTotals as(
	select OrderID, sum (od.Quantity*od.UnitPrice) as totalPrice
	from [Order Details] "od"
	group by OrderID
 )
 --otx as (
 --select OrderID, sum (od.Quantity*od.UnitPrice) as totalPrice
	--from [Order Details] "od"
	--group by OrderID
 --)
  select 
	o.OrderID, o.OrderDate,o.Freight, ot.totalPrice,
	ot.OrderID/o.Freight "Ratio"
from Orders "o" 
join OrderTotals "ot" on o.OrderID=ot.OrderID


---------------- Truy vấn đệ quy -----------------
-----------( lập lại gọi lại chính nó )-----------

-- cấu trúc câu lệnh 
--with CTE_ name (column1 , column2 ) as (
--	select 
--	from
--	where
--	union all
--	-- Recursive member 
--	select 
--	from
--	join CTE_name On
--	)
--	select 
--	from CTE_Name 


with fibo(prev_n) as (
--khởi tạo
	select 
	0 as prev_n ,
	1 as n 
	union all
	-- dệ quy 
	select	
		n as prev_n,
		prev_n+n as n 
	from fibo 
)
select * from fibo 
option (MAXRECURSION 5)
--1 1 2 3 5 8.....giai thừa pibolesi 
-- Sn=S(n-1)+S(n-2)


				----------------đệ quy --------------------

﻿-- Ví dụ
WITH bangTamThoi AS (
	SELECT [EmployeeID], [LastName], [FirstName]
	FROM [dbo].[Employees]
),
bangTamThoiSo2 AS (
	SELECT [ProductID]
	FROM [dbo].[Products]
)
SELECT *
FROM bangTamThoi;

-- Lấy thông tin về các sản phẩm (Products) có cùng thể loại với một sản phẩm cụ thể
WITH ProductCategory AS(
	SELECT [ProductName],[CategoryID]
	FROM [dbo].[Products]
	WHERE [ProductName]='Chai'
)
SELECT P.[ProductName],P.[CategoryID]
FROM [dbo].[Products] as P
JOIN ProductCategory as PC 
ON P.CategoryID=PC.CategoryID;


-- 
WITH OrderTotals AS ( 
	SELECT [OrderID], SUM([UnitPrice]*[Quantity]) AS TotalPrice
	FROM [dbo].[Order Details]
	GROUP BY [OrderID]
) 
SELECT od.[OrderID], od.[OrderDate], od.[Freight], ot.TotalPrice, ot.TotalPrice/od.Freight AS ratio
FROM [dbo].[Orders] od
JOIN OrderTotals ot ON od.OrderID=ot.OrderID;



----- 32 đệ quy 

﻿-- fibo
WITH fibo(prev_n, n) AS (
	-- khoi tao
	SELECT 
		0 as prev_n,
		1 as n

	UNION ALL
	-- de quy
	SELECT 
		n as prev_n,
		prev_n+n as n
	FROM fibo
)
SELECT * FROM fibo
OPTION (MAXRECURSION 5);
-- Sn=S(n-1)+S(n-2)
--0 1 1 2 3 5 8 ...

-- giaiThua
WITH giaiThua(stt, giaiThuaX) AS (
	-- khoi tao
	SELECT 
		1 as stt,
		1 as giaiThuaX

	UNION ALL
	-- de quy
	SELECT 
		stt+1 as stt,
	   (stt+1)*giaiThuaX as giaiThuaX
	FROM giaiThua
)
SELECT * FROM giaiThua
OPTION (MAXRECURSION 5);

--Sử dụng truy vấn đệ quy để tạo một cây cấu trúc quản lý của nhân viên trong bảng "Employees“.
--Trong đó “ReportsTo” chí là mã của người quản lý.
declare @EmployeeId int
set @EmployeeId=2;

WITH e_cte as (
	-- khoi tao
		SELECT	e.[EmployeeID], 
				e.FirstName+' '+e.LastName as Name,
				e.[ReportsTo] as ManagerId,
				0 as Level
		FROM [dbo].[Employees] e
		WHERE e.EmployeeID= @EmployeeId

		UNION ALL
	-- de quy
		SELECT
				e1.[EmployeeID], 
				e1.FirstName+' '+e1.LastName as Name,
				e1.[ReportsTo] as ManagerId,
				Level+1 as Level
		FROM [dbo].[Employees] e1
		JOIN e_cte ON e1.ReportsTo=e_cte.EmployeeID
)
SELECT * FROM e_cte
OPTION (MAXRECURSION 500);


						---------------------windown fution ----------------------------

								    	-- làm việc với 1 phần dl --- partition  (phân vùng )
--xếp hạng theo giá 
	select ProductID,ProductName,CategoryID, UnitPrice
	,rank() over (order by [UnitPrice] DESC) as Ranking 
	from Products

-- thể loại categoryid 
select ProductID,ProductName,CategoryID, UnitPrice
	,rank() over (Partition by [CategoryID] order by [UnitPrice] DESC) as Ranking 
	from Products

-- vd 3     dense_Rank ...ko bị mâts     row_number... ko trùng hạng     lag... trc đây 

-- nhóm lênh -- DML(thêm xóa sửa)
---  ( insert into , update , delete) 

--- DDL 
----  ( thay đổi kdl , kích cở , chuỗi biến , cấu trucs dl )
----- create table , alter table , drop table , create index, drop index, create constraint , drop constraint

--- DCL 
---( kiểm soát , truy cập vào csdl , cấp quyền , thu hồi quyền )
---Grant cấp quyền ,,, revoke thu hồi quyền truy câp

---TCL
---( quản lý giao dich bên trong csdl , ngân hàng   )
-- begin trannsaction , bắt đầu giao dịch 
-- comit trannsaction , xác nhânj giao dịch 
-- rollback transaction , hoàn tác 1 giao dịch 







