-- find all products 
 SELECT * FROM products;
-- find all products that cost $1400
 SELECT * FROM products
 WHERE price = 1400;
-- find all products that cost $11.99 or $13.99
 SELECT * FROM products
 WHERE price = 11.99 or price = 13.99;
-- find all products that do NOT cost 11.99 - using NOT
 SELECT * FROM products
 WHERE NOT price = 11.99;
-- find  all products and sort them by price from greatest to least
 SELECT * FROM products
 order by price desc;
-- find all employees who don't have a middle initial
 select * from employees
Where middleinitial is null;
-- find distinct product prices
 select distinct(price) from products;
-- find all employees whose first name starts with the letter ‘j’
 select * from employees
 where FirstName LIke 'j%';
-- find all Macbooks 
 Select * from products
 Where name = 'Macbook';
-- find all products that are on sale
 Select * from products
 where onsale = 1;
-- find the average price of all products 
 select avg(price) from products;
-- find all Geek Squad employees who don't have a middle initial 
 select * from employees
 Where title = 'Geek Squad' and MiddleInitial is null;
-- find all products from the products table whose stock level is in the range  -- of 500 to 1200. Order by Price from least to greatest. **Use the between keyword** 
select * From products
Where stocklevel between 500 and 1200
Order by price asc;
-----------------------------------------------
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name, c.Name
 From products as p
 INNER JOIN categories AS c on C.CategoryID = P.CategoryID
 Where c.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating FROM products AS p LEFT JOIN reviews as r on r.ProductID = p.ProductID Where r.Rating = 5;

 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
Select e.firstname, e.lastname, sum(s.Quantity) as total from sales as s
INNER JOIN employees as e ON e.EmployeeID = s.EmployeeID
Group BY e.EmployeeID
Order by Total DESC
LIMIT 2;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
Select d.Name as 'Department Name', c.Name as 'Category Name' From departments as d
INNER JOIN categories as c ON c.DepartmentID = d.DepartmentID
Where c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
Select p.Name, sum(s.Quantity) as 'total sold', sum(s.Quantity * s.PricePerUnit) as 'total price'
From Products as p
INNER JOIN sales as s ON p.ProductID = s.ProductID
WHERE p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name as 'Product Name', r.Reviewer as 'Reviewer Name', r.Rating, r.Comment From products as p
INNER JOIN reviews as r ON p.ProductID = r.ProductID
Where p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, 
how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, sum(s.quantity) as TotalSold
FROM sales as s
INNER JOIN employees as e ON s.EmployeeID = e.EmployeeID
INNER JOIN products as p ON p.ProductID = s.ProductID
Group BY e.EmployeeID, p.ProductID
ORDER BY e.FirstName;