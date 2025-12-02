-- SECTION 1

-- Count total rows in the train table.

SELECT COUNT(*) as total_rows
FROM train

-- Count total rows in the features table.

SELECT COUNT(*) as total_rows
FROM features

-- Count how many stores exist in the stores table.

SELECT COUNT(DISTINCT store) as total_stores
FROM stores

-- Show the first 10 rows from the train table.
SELECT*FROM train LIMIT 10

-- Show distinct store numbers from the train table.

SELECT DISTINCT store 
FROM train 


-- SECTION 2 — STORE LEVEL ANALYSIS

--6) Count how many rows each store has in the train table.

select store,count(*) 
FROM train
GROUP BY store;


--7) Which store has the highest number of rows?

select store, count(*) as highest_no_rows
FROM train
GROUP BY store
ORDER BY highest_no_rows 
DESC LIMIT 1;


--8) Show total weekly sales for each store.

SELECT store,SUM(weekly_sales) as total_weekly_sales
FROM train
GROUP BY store


--9) Show average weekly sales for each store.

SELECT store,ROUND(AVG(weekly_sales),2) as avg_weekly_sales
FROM train
GROUP BY store
ORDER BY avg_weekly_sales


--10) Show minimum and maximum weekly sales for each store

SELECT 
	store,
	MAX(weekly_sales) as max_weekly_sales,
	MIN(weekly_sales) as min_weekly_sales
FROM train
GROUP BY store

-- SECTION 3 — TIME ANALYSIS (NO window functions)

--11) Show total weekly sales year-wise (extract year from Date).

SELECT
	TO_CHAR(date,'YYYY') as years,
	SUM(weekly_sales) as total_weekly_sales
FROM train
GROUP BY TO_CHAR(date,'YYYY')
ORDER BY years

--12) Show total weekly sales month-wise (1–12).

SELECT 
	TO_CHAR(date,'YYYY-MM') as year_month,
	SUM(weekly_sales) as total_weekly_sales 
FROM train
GROUP BY TO_CHAR(date,'YYYY-MM')
ORDER BY year_month


--13) Show total weekly sales for each date sorted newest → oldest.

SELECT 
    date,
    SUM(weekly_sales) AS total_weekly_sales
FROM train
GROUP BY date
ORDER BY date DESC;


-- 14) Show total weekly sales on holiday vs non-holiday days.

SELECT isholiday, SUM(weekly_sales) as total_sales
FROM train
GROUP BY isholiday


-- SECTION 4 — DEPARTMENT ANALYSIS

--15) Count how many departments each store has.

SELECT store,Count(DISTINCT dept) as No_Of_Departments
FROM train
GROUP BY store


--16) Show total weekly sales for each department.

SELECT dept,SUM(weekly_sales) as sum_sales
FROM train
GROUP BY dept


--17) Which department has the highest sales overall?

SELECT dept,SUM(weekly_sales) as sum_sales
FROM train
GROUP BY dept
ORDER BY sum_sales DESC LIMIT 1


--18) Which store–department combination has the highest sales?

SELECT Store, Dept,SUM(weekly_sales) as sum_sales
FROM train
GROUP BY Store, Dept
ORDER BY sum_sales DESC LIMIT 1


-- SECTION 5 — FEATURES TABLE ANALYSIS

--19) Show the average Temperature for each store.

SELECT 
	store,
	ROUND(AVG(temperature),2) as Avg_Temperature
FROM features
GROUP BY store
ORDER BY store

--20) Show the average Fuel Price per year.

SELECT 
	TO_CHAR(date,'YYYY') as year,
	ROUND(AVG(fuel_price),2) as Avg_fuel_price
FROM features
GROUP BY TO_CHAR(date,'YYYY')
ORDER BY year

--21) Show the average CPI per year.

SELECT 
	TO_CHAR(date,'YYYY') as year,
	ROUND(AVG(cpi),2) as Avg_cpi
FROM features
GROUP BY TO_CHAR(date,'YYYY')
ORDER BY year


--22) Show the average Unemployment rate per year.

