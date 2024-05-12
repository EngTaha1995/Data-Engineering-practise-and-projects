--1 List all the products in the "Product" table.
select name from Production.Product;

--2 Find all employees who have a job title of "Sales Representative".
select * from Sales.SalesOrderHeader order by OrderDate desc;

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
