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

## PostgreSQL
- schema_tables.sql: Database and tables structure
- data_cleaning.sql: Date validation and insertion of data into the tables
- analysis_queries.sql: Data analysis queries

## Microsoft Power BI
- ecommerce_dashboard.pbix: Interactive Ecommerce Dashboard
- overview.png: Executive Overview page
- product_performance.png: Product Performance page
- profitability_analysis.png: Profitability Analysis page


# Repository Structure
ecommerce-sales-analysis-dashboard/
│
├── data/
│   ├── raw/
│   └── cleaned/
│
├── sql/
│   ├── schema_tables.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_analysis_queries.sql
│
├── python/
│   ├── messy_to_clean_utf8.ipynb
│   
├── dashboard/
│   ├── ecommerce-dashboard.
│   └── screenshots/
│
└── README.md

