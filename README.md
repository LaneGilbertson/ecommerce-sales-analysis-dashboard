## E-Commerce Sales Analysis Dashboard
Kaggle Link: https://www.kaggle.com/datasets/vivek468/superstore-dataset-final 

# Project Overview
This project analyzes transactional e-commerce sales data to uncover insights related to revenue trends, product performance, customer behavior, and regional profitability.

The goal is to simulate a real-world business intelligence workflow by:

- Designing a relational database in PostgreSQL
- Cleaning and transforming raw sales data using SQL
- Creating analytical views and business queries
- Building an interactive Power BI dashboard
- Generating actionable business insights to improve revenue, optimize pricing strategies, and increase customer retention


# Business Objectives
- How are revenue and profits trending over time?
- Which products generate the most value?
- Which regions perform best?
- Who are the most valuable customers?
- How do discounts affect profitability?

# Skills Used
- SQL: Data modeling & analytical queries using PostgreSQL
- Python: Read with an encoder, removed non-breaking spaces, saved clean UTF-8 file using Jupyter Notebook
- Github: Project version control

## PostgreSQL
- schema_tables.sql: Database and tables structure
- data_cleaning.sql: Date validation and insertion of data into the tables
- analysis_queries.sql: Data analysis queries

## Microsoft Power BI
- ecommerce_dashboard.pbix: Interactive Ecommerce Dashboard
- executive_overview.png: Executive Overview page
- product_performance.png: Product Performance page
- profitability_analysis.png: Profitability Analysis page

## Database Design

### Schema Overview

The raw dataset was imported into a staging table and normalized into the following tables:

### customers

| Column |
|---------|
| customer_id |
| customer_name |
| segment |
| country |
| city |
| state |
| postal_code |
| region |

### products

| Column |
|---------|
| product_id |
| product_name |
| category |
| sub_category |

### orders

| Column |
|---------|
| order_id |
| order_date |
| ship_date |
| ship_mode |
| customer_id |

### order_items

| Column |
|---------|
| order_id |
| product_id |
| sales |
| quantity |
| discount |
| profit |

## Data Cleaning

The following cleaning steps were performed:

- Converted text dates to DATE format
- Removed duplicate customer records
- Normalized data into separate tables
- Applied primary and foreign key constraints
- Validated null values and data consistency

## SQL Analysis

Business analysis was performed using SQL queries including via analysis_queries.sql:

### Monthly Revenue
```SELECT 
DATE_TRUNC('month', order_date) AS "Month",
SUM(order_items.sales) AS "Monthly Revenue"
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY "Month"
ORDER BY "Month";
``` 

### Revenue by Region 
```SELECT 
customers.region AS "Region",
SUM(order_items.sales) AS "Region Revenue"
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY "Region"
ORDER BY "Region Revenue" DESC;
```

### Shipping Mode Performance 
```SELECT 
ship_mode AS "Shipping Mode",
AVG(ship_date - order_date) AS "Average Shipping time"
FROM orders
GROUP BY "Shipping Mode"
ORDER BY "Average Shipping time";
```

## Dashboard Overview

### Executive Overview

Tracks:

- Total Sales
- Total Profit
- Total Orders
- Profit Customers
- Sales by Category
- Sales by Segment
- Sales by Region
- Total Sales and Total Profit by Month
- Sales vs Profit by State and Region

![Executive Overview](dashboard/executive_overview.png)


![Executive Overview](dashboard/executive_overview.gif)

### Product Performance

Tracks:

- Products Sold
- Unique Products
- Average Profit per Product
- Total Sales and Total Profit by Category
- Total Sales and Total Profit by Segment
- Bottom 10 Products by Profit
- Sum of Sales and Profit by Product

![Product Performance](dashboard/product_performance.png)

![Product Performance](dashboard/product_performance.gif)

### Profitability Analysis

Tracks:

- Profit Margin
- Total Profit by Region
- Average Discount
- Average Selling Price
- Repeat vs One-Time Customers
- Customer Lifetime Value Scatterplot
- Total Sales and Total Profit vs Average Discount by Category

![Profitability Analysis](dashboard/profitability_analysis.png)

![Profitability Analysis](dashboard/profitability_analysis.gif)

## Key Insights

### Revenue
- The West region generated the highest sales at 33.9% of total revenue, indicating stronger market demand compared to other regions. This suggests future marketing and inventory investments may yield the greatest return in this market.
- Technology had a slight advantage over other sales categories at 36.4% of total revenue, serving as a primary driver of business growth.
- Month-to-month sales and profit indicated a stronger late Q3 and Q4 performance among the years, potentially incorporating seasonal promotional planning and opportunities could prove effective moving certain inventory.

### Product Performance
- Some categories generated strong sales but comparatively lower profit, suggesting margin pressures that may warrant pricing or discount strategy review.
- Several products generated negative profit despite producing sales revenue, suggesting repricing, reduced discounting, or discontinuation.
- Average profit per product revealed substantial differences in product profitability, emphasizing the importance of evaluating products based on profit rather than sales alone.

### Profitability
- The West region yielded the highest profit at 34.6% of total profit, making the region suitable for further marketing and inventory investments. 
- Categories with higher average discounts generally exhibited lower profit margins, indicating that aggressive discounting may be reducing overall profitability.
- A relatively small group of customers contributed a disproportionately large share of total revenue, suggesting opportunities for targeted retention and loyalty initiatives.

# Repository Structure
```ecommerce-sales-analysis-dashboard/
│
├── data/
│   ├── raw/
│       └── superstore_dataset_raw.csv
│   └── cleaned/
│       └── superstore_dataset_cleaned.csv
│
├── sql/
│   ├── schema_tables.sql
│   ├── 02_data_cleaning.sql
│   └── 03_analysis_queries.sql
│
├── python/
│   └── messy_to_clean_utf8.ipynb
│   
├── dashboard/
│   ├── ecommerce-dashboard.pbix
│   ├── executive_overview.png
│   ├── product_performance.png
│   ├── profitability_analysis.png
│   ├── executive_overview.gif
│   ├── product_performance.gif
│   ├── profitability_analysis.gif
│   └── ecommerce-dashboard.pbip
│
└── README.md
```

## Author
Lane Gilbertson

Aspiring Data Analyst with interests in:

- SQL
- Data Visualization
- Business Intelligence
- Analytics Engineering

LinkedIn: [www.linkedin.com/in/lane-gilbertson-1716983a9]

GitHub: [https://github.com/LaneGilbertson)]
