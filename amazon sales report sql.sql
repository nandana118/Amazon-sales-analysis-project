create database amazon1;
use amazon1;
select * from amazon_file;
select count(*) from amazon_file;
select distinct *  from amazon_file;
#describe amazon_file



# change datatype of ship postal code 
alter table amazon_file modify column `ship-postal-code` int;
select * from amazon_file where Date is null;

alter table amazon_file drop column `Unnamed: 22`;

# Total Number of Orders
SELECT COUNT(DISTINCT `Order ID`) AS total_orders
FROM amazon_file
WHERE status != 'Cancelled';


# What are the total sales (Amount) achieved during 2022?
select sum(Amount) as totalsales from amazon_file;

# What are the total sales (Amount) achieved during 2022 based on category?
select category,sum(Amount) as totalsales from amazon_file group by category order by totalsales desc;

# These businesses tend to use which shipping services (ship_service_level) most frequently?
select `ship-service-level`,count(`Order ID`) as total_id from amazon_file where status!='Cancelled' 
group by `ship-service-level`;

# This business has the most sales in which sales channel (Sales_Channel_)?
#through which channl the items has been delivered
select `Sales Channel`,sum(qty) as total_qty from amazon_file where status != 'Cancelled'
group by `Sales Channel`;

-- #5) 5. Which SKU product has the highest total quantity sold (Qty)?
-- select `SKU`,sum(`Qty`) as totalqty,sum(Amount) as totalsales from amazon_file 
-- where Status!='Cancelled' and amount is not null group by `SKU` order by totalqty,totalsales 
-- desc limit 10 ;


# What is the total revenue (Amount) from sales
# within a particular state (ship_state) 
SELECT `ship-state`, SUM(Amount) AS total_revenue
FROM amazon_file
GROUP BY `ship-state` order by total_revenue desc ;

# Order Status Analysis
select `status`,count(status) as total from amazon_file group by `status` order by total;

#how many orders were fulfilled by Amazon versus third-party merchants.
SELECT Fulfilment, COUNT(*) AS Fulfillment_Count FROM amazon_file GROUP BY Fulfilment;



# cancellation by category
SELECT Category, COUNT(*) AS cancellation_count FROM amazon_file WHERE Status = 'Cancelled'
GROUP BY Category ORDER BY cancellation_count DESC;



#peak time od orders
SELECT Date, COUNT(*) AS order_count FROM amazon_file GROUP BY Date ORDER BY Date;
