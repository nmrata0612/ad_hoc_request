-- question 7
-- get the complete report of the gross sales amount for the customer "Atliq Exclusive" for each month.
-- this analysis helps to get an idea of low and high-performing months and take strategic decisions.
-- the final report contains these columns.
-- month, year, Gross sales Amount.

select monthname(S.date) as month,
	   S.fiscal_year as year,
       round(sum(G.gross_price * S.sold_quantity), 2) as gross_sales_amount
from dim_customer C
join fact_sales_monthly S on c.customer_code = S.customer_code
join fact_gross_price G on S.product_code = G.product_code
where C.customer = "Atliq Exclusive"
group by month, year
order by year;