-- tạo csdl 
CREATE DATABASE NVDB
ON
(	NAME = 'nvdb_data',
	FILENAME = 'C:\data\nvdb_data.mdf',
	SIZE =10MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB)
LOG ON
(	NAME = 'nvdb_log',
	FILENAME = 'C:\data\nvdb_log.ldf',
	SIZE =5MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5MB)

	--- tạo liên quan table 

CREATE TABLE [nhanvien](
	MaNV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Phai VARCHAR(10), -- chuỗi 
	NgaySinh DATE,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10)
);


-- các lệnh bổ sung khi tọa bảng 
-- identity : tự động tăng 
-- identity (seed, increment) tạo cột tự tăng với giá trị seed và increment 
--default : thiết lập giá trị măc định cho cột 
-- check ; thiết lập ràng buộc kiểm tra cho cột 
-- unique : thiết lập ràng buộc duy nhất cho côtj 



-- Tao Table khach hang
CREATE TABLE KhachHang(
	MaKH INT IDENTITY(100, 5) NOT NULL PRIMARY KEY,
	TenKH VARCHAR(50) NOT NULL,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10) CHECK (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

CREATE TABLE KhachHang_1(
	MaKH INT IDENTITY(100, 5) NOT NULL PRIMARY KEY,
	TenKH VARCHAR(50) NOT NULL,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10) CHECK (LEN(SDT)=10 AND PATINDEX('%[^0-9]%', SDT)=0)
	--                    độ dài           giới hạng     Regex in SQL
);

-- Thay doi
ALTER TABLE nhanvien
ADD Email VARCHAR(100); -- thêm


ALTER TABLE nhanvien
ALTER COLUMN HoTen VARCHAR(100);   -- cấu trúc dl 
--modify
ALTER TABLE nhanvien
ADD CONSTRAINT NgaySinhCheck CHECK (NgaySinh < GETDATE());
-- ràng buộc                                        -- ngày nay 
-- TRUNCATE va DROP
TRUNCATE TABLE KhachHang_1;-- xóa tất cả dl 

DROP TABLE KhachHang_1;-- xóa



----------------------------- insert into    "câu lệnh insert "----------------------------------------------



-- Thêm một khách hàng mới
INSERT INTO [dbo].[Customers]([CustomerID], [CompanyName], [ContactName], [Phone])
VALUES ('KH123', 'TITV.VN', 'Le Nhat Tung', '0123456789');

-- Thêm một khách hàng mới đầy đủ các cột
INSERT INTO [dbo].[Customers]
VALUES ('KH456', 'TITV.VN', 'Le Nhat Tung', '0123456789', '-', null, null, null, null, null, null);

-- Thêm nhiều khách hàng mới cùng lúc
INSERT INTO [dbo].[Customers]([CustomerID], [CompanyName], [ContactName], [Phone])
VALUES 
('KH124', 'TITV.VN', 'Le Nhat Tung', '0123456789'),
('KH125', 'TITV.VN', 'Le Nhat Tung', '0123456789'),
('KH126', 'TITV.VN', 'Le Nhat Tung', '0123456789'),
('KH127', 'TITV.VN', 'Le Nhat Tung', '0123456789');

-- Thêm một sản phẩm mới
INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock) 
VALUES ('New Product', 1, 2, '24 bottles', 10.99, 100);


----- selcet into --------(sao chép dl từ 1 bảng hiênj có )



-- Tạo ra bảng mới với các sản phẩm có giá >50;
SELECT *
INTO HighValueProducts  -- tên bảng mới 
FROM Products
WHERE [UnitPrice]>50;   -- điều kiện 

-- Tạo ra bảng mới với các đơn hàng được giao đến USA
SELECT *
INTO USAOrders
FROM [dbo].[Orders]
WHERE [ShipCountry] LIKE 'USA';

------------------------- delete -----------------------

SELECT *
INTO Customers_1
FROM Customers;

-- Xóa đi khách hàng 'ALFKI'
DELETE FROM [dbo].[Customers_1]
WHERE [CustomerID] LIKE 'ALFKI';



SELECT DISTINCT [Country] FROM [dbo].[Customers_1];
-- Xóa đi toàn bộ khách hàng có quốc gia
-- bắt đầu bằng 'U'
DELETE FROM [dbo].[Customers_1]
WHERE [Country] LIKE 'U%';


-- Xóa sạch 1 bảng
DELETE FROM [dbo].[Customers_1];

-- Câu hỏi:
-- DELETE FROM khác gì với TRUNCATE
-- xóa tất mất bảng --- xóa tất cả dl


----------------------update ----------------- ko anh hưởng khóa chính 

SELECT *
INTO Customers_1
FROM Customers;

-- Cập nhật thông tin của một khách hàng trong bảng Customers. 
-- Dưới đây là cách cập nhật địa chỉ của khách hàng có 
-- CustomerID là "ALFKI"
UPDATE [dbo].[Customers_1]
SET [Address]='New Address'
WHERE [CustomerID]='ALFKI';


-- 
SELECT *
INTO [dbo].[Products_1]
FROM [dbo].[Products]; 
-- Tăng giá toàn bộ sản phẩm lên 10%
UPDATE [dbo].[Products_1]
SET [UnitPrice]=[UnitPrice]+[UnitPrice]*0.1;

UPDATE [dbo].[Products_1]
SET [UnitPrice]=[UnitPrice]*110/100;

UPDATE [dbo].[Products_1]
SET [UnitPrice]=[UnitPrice]*1.1;

