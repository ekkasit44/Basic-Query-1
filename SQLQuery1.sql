--Student ID
--Student Name

-- *********แบบฝึกหัด Basic Query #1 ***************
--1. แสดงข้อมูลสินค้า 10 รายการแรก
select Top 10 * 
from Products;

--2. จงแสดงข้อมูล รหัสพนักงาน ชื่อ นามสกุล ของพนักงานทุกคน
select EmployeeID,FirstNAme,LastName
from Employees;

--3. แสดงรหัสพนักงาน ชื่อและนามสกุลต่อกัน อายุ ของพนักงานแต่ละคน
select EmployeeID, (FirstName+ space(3)+ LastName) as EmployeeName,
		year(getdate())- year (birthdate) as Age	
From Employees;

/*4. แสดงข้อมูลรหัสสินค้า ชื่อสินค้า ราคาต่อหน่วย จำนวนคงเหลือ รหัสประเภทสินค้า
จัดเรียงข้อมูลตามรหัสประเภทสินค้า จากน้อยไปหามาก และจำนวนคงเหลือจากมากไปหาน้อย */

select ProductID,ProductName, UnitPrice,UnitsInStock,CategoryID
from products;
order by CategoryID ASC ,UnitsInStock Desc;

--5. แสดงจำนวนรายการสินค้าที่จัดอยู่ในประเภทสินค้ารหัส 1
select count(*) as จำนวนสินค้า 
from products
where categoryid = 1;

--6. แสดงจำนวนลูกค้าที่อยู่ในประเทศสหรัฐอเมริกา

select count(*) AS customer_count
from Customers
where Country = 'USA';


--7. แสดงจำนวนใบสั่งซื้อที่จัดส่งไปยังประเทศฝรั่งเศส ในปี 1997
select count(*) AS Numorder 
from orders
where shipcountry = 'France' AND year (shippedDate) = '1997';

--8. แสดงราคาต่อหน่วยของสินค้าที่แพงสุด และถูกที่สุด
select Max(UnitPrice) AS Max_Price, Min(UnitPrice) AS Min_Price
from Products;


select * 
From  Products
Where UnitPrict = (Select MAX(UnitPrice) from Products)

--9. จงแสดงอายุของพนักงานที่มากสุดและอายุน้อยสุด
select
 MAX(year(getdate()) - Year (Birthdate)) AS MAX_age,
	MIN(year(getdate()) - year (Birthdate)) AS MIN_age

from Employees;


--10. แสดงรหัสสินค้า ราคาต่อหน่วย จำนวนที่ซื้อ ราคารวม ของรายการสั่งซื้อที่อยู่ในใบสั่งซื้อหมายเลข10248
SELECT 
    ProductID,
    UnitPrice,
    Quantity,
    (UnitPrice * Quantity * (1 - Discount)) AS TotalPrice
FROM [Order Details]
WHERE OrderID = 10248;



--11. แสดงยอดสั่งซื้อรวมของใบสั่งซื้อหมายเลข 10248
select SUM(UnitPrice * Quantity) AS TotalPrict
From [order Details]
Where orderid = 10248;

--12. แสดงอายุเฉลี่ยของพนักงาน
SELECT AVG(DATEDIFF(YEAR, BirthDate, GETDATE())) AS average_age
FROM Employees;


--13. แสดงรหัสประเภทสินค้าและจำนวนรายการสินค้าในแต่ละประเภท
select categoryid, count(*) as product_count
from products
group by categoryid;

/*14. แสดงรหัสประเภทสินค้าและจำนวนรายการสินค้าในแต่ละประเภท 
เฉพาะประเภทสินค้าที่มีรายการสินค้าอยู่ในประเภทนั้น 10 รายการขึ้นไป */
select categoryid, count(*) as product_count
from products
group by categoryid
having count(*) >= 10;

--15. แสดงชื่อประเทศและจำนวนลูกค้าที่อยู่ในแต่ละประเทศ เฉพาะประเทศที่มีลูกค้าไม่ถึง 5 ราย
select country, count(*) as customer_count
from customers
group by country
having count(*) < 5
order by customer_count asc, country;

/*16. แสดงรหัสใบสั่งซื้อและยอดสั่งซื้อรวมในแต่ละใบสั่งซื้อ เฉพาะใบสั่งซื้อที่มียอดสั่งซื้อรวมเกิน $10000
จัดเรียงข้อมูลตามยอดสั่งซื้อรวมจากมากไปหาน้อย */
SELECT 
    OrderID,
    SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalAmount
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(UnitPrice * Quantity * (1 - Discount)) > 10000
ORDER BY TotalAmount DESC;



