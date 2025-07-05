create table Zepto(
Category_id serial not null,
Category varchar(50),
name varchar(100) not null,	
mrp integer,	
discountPercent	integer,
availableQuantity integer,
discountedSellingPrice	integer,
weightInGms	integer,
outOfStock boolean,	
quantity integer
);

select * from ZEPTO

--count of rows--
select count(*) from ZEPTO;

--sample data--
SELECT * FROM ZEPTO
LIMIT 10;

--null values--
SELECT * FROM ZEPTO
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--different product categories--
SELECT DISTINCT category FROM ZEPTO
ORDER BY category;

--products in stock vs out of stock--
SELECT outOfStock, COUNT(category_id)
FROM ZEPTO
GROUP BY outOfStock;

--product names present multiple times--
SELECT name, COUNT(category_id) AS "Number_Of_category_id"
FROM ZEPTO
GROUP BY name
HAVING count(category_id) > 1
ORDER BY count(category_id) DESC;



--products with price = 0--
SELECT * FROM ZEPTO
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM ZEPTO
WHERE mrp = 0;

--convert paise to rupees--
UPDATE ZEPTO
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM ZEPTO;

--data analysis

-- Q1. Find the top 10 best-value products based on the discount percentag--
SELECT * FROM ZEPTO
SELECT mrp,name,discountpercent from ZEPTO
ORDER BY discountpercent DESC
LIMIT 10;

--Q2.What are the Products with High MRP but Out of Stock--
SELECT  name,mrp FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

--Q3.Calculate Estimated Revenue for each category--
SELECT category,SUM(discountedsellingprice * availablequantity) AS TOTAL_REVENUE FROM ZEPTO
GROUP BY category
ORDER BY TOTAL_REVENUE DESC;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%--
SELECT DISTINCT category,mrp,discountpercent from ZEPTO
WHERE mrp>500 AND discountpercent <10
ORDER BY discountpercent DESC,mrp DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage--
SELECT * FROM ZEPTO;
SELECT category, ROUND(AVG(discountpercent),2) AS AVG_DISCOUNT_PERCENTAGE FROM ZEPTO
GROUP BY category
ORDER BY AVG_DISCOUNT_PERCENTAGE DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value--
SELECT name,discountedsellingprice,weightingms,ROUND((discountedsellingprice/weightingms),2) AS BEST_VALLUE FROM ZEPTO
WHERE weightingms>=100
ORDER BY BEST_VALLUE DESC;

--Q7.Group the products into categories like Low, Medium, Bulk--
SELECT DISTINCT  name,weightingms,
CASE
    WHEN weightingms <1000 THEN 'LOW'
	WHEN weightingms <5000 THEN 'MEDIUM'
	ELSE 'BULK' END AS WEIGHT_CATEGORIES
FROM ZEPTO;

--Q8.What is the Total Inventory Weight Per Category--
SELECT category,SUM(weightingms*availablequantity) AS Weight_Per_Category FROM ZEPTO
GROUP BY category
ORDER BY Weight_Per_Category;
