-- question 9
-- which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?
-- the final output contian these fields, 
-- channel
-- gross_sales_mln
-- percentage.

with CTE1 as (
	select C.channel,
	sum(G.gross_price * S.sold_quantity) as sales
	from  dim_customer C
	join fact_sales_monthly S on C.customer_code = S.customer_code
	join fact_gross_price G on S.product_code = G.product_code
	where S.fiscal_year = "2021"
	group by C.channel
)
select channel,
	   round(sales/1000000, 2) as gross_sales_mln,
       round(sales /( sum(sales) over())*100, 2) as percentage
from CTE1;