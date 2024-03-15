-- Create the database
CREATE DATABASE IF NOT EXISTS walmartSales;

-- Create the table 
CREATE TABLE IF NOT EXISTs sales(
	order_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(3) NOT NULL,
    city VARCHAR(25) NOT NULL,
    customer_category VARCHAR(25) NOT NULL,
    gender	VARCHAR(10) NOT NULL,
    product_category VARCHAR(25) NOT NULL,
    price DECIMAL(12,2) NOT NULL,
    quantity INT NOT NULL,
    tax DECIMAL(10,4) NOT NULL,
    total DECIMAL(15,4) NOT NULL,
    date DATE NOT NULL,
	time TIME NOT NULL,
    payment_type VARCHAR(15) NOT NULL,
    cogs DECIMAL(15,2) NOT NULL,
    gross_margin_pct DECIMAL(12,10) NOT NULL,
    gross_income DECIMAL(12, 5) NOT NULL,
    rating FLOAT(2, 1) NOT NULL
);
    
-- --------------------------------------------------------------------
-- -------------------Feature Engineering------------------------------

-- Add time_of_day column
ALTER TABLE sales
ADD COLUMN time_of_day varchar(9);

UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "morning"
        WHEN `time` BETWEEN "12:01:00" AND "18:00:00" THEN "afternoon"
        ELSE "evening"
    END
);

-- Add a day_name column
ALTER TABLE sales
ADD COLUMN day_name varchar(9);

UPDATE sales
SET day_name = DAYNAME(date)
;

-- Add a month_name column
ALTER TABLE sales
ADD COLUMN month_name varchar(8);

UPDATE sales
SET month_name = MONTHNAME(date);

-- Preview table
SELECT * from sales;


-- --------------------------------------------------------------------
-- -------------------- Generic Questions------------------------------

-- Q1. How many unique cities does the dataset have?

SELECT DISTINCT 
		city 
FROM sales;


-- Q2. In which city is each branch located?

SELECT DISTINCT 
	city, branch 
FROM sales
Order by 2
;

-- --------------------------------------------------------------------
-- ------------------ Merchandise Questions ---------------------------

-- Q3. How many unique product category are there and how much orders does each product category have?

SELECT DISTINCT 
		product_category,
        count("order_id") as product_cat_count
FROM sales
Group by 1
Order by 2 desc;

-- Q4. What is the most selling product category and how much is it?

SELECT
	sum(quantity) as qty,
    product_category
FROM sales
Group by 2
Order by 1 desc;

-- Q5. What is the total revenue for each month?

SELECT 
	month_name as month, 
	sum(total) as total_revenue
FROM sales
Group by 1
Order by 2;

-- Q6. Which month had the largest cost of goods sold (COGS)?
SELECT
	month_name as month,
    SUM(cogs) as cogs
FROM sales
Group by 1
Order by 2;

-- Q7. What product category had the largest revenue?
SELECT
	product_category,
    SUM(total) as total
FROM sales
Group by 1
Order by 2;

-- Q8. What is the city with the largest revenue?
SELECT
	city,
    branch,
    SUM(total) as total
FROM sales
Group by 1, 2
Order by 3 desc;

-- Q7. What product category had the largest value-added tax (VAT)?

SELECT
	product_category,
    SUM(tax) as total
FROM sales
Group by 1
Order by 2 desc;

-- Q8. Retrieve each product category and include a column indicating whether 
-- the quantity sold is considered "Good" or "Bad", with "Good" being when the 
-- quantity sold exceeds the average sales.

WITH avg_query AS (
	SELECT 
    AVG(quantity) as avg_sales 
    FROM sales
    )

SELECT 
	s.product_category,
	AVG(s.quantity) as avg_quantity,
CASE 
	WHEN AVG(s.quantity) > (SELECT avg_sales FROM avg_query) THEN "GOOD"
    ELSE "BAD"
    END AS query_
FROM sales s
GROUP BY s.product_category;

-- Q9. Which branch sold more products than the overall average product sold?

SELECT 
	branch,
    SUM(quantity) as sum_quantity
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- Q10. What is the most common product category by gender?

SELECT 
	product_category,
    count(product_category) AS count_cat,
    gender
FROM sales
GROUP BY gender, product_category
ORDER BY count_cat desc;

-- Q11. What is the average rating within each product category?

SELECT 
	product_category,
    ROUND(AVG(rating),2) as avg_rating
FROM sales
GROUP BY 1
ORDER BY 2 desc;


-- --------------------------------------------------------------------
-- ------------------ Customer Questions ------------------------------

-- Q12. How many unique customer category does the data have in total?

SELECT DISTINCT
	customer_category
FROM sales;

-- Q13. How many unique payment methods does the data have in total?

SELECT DISTINCT
	payment_type
FROM sales;

-- Q14.  What is the most common customer category?

SELECT
	customer_category,
    count(customer_category) as customer_type
FROM sales
GROUP BY 1
ORDER BY 2 desc;

-- Q15. Which gender constitutes the majority of the customer base?

SELECT 
	gender,
    COUNT(*) as gender_count
FROM sales
GROUP BY 1
ORDER BY 2 desc;
	
-- Q16. Which customer category purchases the most items?

SELECT 
	customer_category,
    COUNT(quantity) as purchase_amount
FROM sales
GROUP BY 1
ORDER BY 2 desc;

-- Q17. What is the gender distribution per branch?

SELECT 
	branch,
	COUNT(CASE WHEN gender = "Female" THEN 1 END) as female_count,
	COUNT(CASE WHEN gender = "Male" THEN 1 END) as male_count
FROM sales
GROUP BY 1
ORDER BY 1;

    

-- Q18. Which time of the day do customers give the most ratings?

SELECT 
	time_of_day,
    COUNT(rating)
FROM Sales
GROUP BY 1
ORDER BY 2 desc;
    
-- Q19. Which time of the day do customers give the most ratings per branch?

SELECT 
    branch,
    time_of_day,
    COUNT(rating) AS rating_count
FROM Sales
GROUP BY branch, time_of_day
ORDER BY branch, rating_count desc
;

-- Q20. Which day of the week has the best avg ratings?

SELECT 
	day_name,
    AVG(rating) as avg_rating
FROM sales
GROUP BY day_name
ORDER BY 2 desc;

-- Q21. Which day of the week has the best average ratings per branch?
SELECT 
	branch,
	day_name,
    AVG(rating) as avg_rating
FROM sales
GROUP BY 1,2
ORDER BY 1,3 desc;

-- --------------------------------------------------------------------
-- ----------------------Sales Questions ------------------------------

-- Q22. What is the number of transactions conducted during each time
-- period for each day of the week?

SELECT 
	day_name,
	time_of_day,
    COUNT(time_of_day) as total_sales
FROM sales
GROUP BY 1,2
ORDER BY 1,3 desc;
    
-- Q23. Which of the customer category brings the most revenue?

SELECT 
	customer_category,
    SUM(total) as revenue
FROM sales
GROUP BY 1
ORDER BY 2 desc;
    
-- Q24. Which city has the largest tax/VAT percent?

SELECT 
	city,
    ROUND(AVG(TAX), 2) as vat_pct
FROM sales
GROUP BY 1
ORDER BY 2 desc;

-- Q25. Which customer category pays the most in VAT?

SELECT 
	customer_category,
    ROUND(AVG(TAX), 2) as vat_pct
FROM sales
GROUP BY 1
ORDER BY 2 desc;


-- --------------------------------------------------------------------
-- ----------------------------END ------------------------------------