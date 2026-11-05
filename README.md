# Zepto Inventory Analysis using PostgreSQL

## Project Overview

I worked with a Zepto inventory dataset containing 3,732 SKU-level records. The project follows a complete SQL workflow, starting with table creation and CSV import, followed by data exploration, cleaning, and business-focused analysis.

## What I Did

- Explored the dataset for missing values, product categories, stock availability, and repeated product names.
- Identified and removed records where both price fields were zero.
- Converted MRP and discounted selling price from paise to rupees.
- Used filtering, sorting, grouping, aggregate functions, calculated fields, and `CASE` expressions.
- Answered eight business questions related to pricing, discounts, stock availability, product weight, and category-level inventory.

## Analysis Covered

The SQL analysis examines:

1. Products offering the highest discount percentages.
2. High-MRP products that were out of stock.
3. Estimated inventory value for each category.
4. Products priced above ₹500 with discounts below 10%.
5. Categories offering the highest average discounts.
6. Discounted price per gram for products weighing at least 100 grams.
7. Product classification into low, medium, and bulk weight groups.
8. Total available inventory weight for each category.

> The dataset contains inventory records rather than completed sales transactions. Therefore, discounted selling price multiplied by available quantity represents estimated inventory value, not actual sales revenue.

## What I Learned

Coming from MySQL Workbench, this project gave me my first hands-on experience with PostgreSQL. It helped me become more comfortable with PostgreSQL data types, CSV data loading, data-quality checks, aggregations, calculated columns, and conditional logic using `CASE`.

## Repository Files

- `zepto.csv` — inventory dataset used for the analysis
- `zepto_inventory_sql_data_analysis.sql` — table creation, data exploration, cleaning, and eight business analysis queries

## Project Reference

I completed this project while following [Amlan Mohanty's YouTube tutorial](https://youtu.be/x8dfQkKTyP0) and using his [GitHub repository](https://github.com/amlanmohanty1/zepto-SQL-data-analysis-project) as a reference.

Dataset source: [Zepto Inventory Dataset on Kaggle](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset)
