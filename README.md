# Walmart-Sales-Performance-Analysis
This project aims to analyze Walmart sales data obtained from the Kaggle Walmart Sales Forecasting Competition. The goal is to gain insights into top-performing branches and products, sales trends across different product categories, and customer behaviour. By understanding these aspects, the project seeks to improve and optimize sales strategies.

### Purpose
The project aims to analyze sales data from the Walmart database to derive insights into sales performance, customer behavior, and product trends. By leveraging SQL queries, it seeks to facilitate informed decision-making and strategy optimization for Walmart's retail operations.

### About Data
The dataset was obtained from the [Kaggle](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting). This dataset comprises sales transactions from three distinct Walmart branches situated in Mandalay, Yangon, and Naypyitaw in Myanmar.

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| order_id              | order is of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(3)     |
| city                    | The location of the branch              | VARCHAR(25)    |
| customer_category       | The category of the customer            | VARCHAR(15)    |
| gender                  | Gender of the customer                  | VARCHAR(10)    |
| product_category        | Product category of the product         | VARCHAR(25)   |
| price              | The price of each product               | DECIMAL(12,2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                 | The amount of tax on the purchase       | DECIMAL(10,4)    |
| total                   | The total cost of the purchase          | DECIMAL(15,4) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_type                 | The method of transaction payment | VARCHAR(15) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(15,2) |
| gross_margin_percentage | Gross margin percentage                 | DECIMAL(12,10) |
| gross_income            | Gross Income                            | DECIMAL(12, 5) |
| rating                  | Rating                                  | FLOAT(2, 1)    |








