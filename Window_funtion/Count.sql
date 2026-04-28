-- Count Fn with duplicates
-- Duplicates within same department salary

    select
      select  distinct salary, dup_sal from (
    select 
    	employee_name,
        department_id,
        salary,
        count(*) over(partition by department_id,salary) dup_sal
      from employees) t
       where dup_sal>1
  ; 
-- Example dataset
for department 10 and with partition by department_id
| employee | dept | salary |
| -------- | ---- | ------ |
| A        | 10   | 50000  |
| B        | 10   | 60000  |
| C        | 10   | 50000  |

Partitions formed:
(10, 50000) → A, C → count = 2
(10, 60000) → B → count = 1
