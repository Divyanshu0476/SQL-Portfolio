-- Lead / Lag
--Problem: SQL Price Change by Month
-- Lets say we have a product table and every montht they have a change in price
-- Approch - Lag function with Subquery to fiter out the null cases too
select 
	prod_id,
	month,
	price ,
	CASE
	when prev_price is null then 'No Previous Data'
	when price> prev_price then 'Price Increased'
	else 'Price is Stable'
	end as price_changed_status 
	from (
select
	prod_id,
	month,
	price,
	lag(price,1) over(partition by prod_id order by month asc) as Prev_Price
	from sales ) prices_changed;

-- What went wrong --> didnt handeled the null cases in the first row for the previous price changed item and put the null value at first place
