-----------Sub query // nested query ---------------

select * 
from Orders "o"
where o.OrderDate = (
	select max(OrderDate) 
	from Orders 
);


-- đơn hàng ko ai mua 
select * 
from Products "p"
where p.ProductID not in (
	select distinct ProductID
	from [Order Details]
)


-- tìm thông tin đơn hàng , tên sp chưa đc giao 
select o.OrderID, p.ProductName
from Orders "o"
inner join [Order Details] "od"
on o.OrderID = od.OrderID
inner join Products "p"
on od.ProductID=p.ProductID
where o.OrderID in(
	select OrderID
	from Orders 
	where ShippedDate is null
)

--
select *
from Products "p"
where p.UnitsInStock >(
	select AVg (UnitsInStock)
	from Products
)

-- lấy thông tin về khách hàng có tông giá trị đơn hàng lớn nhất 

--select * from Customers;
--select * from [Order Details];
--select * from Orders;

select c.ContactName, o.OrderID, 
	(Select Sum(od.Quantity* od.UnitPrice)
	 From "Order Details" od
	Where o.OrderID = od.OrderID) as "Total"
from 
	Orders as o
inner join 
		Customers c on o.CustomerID = c.CustomerID
Group by 
		c.ContactName, o.OrderID
Order by 
		"Total" desc;
	-- 29 
