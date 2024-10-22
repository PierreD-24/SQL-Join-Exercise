/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name AS ProductName, categories.Name AS CategoryName
FROM products
INNER JOIN categories on categories.CategoryID = products.CategoryID
WHERE categories.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
Select products.Name AS ProductName, products.Price AS ProductPrice, reviews.Rating as ProductRating
FROM products
INNER JOIN reviews on reviews.ProductID = products.ProductID
WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS Total
FROM Sales
INNER JOIN employees on employees.EmployeeID = sales.EmployeeID
group by employees.EmployeeID
order by Total DESC 
LIMIT 5;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
FROM departments
INNER JOIN categories on categories.DepartmentID = departments.DepartmentID
where categories.Name = "Appliances" or categories.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name, sum(sales.Quantity) as 'Total Sold', Sum(sales.Quantity * sales.PricePerUnit) as 'Total Price'
 FROM products
 INNER JOIN sales on sales.ProductID = products.ProductID
 WHERE products.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
From products
Inner Join reviews on reviews.ProductID = products.ProductID
Where products.ProductID = 857 AND reviews.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, SUM(sales.Quantity) as TotalSold
FROM Sales
INNER JOIN employees on employees.EmployeeID = sales.EmployeeID
INNER JOIN products on products.ProductID = sales.ProductID
Group BY employees.EmployeeID, products.ProductID
ORDER BY TotalSold DESC;