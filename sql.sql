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