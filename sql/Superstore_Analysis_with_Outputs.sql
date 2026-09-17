-- ============================================================
-- SUPERSTORE SALES & PROFIT ANALYSIS
-- SQL Queries + Confirmed Outputs
-- Excel: data cleaning | SQL: analysis | Power BI: visualization
-- ============================================================

-- 1. Overall Business Performance
SELECT ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       SUM(quantity) AS total_quantity
FROM superstore;

-- OUTPUT: 2297200.86 | 286397.02 | 37873

-- 2. Sales and Profit by Category
SELECT category,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

-- OUTPUT:
-- Technology | 836154.03 | 145454.95
-- Office Supplies | 719047.03 | 122490.80
-- Furniture | 741999.80 | 18451.27

-- 3. Sales, Profit and Profit Margin by Sub-Category
SELECT sub_category,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(SUM(profit) * 100.0 / NULLIF(SUM(sales), 0), 2) AS profit_margin
FROM superstore
GROUP BY sub_category
ORDER BY profit_margin DESC;

-- OUTPUT (selected):
-- Labels | 12486.31 | 5546.25 | 44.42%
-- Paper | 78479.21 | 34053.57 | 43.39%
-- Copiers | 149528.03 | 55617.82 | 37.20%
-- Tables | 206965.53 | -17725.48 | -8.56%

-- 4. Discount vs Sales and Profit
SELECT discount,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY discount
ORDER BY discount;

-- OUTPUT (selected):
-- 0.00 | 1087908.47 | 320987.60
-- 0.20 | 764594.37 | 90337.31
-- 0.30 | 103226.65 | -10369.28
-- 0.40 | 116417.78 | -23057.05
-- 0.50 | 58918.54 | -20506.43
-- 0.70 | 40620.28 | -40075.36
-- 0.80 | 16963.76 | -30539.04

-- 5. Profitability by Customer Segment
SELECT segment,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_profit DESC;

-- OUTPUT:
-- Consumer | 1161401.34 | 134119.21
-- Corporate | 706146.37 | 91979.13
-- Home Office | 429653.15 | 60298.68

-- 6. Profitability by Region
SELECT region,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

-- 7. Region + Category Profitability
SELECT region,
       category,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY region, category
ORDER BY region, total_profit DESC;

-- OUTPUT (selected):
-- Central | Technology | 170416.31 | 33697.43
-- Central | Furniture | 163797.16 | -2871.05
-- East | Technology | 264973.98 | 47462.04
-- West | Office Supplies | 220853.83 | 52609.85

-- 8. Top 10 Most Profitable Products
SELECT product_name,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- OUTPUT (top result):
-- Canon imageCLASS 2200 Advanced Copier | 61599.82 | 25199.93

-- 9. Top 10 Loss-Making Products
SELECT product_name,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 10;

-- OUTPUT (selected):
-- Cubify CubeX 3D Printer Double Head Print | 11099.96 | -8879.97
-- Lexmark MX611dhe Monochrome Laser Printer | 16829.90 | -4589.97
-- Cubify CubeX 3D Printer Triple Head Print | 7999.98 | -3839.99

-- 10. High-Sales but Low-Profit Products
SELECT product_name,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(sales) > (
    SELECT AVG(product_sales)
    FROM (
        SELECT SUM(sales) AS product_sales
        FROM superstore
        GROUP BY product_name
    ) AS product_totals
)
AND SUM(profit) < 0
ORDER BY total_sales DESC
LIMIT 5;

-- 11. Overall Profit Margin
SELECT ROUND(SUM(profit) * 100.0 / NULLIF(SUM(sales), 0), 2) AS profit_margin_percent
FROM superstore;

-- OUTPUT: 12.47%

-- 12. Total Unique Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM superstore;

-- OUTPUT: 5009
