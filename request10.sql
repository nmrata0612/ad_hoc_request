-- question 10
-- get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021?
-- the final output contains these fields,
-- division
-- product_code
-- product
-- total_sold_quantity
-- rank_order.
with CTE1 as
(
select P.division , S.product_code, P.product, sum(S.sold_quantity) as sold
from dim_product P
join fact_sales_monthly S
on P.product_code = S.product_code
where S.fiscal_year = 2021
group by S.product_code, division, P.product
),
CTE2 as
(
select division, product_code, product, sold,
rank() over(partition by division order by sold desc) as 'Rank_order'
from CTE1)
select T1.division, T2.product_code, T1.product, T2.sold as total_sold_quantity, T2.Rank_order
from CTE1 T1 join CTE2 T2
on T1.product_code = T2.product_code
where T2.Rank_order IN (1, 2, 3);