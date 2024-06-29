--1 List all the products in the "Product" table.
select * from Production.Product;

--2 Find all employees who have a job title of "Sales Representative".
select * from HumanResources.Employee where JobTitle = 'Sales Representative'

--3 Get all orders from the "SalesOrderHeader" table, sorted by order date in descending order.
select * from sales.SalesOrderHeader order by OrderDate desc;

--4 Show the product name and the product category for each product.
select Product.Name , ProductCategory.Name as Category
from Production.Product
JOIN Production.ProductCategory
ON ProductID is not NULL;

--4 in simpler solution
select Product.Name , ProductCategory.Name as Category
from Production.Product , Production.ProductCategory;

--5 List the total number of products in each product category.
SELECT pc.Name, COUNT(*) AS NoOfProducts
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory AS pc ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name;

--6 Retrieve the next 5 products after skipping the first 10 products, sorted by product name in ascending order.
select * from Production.Product 
order by Name asc 
offset 10 rows 
FETCH next 5 row only

--7 List all possible combinations of product names and sales territory names
select p.Name  , st.Name
from Production.Product as p, Sales.SalesTerritory as st
cross join Sales.SalesTerritory as SaleTerriority

--8 Find all orders with a total due between $50000 and $100000
select * from Sales.SalesOrderDetail where UnitPrice between 50000 and 100000

--9 Find all products whose names start with 'Bike'
select Name from Production.Product where Name like 'Bike%'

--10- Find products with a list price less than $100
select ProductID, Name, ListPrice from Production.Product where ListPrice < 100 order by ListPrice;

--11 Retrieve all sales orders along with the salesperson's name, even if
--some orders were not handled by a salesperson

SELECT so.SalesOrderID, so.OrderDate, p.FirstName, p.LastName
FROM Sales.SalesOrderHeader AS so
LEFT OUTER JOIN Sales.SalesPerson AS sp ON so.SalesPersonID = sp.BusinessEntityID
LEFT OUTER JOIN Person.Person AS p ON sp.BusinessEntityID = p.BusinessEntityID;

--12 Retrieve the top 5 most expensive products sorted by list price in descending order
select top 5  Name, Color, ProductNumber, ListPrice from Production.Product order by ListPrice desc

--13 Calculate total sales, average sales, the maximum and minimum sales order amounts, 
--and the total number of sales orders from the "SalesOrderHeader" table
select SUM(SalesOrderNumber) as sumofsale , 
AVG(SalesOrderNumber) as avgS , MAX(SalesOrderNumber) as maxS 
, MIN(SalesOrderNumber) as MinS from Sales.SalesOrderHeader

--14- Determine the average line total amount for all the items sold in each product category
SELECT pc.Name AS CategoryName, AVG(sod.LineTotal) AS AverageLineTotal
FROM Production.Product AS p
JOIN Sales.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
JOIN Production.ProductSubcategory AS psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory AS pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name;

