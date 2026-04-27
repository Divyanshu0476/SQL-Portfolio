Problem : Ranking Employee by salary within each dept
  Top 3 product
Pattern : ranking Employees
Aproch : Rank() --> if tie equal the rank and skips the next one
sql
select
  empl_name,
  salary,
  rank() over(partition by dept_id order by salary) as rnk
  from employees

Problem : Determining the Sales rank for each salesperson
 Approch : sum() and rank
sql
select
  salesperson,
  sum(amount),
  rank() over(order by sum(amount) desc) as rnk
  from sales
  group by salesperson

-- Similar goes with dense_rank as we have dense_rank for the non skipping rows and even if its a tie
