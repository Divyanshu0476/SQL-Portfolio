
select employee_name,department_id,salary,New_sal,
dense_rank() over(partition by department_id order by new_sal desc) from(
Select 
	Employee_name,
    department_id,
    salary,
    salary-
    -- In this scario we used subquery and determined a new salary which is difference of next salary and current salary& then we used this 
    -- Calculcated column to determine the the rank in the above query	
    lead(salary,1,"NA") over(partition by department_id order by salary desc) as New_sal
    from employees) t;
