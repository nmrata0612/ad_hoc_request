-- question 6
-- generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. 
-- The final output contains these fields,
-- customer_code
-- customer
-- average_discount_percentage.

with CTE1 as (
	select customer_code, customer from dim_customer
	where market = "India"
),
	 CTE2 as (
     select customer_code, avg(pre_invoice_discount_pct) as average_discount_percentage from fact_pre_invoice_deductions
     where fiscal_year = "2021"
     group by customer_code
     )
select CTE1.customer_code, CTE1.customer, CTE2.average_discount_percentage from CTE1
join CTE2
on CTE1.customer_code = CTE2.customer_code
order by average_discount_percentage desc
limit 5;
