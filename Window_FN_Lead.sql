-- =====================================================
-- 1. Salary Difference Within Department
-- =====================================================

-- Problem:
-- Find the difference between current salary and next lower salary
-- within each department.

SELECT 
    employee_name,
    department_id,
    salary,
    salary - LEAD(salary) OVER (
        PARTITION BY department_id 
        ORDER BY salary DESC
    ) AS salary_diff
FROM employees;

-- =====================================================
-- 2. Ranking Based on Salary Difference
-- =====================================================

-- Problem:
-- Rank employees based on highest salary difference
-- within each department.

SELECT 
    employee_name,
    department_id,
    salary,
    salary_diff,
    DENSE_RANK() OVER (
        PARTITION BY department_id 
        ORDER BY salary_diff DESC
    ) AS rank_diff
FROM (
    SELECT 
        employee_name,
        department_id,
        salary,
        salary - LEAD(salary) OVER (
            PARTITION BY department_id 
            ORDER BY salary DESC
        ) AS salary_diff
    FROM employees
) t;

-- =====================================================
-- 3. Percentage Change Between Values
-- =====================================================

-- Problem:
-- Calculate percentage change between current salary
-- and next salary.

SELECT 
    employee_name,
    current_salary,
    next_sal,
    CASE 
        WHEN current_salary = 0 THEN NULL
        ELSE (next_sal - current_salary) / current_salary * 100
        END AS pct_change
FROM (
    SELECT 
        employee_name,
        salary AS current_salary,
        LEAD(salary) OVER (ORDER BY salary) AS next_sal
    FROM employees
) t;
-- Write a SQL query to calculate the difference between the current
--day's stock price and the stock price two days ahead for a given company.

-- LEETCODE QUESTION 
-- 197 Rising Temp
Select 
    id 
    from(
        select id,
        temperature as current_day_temp,
        recordDate as curr_date,
        lag(temperature) over(order by recordDate asc) as pre_day_temp,
        lag(recordDate) over(order by recordDate asc) as pre_date
        from weather 
    ) t
    where pre_day_temp < current_day_temp and datediff(curr_date,pre_date) = 1

-- initially used LAG() to compare temperatures but did not account for non-consecutive dates.
--Added:
DATEDIFF(recordDate, prev_date) = 1

