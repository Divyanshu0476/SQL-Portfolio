-- Find the difference between current salary and next lower salary within each department
SELECT 
    employee_name,
    department_id,
    salary,
    salary - LEAD(salary) OVER (
        PARTITION BY department_id 
        ORDER BY salary DESC
    ) AS salary_diff
FROM employees;

-- Ranking Based on Salary Difference



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

-- Percentage Change Between Values
-- Calculate percentage change between current salary
-- and next salary.

-- =====================================================
-- Window Functions Practice: LEAD() & Analytical Thinking
-- =====================================================

-- Objective:
-- Learn how to compare rows, calculate differences,
-- and derive insights using window functions.


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













