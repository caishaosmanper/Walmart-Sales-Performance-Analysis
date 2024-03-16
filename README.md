# Walmart-Sales-Performance-Analysis
This project aims to analyze Walmart sales data obtained from the Kaggle Walmart Sales Forecasting Competition. The goal is to gain insights into top-performing branches and products, sales trends across different product categories, and customer behaviour. By understanding these aspects, the project seeks to improve and optimize sales strategies.

### Purpose
The project aims to analyze sales data from the Walmart database to derive insights into sales performance, customer behavior, and product trends. By leveraging SQL queries, it seeks to facilitate informed decision-making and strategy optimization for Walmart's retail operations.

### About Data
The dataset was obtained from the [Kaggle](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting). This dataset is comprised of sales transactions from three distinct Walmart branches situated in Mandalay, Yangon, and Naypyitaw in Myanmar.

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| order_id              | The order ID of the sale               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(3)     |
| city                    | The location of the branch              | VARCHAR(25)    |
| customer_category       | The category of the customer            | VARCHAR(15)    |
| gender                  | Gender of the customer                  | VARCHAR(10)    |
| product_category        | Product category of the product         | VARCHAR(25)   |
| price              | The price of each product               | DECIMAL(12,2) |
| quantity                | The amount of the product sold          | INT            |
| tax                 | The amount of tax on the purchase       | DECIMAL(10,4)    |
| total                   | The total cost of the purchase          | DECIMAL(15,4) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_type                 | The method of transaction payment | VARCHAR(15) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(15,2) |
| gross_margin_percentage | Gross margin percentage                 | DECIMAL(12,10) |
| gross_income            | Gross Income                            | DECIMAL(12, 5) |
| rating                  | Rating                                  | FLOAT(2, 1)    |

### Approach Utilized

1. __Data Wrangling:__ The process of converting raw data into a usable form
> 1. Database construction
> 2. Table creation and data insertion
> 3. Identification of columns containing null values. Our database doesn't contain null values; during table creation, we enforced the __NOT NULL__ constraint for each field, effectively filtering out any null values.

2. __Feature engineering:__ This is the process of selecting, transforming, extracting, combining, and manipulating raw data to generate the desired variables for analysis 
> 1. Introduce a 'time_of_day' column for Morning, Afternoon, and Evening sales insights, aiding in identifying peak sales periods.
> 2. Add a 'day_name' column, extracting days of the week (Mon, Tue, Wed, Thur, Fri) for branch activity analysis, determining peak days.
> 3. Implement a 'month_name' column, extracting months (Jan, Feb, Mar) to analyze sales and profit trends by month, identifying peak periods.

3.__Exploratory Data Analysis (EDA):__ The process of exploring data is conducted to address the outlined questions and project objectives.
 __Business Inquiries that are Addressed__
+ __General Inquiries__
> 1. How many unique cities does the dataset have?
> 2. In which city is each branch located?

+ __Merchandise Inquiries__

> 3. How many unique product category are there and how much orders does each product category have?
> 4. What is the most selling product category and how much is it?
> 5. What is the total revenue for each month?
> 6. Which month had the largest cost of goods sold (COGS)?
> 7. What product category had the largest revenue?>
> 8. What is the city with the largest revenue?
> 9. What product category had the largest value-added tax (VAT)?
> 10. Retrieve each product category and include a column indicating whether the quantity sold is considered "Good" or "Bad", with "Good" being when the quantity sold exceeds the average sales.
> 11. Which branch sold more products than the overall average product sold?
> 12. What is the most common product category by gender?
> 13. What is the average rating within each product category?

+ __Customer Inquiries__  

> 14. How many unique customer category does the data have in total?
> 15. How many unique payment methods does the data have in total?
> 16. What is the most common customer category?
> 17. Which gender constitutes the majority of the customer base?
> 18. Which customer category purchases the most items?
> 19. What is the gender distribution per branch?
> 20. Which time of the day do customers give the most ratings?
> 21. Which time of the day do customers give the most ratings per branch?
> 22. Which day of the week has the best avg ratings?
> 23. Which day of the week has the best average ratings per branch?

+ __Sales Inquiries__

> 24. What is the number of transactions conducted during each time period for each day of the week?
> 25. Which of the customer category brings the most revenue?
> 26. Which city has the largest tax/VAT percent?
> 27. Which customer category pays the most in VAT?

### Code

For the rest of the code, click [here](https://github.com/caishaosmanper/Walmart-Sales-Performance-Analysis/blob/main/walmart_analysis.sql)

```sql
/*
SQL Script Purpose:
This SQL script contains queries for analyzing sales data from the Walmart database. 
It provides insights into sales performance, customer behavior, and product trends.

Author: Caisha Osman

*/

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
```