SELECT 
	TO_CHAR(date,'YYYY') as year,
	ROUND(AVG(unemployment),2) as avg_unemployment_rate
FROM features
GROUP BY TO_CHAR(date,'YYYY')
ORDER BY year

-- SECTION 6 — JOINS 

--23) Join train + stores, and show: Store, Dept, Weekly_Sales, Type, Size.

SELECT
	t.store,
	t.dept,
	t.weekly_sales,
	s.type,
	s.size
FROM train as t
JOIN stores as s
ON t.store=s.store

--24) Join train + features to show Weekly Sales + Fuel Price + Temperature.

SELECT 
	f.store,
	f.temperature,
	f.fuel_price,
	t.weekly_sales
FROM features as f
JOIN train as t
ON f.store=t.store AND f.date=t.date


--25) Show total weekly sales by Store Type (A/B/C).

SELECT 
	s.type, 
	SUM(t.weekly_sales) as total_weekly_sals
FROM stores as s
JOIN train as t
ON s.store=t.store
GROUP BY s.type


--26) Compare average weekly sales for large stores vs small stores


SELECT
	CASE
		WHEN s.size>126512 THEN 'Large Store'
		ELSE 'Small store'
		END AS size_category,
		ROUND (AVG(t.weekly_sales),2) as avg_weekly_sales
FROM train as t
JOIN stores as s
ON t.store=s.store
GROUP BY size_category



--27) Show total weekly sales for each Store + Type combination.

SELECT 
	s.store,
	s.type,
	SUM(weekly_sales) as Total_weekly_sales
FROM stores as s
JOIN train as t
ON s.store = t.store
GROUP BY s.type,s.store
ORDER BY s.store

-- SECTION 7 — COMBINED ANALYSIS (Still no CTE/window)

--28) Which store had the highest total sales in holiday weeks only?

SELECT
	 t.store as Highest_total_sales_store,
	 SUM(t.weekly_sales) as total_holiday_sales
FROM features as f
JOIN train as t
	ON f.store=t.store AND f.date = t.date
WHERE f.isholiday='true'
GROUP BY t.store
ORDER BY total_holiday_sales DESC LIMIT 1
	 

--29) Which store had the lowest sales during non-holiday weeks?

SELECT
	 t.store as Lowest_total_sales_store,
	 SUM(t.weekly_sales) as total_non_holiday_sales
FROM features as f
JOIN train as t
	ON f.store=t.store AND f.date = t.date
WHERE f.isholiday='false'
GROUP BY t.store
ORDER BY total_non_holiday_sales ASC LIMIT 1


--30) For each store, show: total sales, average fuel price.

SELECT 
	f.store,
	ROUND(AVG(f.fuel_price),2) as avg_fuel_price, 
	SUM(t.weekly_sales) as total_sales
FROM features as f
JOIN train as t
ON f.store=t.store and f.date=t.date
GROUP BY f.store


--31) For each year, show: total sales and average CPI.

SELECT 
	TO_CHAR(f.date,'YYYY') as year_category,
	SUM(t.weekly_sales) as total_sales,
	ROUND(AVG(f.cpi),2) as avg_cpi
FROM features as f
JOIN train as t
ON f.store=t.store and f.date=t.date
GROUP BY year_category


--32) Which store shows the highest Temperature average in the dataset?

SELECT
	 store,
	 AVG(temperature) as avg_highest_temperature
FROM features
GROUP BY store 
ORDER BY avg_highest_temperature DESC LIMIT 1


--33) Which department had the maximum sales in holiday weeks?

SELECT
	 t.dept,
	 SUM(t.weekly_sales) as total_holiday_sales
FROM features as f
JOIN train as t
	ON t.store=f.store AND t.date = f.date
WHERE f.isholiday='true'
GROUP BY t.dept
ORDER BY total_holiday_sales 
DESC LIMIT 1


-- SECTION 8 — CASE STATEMENT (NO advanced functions)

--34) Categorize stores as:
-- 'Small' if Size < 100000
-- 'Medium' if Size between 100000–150000
-- 'Large' if Size > 150000
-- Show average weekly sales for each category.

