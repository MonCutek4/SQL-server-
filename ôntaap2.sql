---------------------bài tâp2 ---------------------
select  distinct od.ProductID, p.ProductName,s.CompanyName
from [Order Details] "od"
inner join Products "p"
on od.ProductID=p.ProductID
inner join Suppliers "s"
on p.SupplierID=s.SupplierID

--bt2
select o.OrderID, e.FirstName , e.LastName, c.CompanyName
from Orders "o"
left join Employees "e"
on o.EmployeeID=e.EmployeeID
left join Customers "c"
on o.CustomerID = c.CustomerID
