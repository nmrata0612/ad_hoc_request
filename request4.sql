-- question 4
-- which segment had the most increase in unique products in 2021 vs 2020? 
-- the final output contains these fields
-- segment
-- product_count_2020
-- product_count_2021
-- difference

with CTE1 as 
(
	SELECT P.segment AS A , COUNT(DISTINCT(FS.product_code)) AS B 
    FROM dim_product P, fact_sales_monthly FS
    WHERE P.product_code = FS.product_code
    GROUP BY FS.fiscal_year, P.segment
    HAVING FS.fiscal_year = "2020"
),
CTE2 as
(
	select P.segment as A, count(distinct(FS.product_code)) as B
	from dim_product P, fact_sales_monthly FS
	where P.product_code = FS.product_code
	group by FS.fiscal_year, P.segment
	having FS.fiscal_year = "2021"
)
select CTE1.A as segment, CTE1.B as product_count_2020, CTE2.B as product_count_2021, (CTE2.B - CTE1.B) as difference
from CTE1, CTE2
where CTE1.A = CTE2.A;