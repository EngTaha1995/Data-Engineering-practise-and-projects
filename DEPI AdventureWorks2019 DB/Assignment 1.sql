-- always make sure iam connected to the target database
use AdventureWorks2019;

--1 List all the products in the "Product" table.
select name from Production.Product;

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
select Product.Name , ProductCategoryID from Production.Product , Production.ProductCategory
group by ProductCategoryID -- okay, this may not be correct! i will take a break


--8 Find all orders with a total due between $50000 and $100000
select * from AdventureWorks2019.Sales.SalesOrderDetail --where order

--9 Find all products whose names start with 'Bike'
select Name from AdventureWorks2019.Production.Product where Name like 'Bike%'

--10- Find products with a list price less than $100
select ProductID, Name, ListPrice from AdventureWorks2019.Production.Product where ListPrice < 100;