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