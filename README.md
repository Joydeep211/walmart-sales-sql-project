# Walmart Sales Analysis Project

A comprehensive SQL-based analytical project focused on exploring store performance, weekly sales behavior, markdown effects, fuel price trends, and external feature correlations using the Walmart dataset.

## Overview
This project demonstrates structured problem-solving using SQL by answering 40 real-world business questions based on Walmart’s retail dataset. It showcases solid intermediate SQL competency, focusing on joins, aggregations, date operations, CASE classifications, and analytical query design.

The aim of the project is to show hands-on skill in:
- Writing clean and optimized SQL queries
- Understanding retail data dynamics,relationships across multiple tables (stores, features, train)
- Writing clean, efficient, and logically structured SQL queries
- Applying analytical reasoning to derive insights from real data

## Dataset Description
The project uses three core tables:

### **1. stores**
| Column | Description |
|--------|-------------|
| Store (PK) | Unique store identifier |
| Type | Store type category (A/B/C etc.) |
| Size | Physical store size in square feet |

### **2. features**
| Column | Description |
|--------|-------------|
| Store | Store ID (FK) |
| Date | Calendar date |
| Temperature | Temperature value for the week |
| Fuel_Price | Fuel price per gallon |
| MarkDown1-5 | Markdown-related promotional features |
| CPI | Consumer price index |
| Unemployment | Weekly unemployment rate |

### **3. train(sales)**
| Column | Description |
|--------|-------------|
| Store | Store ID (FK) |
| Dept | Department number |
| Date | Calendar date |
| Weekly_Sales | Total weekly sales amount |
| IsHoliday | Boolean flag for holiday week |

## Project Objectives
- Identify store-level performance trends
- Compare holiday vs. non-holiday behavior
- Evaluate the impact of markdown strategies
- Analyze relationships between economic indicators and sales
- Practice writing analytical SQL in real datasets

## Skills Demonstrated
- Intermediate SQL queries
- SQL Joins, GROUP BY with aggregations (SUM, AVG, COUNT, MAX, MIN) , Date extraction and transformation (EXTRACT(YEAR), EXTRACT(MONTH))
- Complex filtering with WHERE and logical conditions
- CASE statements for categorization
- Structured query development for business insights
- Working with retail analytics metrics
- Problem-solving and analytical thinking across 40 real-world questions

## Sample Insights
- Stores with larger square footage show consistent sales stability
- Holiday weeks produce 10–15% higher revenue on average
- Markdown3 often correlates with noticeable uplift in weekly sales
- Fuel price variations have limited direct impact on short-term sales

## Project Structure
```
├── dataset/
│   ├── stores.csv
│   ├── features.csv
│   ├── train.csv
├── queries/
│   ├── question_01.sql
│   ├── question_02.sql
│   ├── ...
│   └── question_40.sql
└── README.md
```

## How to Use
1. Clone this repository:
```bash
git clone https://github.com/Joydeep211/walmart-sales-sql-project.git

```
2. Import datasets into MySQL or PostgreSQL
3. Run each SQL file inside the `queries/` folder for detailed solutions
4. Modify queries to explore deeper insights or create dashboards

## Tool Used

- PostgreSQL
- pgAdmin 4 


## Future Enhancements
- Add Power BI dashboard
- Add EDA notebook in Python (Pandas, Matplotlib)
- Optimize queries using indexing strategies

## Author
Joydeep Dey
Data Analytics Enthusiast

---
A fully hands-on project created to demonstrate real-world SQL problem-solving and analytical thinking.
