------------------------------------Ôn tập -------------------------------------
--bt1 
select CustomerID , count (OrderID) as "total Order"
from Orders
group by CustomerID
having  count (OrderID) >20
Order by  count (OrderID) DESC

--bt2
select EmployeeID   , count(orderID) "total orders "
from Orders
group by EmployeeID
having  count(orderID) >=100
Order by  count(orderID) DESC

--bt3 
select CategoryID, count(ProductID) as "tatol" 
from Products
--where 
group by CategoryID
having count(ProductID) >11
--order by 


--bt4 
select CategoryID, UnitsInStock as "total" 
from Products
where  UnitsInStock >50 
--order by 

select ShipCountry, count(*) as "total"
from Orders
where ShipCountry Like 'A%' or ShipCountry like 'G%'
group by ShipCountry
having count(*)>29


select count(orderID) as "số lượng " , ShipCity 
from Orders
where  ShippedDate between '1997-04-01' and '1997-08-31' 
group by ShipCity
having count(orderID) <> 1 and count(orderID) <> 2