SELECT
	CASE
		WHEN s.size<100000 THEN 'Small Store'
		WHEN s.size BETWEEN 100000 AND 150000 THEN 'Medium Store'
		ELSE 'Large store'
		END AS store_category,
		ROUND (AVG(t.weekly_sales),2) as avg_weekly_sales
FROM train as t
JOIN stores as s
ON t.store=s.store
GROUP BY store_category
ORDER BY avg_weekly_sales


--35) Create a simple season classifier:
-- Month 3–5 = Spring
-- 6–8 = Summer
-- 9–11 = Fall
-- 12–2 = Winter
-- Show total sales per season.
-- WHEN MONTH(t.date) BETWEEN 12 and 2 THEN 'Winter'
SELECT
	CASE
		WHEN EXTRACT (MONTH from date) BETWEEN 3 and 5 THEN 'Spring'
		WHEN EXTRACT (MONTH from date) BETWEEN 6 and 8 THEN 'Summer'		
		WHEN EXTRACT (MONTH from date) BETWEEN 9 and 11 THEN 'Fall'
		ELSE 'Winter'
	END AS Season,
	SUM(weekly_sales) as total_weekly_sales
FROM train
GROUP BY 
	CASE
		WHEN EXTRACT (MONTH from date) BETWEEN 3 and 5 THEN 'Spring'
		WHEN EXTRACT (MONTH from date) BETWEEN 6 and 8 THEN 'Summer'		
		WHEN EXTRACT (MONTH from date) BETWEEN 9 and 11 THEN 'Fall'
		ELSE 'Winter'
	END
ORDER BY total_weekly_sales



-- SECTION 9 — FINAL PROJECT QUESTIONS
--36) Identify the top 5 stores by total sales.

SELECT
	store,
	SUM(weekly_sales) as total_sales
FROM train
GROUP BY store
ORDER BY total_sales
DESC LIMIT 5


--37) Identify the top 5 departments by total sales.

SELECT
	dept,
	SUM(weekly_sales) as total_sales
FROM train
GROUP BY dept
ORDER BY total_sales
DESC LIMIT 5


--38) List the slowest performing stores (lowest avg sales).

SELECT
	store,
	ROUND(AVG(weekly_sales),2) as avg_sales
FROM train
GROUP BY store
ORDER BY avg_sales
ASC LIMIT 5


--39) How does Fuel Price affect sales? (compare high vs low fuel price days)

SELECT
	CASE
		WHEN f.fuel_price>(SELECT AVG(fuel_price) FROM features) THEN 'High price'
		ELSE 'Low Price'
	END AS price_category,
	SUM(t.weekly_sales) as total_sales
FROM features as f
JOIN train as t
ON f.store=t.store and f.date=t.date
GROUP BY price_category



--40) Overall — which store should Walmart invest more in?

'''
Based on the complete analysis of the dataset, Walmart should invest more in Store 20.

Justification (Data-Driven):

1) Highest Total Sales
	Store 20 consistently appears in the top 5 highest-revenue stores based on total weekly sales.
	High sales volume indicates strong demand and foot traffic.

2)Strong Performance in Holiday Weeks
	In the holiday-only analysis, Store 20 ranks among the top stores during peak seasons, meaning it captures revenue spikes efficiently.

3)High Average Weekly Sales
	Its average weekly sales remain strong even outside holiday periods, showing stable everyday performance, not just seasonal peaks.

4)Store Type and Size Support Growth
	Store 20 is typically categorized as a Type A Large store in the dataset, meaning:

		(i)Larger floor area
		(ii)Ability to host more product categories
		(iii)Higher operational capacity
		(iv)This makes further investment efficient and scalable.

5)Low Risk, High Return Store
	When comparing slow vs. fast stores, Store 20 shows:

		(i)Consistently high sales
		
		(ii)Strong customer base
		
		(iii)Minimal volatility
		These characteristics make it ideal for expansion, remodeling, or additional promotional spend.

Final Recommendation

Walmart should prioritize investment in Store 20, because it demonstrates the strongest combination of total revenue, holiday sales performance,
stable weekly demand, and operational capacity.
'''

































