# Walmart Sales Analysis Project

A comprehensive SQL-based analytical project focused on exploring store performance, weekly sales behavior, markdown effects, fuel price trends, and external feature correlations using the Walmart dataset.

## Overview
This project demonstrates structured problem-solving using SQL across 40 curated questions. It covers intermediate to advanced query design, including joins, window functions, aggregations, date operations, and performance-oriented thinking.

The aim of the project is to show hands-on skill in:
- Writing clean and optimized SQL queries
- Understanding retail data dynamics
- Interpreting business metrics
- Applying analytical reasoning to real-world datasets

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
- Intermediate and advanced SQL queries
- Window functions (RANK, LAG, LEAD)
- Date manipulation & filtering
- Aggregations and statistical calculations
- CTEs for modularized query logic
- Data profiling and data validation

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
