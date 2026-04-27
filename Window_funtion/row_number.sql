-- Window Functions Patterns
Problem: Top 3 Salesperson by amount
Pattern Top N
Approach:Window FN with Row_Number()
SQL:
Select 
 Salesperson_name,
 Sales_amount
 row_number() over(order by sales_amount desc) as rnk
 from sales
Key Learnings: Row_number() will give the sequential interger to the ranks
Mistake I Made: Nothing
-------------------------------------------------------------------------------------
Problem: Top 3 Salesperson by department
Pattern Top N with Partition 
Approach:Window FN with Row_Number() and partition by
SQL:
Select 
 Salesperson_name,
 Sales_amount
 row_number() over(partation by salesperson_name order by sales_amount desc) as rnk
 from sales
Key Learnings: Row_number() will give the sequential interger to the ranks within the partition
Mistake I Made: for top 3 we need subqeury and filter it out
 
-- With Subquery
SQL:
 Select Salesperson_name,sales_amount,rnk from(
Select 
 Salesperson_name,
 Sales_amount
 row_number() over(partation by salesperson_name order by sales_amount desc) as rnk
 from sales ) t
Where rnk >=3 
-- Filtering out top 3 as subquery or inner query will return a table with the rank and that rank can be used in where clause to filter out top 3
-----------------------------------------------------------------------------------------

Problem: Paginatation
Pattern Row_number all the products
Approach:Window FN with Row_Number()
Key Learnings: Row_number() will give the sequential interger and filter those with between 
Mistake I Made: Nothing
-----------------------------------------------------------------------------------------