--Cập nhật thông tin của sản phẩm có ProductID 
--là 7 trong bảng Products để thay đổi tên sản 
--phẩm thành "Máy tính xách tay mới" 
--và cập nhật giá bán thành 999.99 đô la.
UPDATE [dbo].[Products_1]
SET [ProductName]='Máy tính xách tay mới', [UnitPrice]=999.99
WHERE [ProductID]=7;



--------------------------index (định vi truy cập nhanh )-----------------------
-- csdl của gg 
SELECT COUNT(*)
FROM [Sales].[SalesOrderDetail];



-- Bật hiển thị thống kê về tài nguyên I/O
SET STATISTICS IO ON;

-- Truy vấn
SELECT *
FROM [Sales].[SalesOrderDetail]
WHERE [CarrierTrackingNumber]='1B2B-492F-A9';

-- Bật hiển thị thống kê về tài nguyên I/O
SET STATISTICS IO OFF;



-- Tạo index cho [CarrierTrackingNumber]
CREATE INDEX idx_CarrierTrackingNumber 
ON [Sales].[SalesOrderDetail] ([CarrierTrackingNumber]);


-- view -- 

CREATE VIEW MothlySales AS
SELECT 
  YEAR([OrderDate]) as "Năm",
  MONTH([OrderDate]) as "Tháng",
  COUNT([OrderID]) as "Số lượng đơn hàng"
FROM
  [dbo].[Orders]
GROUP BY YEAR([OrderDate]), MONTH([OrderDate]);




										-----------T SQL ------ transact 





--- Stored Procedures -- trong sql 
-- T?o m?t stored procedure ?? l?y thông tin 
-- v? s?n ph?m d?a trên tên s?n ph?m ???c cung c?p.
CREATE PROCEDURE GetProductByName
	@ProductName NVARCHAR(100)
AS
BEGIN
	SELECT * FROM [dbo].[Products] P
	WHERE P.ProductName = @ProductName
END;

-- S? d?ng:
EXEC GetProductByName @ProductName='Chai';
EXEC GetProductByName @ProductName='Chang';
EXEC GetProductByName @ProductName='Ikura';

-- T?o m?t stored procedure ?? tính t?ng doanh s? bán hàng
-- c?a m?t nhân viên d?a trên EmployeeID.
CREATE PROCEDURE GetEmployeeSalesTotal
	@EmployeeId INT
AS
BEGIN
	SELECT SUM([UnitPrice]*[Quantity]) TotalSales
	FROM [dbo].[Orders] o
	JOIN [dbo].[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.EmployeeID=@EmployeeId
END

-- S? d?ng
EXEC GetEmployeeSalesTotal @EmployeeId=1;
EXEC GetEmployeeSalesTotal @EmployeeId=2;
EXEC GetEmployeeSalesTotal @EmployeeId=3;

-- T?o m?t stored procedure ?? thêm m?i khách hàng vào b?ng Customers.
CREATE PROCEDURE AddCustomer
	@CustomerID NVARCHAR(5),
	@CompanyName NVARCHAR(40),
	@ContactName NVARCHAR(30),
	@ContactTitle NVARCHAR(30)
AS
BEGIN
	INSERT INTO [dbo].[Customers]([CustomerID],[CompanyName],[ContactName],[ContactTitle])
	VALUES (@CustomerID, UPPER(@CompanyName), @ContactName, @ContactTitle)
END

EXEC AddCustomer @CustomerID='NEWN', @CompanyName='titv.vn', @ContactName='Tung Le',@ContactTitle='Mr.' 


-- T?o m?t stored procedure ?? c?p nh?t giá c?a t?t
-- cho m?t s?n ph?m c? th?
CREATE PROCEDURE IncreasePrice
	@ProductId INT,
	@PriceIncrease DECIMAL(10,2)
AS
BEGIN
	UPDATE [dbo].[Products]
	SET UnitPrice = UnitPrice + @PriceIncrease
	WHERE [ProductID] = @ProductId
END

EXEC IncreasePrice @ProductId=1, @PriceIncrease=100;



		   -------------------------------------TRigger -------------------------------------------------------
--trigger before : thực thi trc khi sự kiện xảy r a
-- trigger after : thực thi sau khi sửj kiện xẩy ra 
create trigger  makeproductnameuppercasse 
on Products 
after insert 
as 
begin 
	update Products
	set ProductName = Upper (i.ProductName)
	from inserted "i"
	where Products.ProductID = i.ProductID
end

INSERT [dbo].[Products]([ProductName], [SupplierID], [CategoryID])
VALUES ('test name', 1, 1)

-- chặn ko cho cập nhật sp =0 
update Products 
set Discontinued =-1
where ProductID =79

create trigger ban
on Products
For update
as
begin 
	if exists (select 1 from inserted where [discontinued] <0)
	begin
		rollback;
		raiserror('kodcbehibko',16,1);
	end 
end





--Viết một trigger trong cơ sở dữ liệu Northwind để đảm bảo 
-- rằng mỗi khi có một chi tiết đơn hàng mới được thêm vào, số lượng tồn kho phải được giảm đi
CREATE TRIGGER UpdateProductInventory
ON [dbo].[Order Details]
AFTER INSERT
AS
BEGIN
	UPDATE [dbo].[Products]
	SET [UnitsInStock] = [UnitsInStock]-(SELECT [Quantity] FROM inserted WHERE [dbo].[Products].ProductID = inserted.ProductID)
	WHERE [dbo].[Products].[ProductID] IN (SELECT [ProductID] FROM inserted)
END


INSERT INTO [dbo].[Order Details]([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount])
VALUES (10248, 78, 10, 50, 0);
