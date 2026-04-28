-- SUM Function
-- Running Sum or the region if partition is not being done

select 
  transaction_id,
  transaction_date,
  sales_amount,
  region,
  sum(sales_amount) over(order by transaction_date) as cummilative_sum
  from sales

-- Result Shows cummilative running cost by transaction_date
-- If we want an region based partition for running cost

select
  transaction_id,
  transaction_date,
  sales_amount,
  region,
  sum(sales_amount) over(partation by region order by transaction_date) as cummilative_sum_region
  from sales

    
