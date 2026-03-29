create database superstore_project;

use superstore_project;

create table superstore_sales (
Sship_mode varchar(50),
segment varchar(50),
country varchar(50),
city varchar(50),
state varchar(50),
postel_code int,
region varchar(50),
category varchar(50),
sub_category varchar(50),
sales float,
quantity int,
discount float,
profit float
);


# rename column name
alter table superstore_sales
change Sship_mode ship_mode varchar(50);

alter table superstore_sales
change postel_code postal_code int;

describe superstore_sales;

# data preview
select * from superstore_sales;
select * from superstore_sales limit 10;



# data cleaning check 
select * from superstore_sales 
where sales is null or
profit is null or
quantity is null;

# duplicate rows check 
SELECT 
ship_mode, segment, country, city, state, postal_code,
region, category, sub_category, sales, quantity, discount, profit,
COUNT(*) AS duplicate_count
FROM superstore_sales
GROUP BY 
ship_mode, segment, country, city, state, postal_code,
region, category, sub_category, sales, quantity, discount, profit
HAVING COUNT(*) > 1;

# total record check 
select count(*) from superstore_sales;


# KPIS
# total sales
select sum(sales) as total_sales
from superstore_sales;

# total profit
select sum(profit) as total_profit 
from superstore_sales;

# total Quantity
select sum(quantity) as total_Quantity
from superstore_sales;

# profit margin
select (sum(profit) / sum(sales)) * 100 
as profit_margin from superstore_sales;

# charts 
# Region Wise Sales
select region, sum(sales) as total_sales
from superstore_sales
group by region;

# Category Wise Sales & Profit
select category, sum(sales) as total_sales,
sum(profit) as total_profit
from superstore_sales
group by category;

# Top 10 City by Sales
select city, sum(sales) as total_sales
from superstore_sales
group by city
order by total_sales desc
limit 10;

# Discount Vs Sales & Profit
select discount, sum(sales) as total_sales,
sum(profit) as total_profit
from superstore_sales
group by discount
order by discount;

# Ship Mode Wise Sales & Profit
select ship_mode, sum(sales) as total_sales,
sum(profit) as total_profit
from superstore_sales
group by ship_mode
order by ship_mode desc;

# State Wise Sales & Profit
select state, sum(sales) as total_sales,
sum(profit) as total_profit
from superstore_sales
group by state 
order by total_sales desc;

# Top 5 Profitable States
select state, sum(profit) as total_profit
from superstore_sales
group by state
order by total_profit desc
limit 5;


