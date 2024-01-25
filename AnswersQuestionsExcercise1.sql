-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store

-- SQL QUERIES PRACTICE
SELECT * FROM Manufacturers;
SELECT * FROM Products;

-- Q1. Select the names of all the products in the store.
SELECT Name FROM Products;

-- Q2. Select the names and the prices of all the products in the store.
SELECT Name, Price FROM Products;

-- Q3. Select the name of the products with a price less than or equal to $200.
SELECT Name, Price FROM Products WHERE Price<=200;

-- Q4. Select all the products with a price between $60 and $120.
SELECT * FROM Products WHERE Price >= 60 AND Price <= 120;
SELECT * FROM Products WHERE Price BETWEEN 60 AND 120;

-- Q5. Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT Name, Price*100 as Cents FROM Products;

-- Q6. Compute the average price of all the products.
SELECT AVG(PRICE) as AVERAGE FROM Products;

-- Q7. Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(Price) FROM Products Where Manufacturer = 2;

-- Q8. Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) From Products WHERE Price >=100;

-- Q9. Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) FROM Products WHERE Price >= 180;

-- Q10. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT Name, Price FROM Products WHERE Price > 180 ORDER BY Price Desc, Name Asc;

-- Q11 Select all the data from the products, including all the data for each product's manufacturer.
SELECT a.*, b.name from Products a JOIN Manufacturers b on(a.manufacturer = b.code);
SELECT a.*, b.name FROM Products a, Manufacturers b WHERE a.manufacturer = b.code;

-- Q12 Select the product name, price, and manufacturer name of all the products.
SELECT a.Name, a.Price, b.name FROM Products a JOIN Manufacturers b ON(a.Manufacturer = b.code);

-- Q13 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(Price), Manufacturer FROM Products GROUP BY Manufacturer;

-- Q14. Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT AVG(a.Price) AS Price, b.Name 
FROM Products a JOIN Manufacturers b
ON a.manufacturer = b.code
GROUP BY b.Name; 

-- Q15. Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT AVG(a.Price), b.Name
FROM Manufacturers b JOIN Products a
ON  b.code = a.Manufacturer
GROUP BY b.name
HAVING AVG(a.Price)>=150; 

-- Q16. Select the name and price of the cheapest product.
select Name, Price FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products); 

-- Q17. Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT max_price_manufacturer.name AS ManufacturerName, max_price_manufacturer.price, product_name_manufacturer.name as product_name
from
	(
	SELECT Manufacturers.Name, MAX(Price) AS Price
    FROM
    Products, Manufacturers
    WHERE
    Manufacturer = Manufacturers.code
    GROUP BY Manufacturers.Name
	)
    AS max_price_manufacturer
LEFT JOIN
	(
    SELECT Products.*, Manufacturers.Name AS ManufacturerName
    FROM Products
    JOIN Manufacturers ON Products.Manufacturer = Manufacturers.code
    )
    AS product_name_manufacturer
ON
	max_price_manufacturer.Name = product_name_manufacturer.ManufacturerName
    AND max_price_manufacturer.price = product_name_manufacturer.price;
    
    
-- See the first subquery used, it prints the manufacturer name and its maximum price
SELECT Manufacturers.Name, MAX(Price) AS Price
    FROM
    Products, Manufacturers
    WHERE
    Manufacturer = Manufacturers.code
    GROUP BY Manufacturers.Name;
    
-- See the second query used, it prints the manufacturers code, manufacturer name, max price, Manufacturer from Product Table and Manufacturer name
SELECT Products.*, Manufacturers.Name AS ManufacturerName
    FROM Products
    JOIN Manufacturers ON Products.Manufacturer = Manufacturers.code;
    
    
-- Q18 Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO Products VALUES(11, 'Loud Speakers', 70, 2);
SELECT * FROM Products;

-- Q19. Update the name of product 10 to "Laser Printer".
UPDATE Products SET Name = "Laser Printer"
WHERE Code = 10;

-- Q20. Apply a 10% discount to all products.
UPDATE Products 
SET Price = Price*0.9;

-- Q21. Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE Products
SET Price = Price*0.9 
WHERE Price>=120;



