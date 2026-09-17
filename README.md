# Superstore Sales & Profit Analysis

## Overview

This project analyzes the Superstore dataset to understand sales,
profitability, regional performance, category performance, and the
effect of discounts on profit.

The project was completed using Excel, MySQL and Power BI.

## Tools Used

- Excel – Data cleaning and preparation
- MySQL – Data analysis and SQL queries
- Power BI – Dashboard and visualization

## Analysis Performed

- Total sales and total profit
- Overall profit margin
- Regional performance
- Category and sub-category performance
- Loss-making sub-categories
- Total orders
- Discount and profitability analysis

## Key Results

Total Orders: 5,009

Overall Profit Margin: 12.47%

Technology was the strongest category across the Central, East and
South regions.

The West region generated the highest profit among the four regions.

Some of the highest profit-margin sub-categories were:

- Labels – 44.42%
- Paper – 43.39%
- Envelopes – 42.27%
- Copiers – 37.20%

Some sub-categories were loss-making:

- Tables – -8.56%
- Bookcases – -3.02%
- Supplies – -2.55%

The analysis also showed that higher sales do not necessarily result
in higher profitability.

## SQL Analysis

SQL was used to analyze sales and profit across different regions,
categories and sub-categories.

Example query:

SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 / NULLIF(SUM(sales), 0),
        2
    ) AS profit_margin
FROM superstore
GROUP BY sub_category
ORDER BY profit_margin DESC;

## Power BI

The Power BI dashboard was created to visualize the results and make it
easier to compare sales and profitability across different business
dimensions.

## Business Takeaways

- High sales do not always mean high profit.
- Tables, Bookcases and Supplies need further investigation because of
  their negative profit margins.
- High-margin sub-categories such as Labels, Paper and Envelopes can be
  studied for growth opportunities.
- Discounting should be reviewed where it negatively affects
  profitability.

## Project Files

- `superstore(1).xlsx` – Excel data preparation and analysis
- SQL file – SQL queries and analysis
- `SUPERSTORE_SALES_PROFIT_ANALYSIS.pbix` – Power BI dashboard

## Skills

Excel | SQL | MySQL | Power BI | Data Cleaning | Data Analysis |
Data Visualization | Profitability Analysis
