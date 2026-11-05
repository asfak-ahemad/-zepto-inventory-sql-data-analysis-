create table zepto(
sku_id serial primary key,
category varchar (100),
name varchar (150) not null,
mrp numeric (8,2),
DiscountPercent numeric (5,2),
AvailableQuantity integer,
DiscountedSellingPrice numeric(8,2),
WeightInGms integer,
OutOfStock boolean,
quantity integer
);

--EXPLORING DATA

select count(*) from zepto;

select * from zepto limit 10;

select * from zepto where name is null or category is null or mrp is null 
or DiscountPercent is null or AvailableQuantity is null 
or DiscountedSellingPrice is null or WeightInGms is null
or OutOfStock is null or quantity is null;

select distinct category from zepto order by category;

select OutOfStock, count(sku_id) from zepto group by OutOfStock;

select name, count(sku_id) as "Number of SKUs" from zepto group by name having count(sku_id) > 1 order by count(sku_id) desc;

--DATA CLEANING

select * from zepto where mrp = 0 or DiscountedSellingPrice = 0;

delete from zepto where mrp = 0 and DiscountedSellingPrice = 0;

update zepto set mrp = mrp/100.0, DiscountedSellingPrice = DiscountedSellingPrice/100.0;

select mrp, DiscountedSellingPrice from zepto;


--Business Related Data Analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.

select distinct name, mrp, DiscountPercent from zepto order by DiscountPercent desc limit 10;

--Q2.What are the Products with High MRP but Out of Stock

select distinct name, mrp from zepto where OutOfStock = True and mrp > 300 order by mrp desc;

--Q3.Calculate Estimated Revenue for each category

select category, sum(DiscountedSellingPrice * AvailableQuantity) as total_revenue 
from zepto group by category order by total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

select distinct name, mrp, DiscountPercent from zepto 
where mrp > 500 and DiscountPercent < 10 order by mrp desc, DiscountPercent desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

select category, round(avg(DiscountPercent),2) as avg_discount from zepto group by category order by avg_discount desc limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.

select distinct name, WeightInGms, DiscountedSellingPrice, round(DiscountedSellingPrice/WeightInGms,2) as price_per_gm
from zepto where WeightInGms >= 100 order by price_per_gm;

--Q7.Group the products into categories like Low, Medium, Bulk.

select distinct name, WeightInGms,
case when WeightInGms < 1000 then 'LOW'
	when WeightInGms < 5000 then 'MEDIUM' 
	else 'BULK' end as weight_category
from zepto;

--Q8.What is the Total Inventory Weight Per Category

select category, sum(WeightInGms * AvailableQuantity) as total_weight from zepto group by category order by total_weight;