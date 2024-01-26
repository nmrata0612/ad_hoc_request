-- Request 2
-- what is the percentage of unique product increase in 2021 vs 2020 the final output contains these fields,
-- unique_products_2020,
-- unique_products_2021,
-- percentage_chg

select X.A as unique_poducts_2020, 
	   Y.B as unique_product_2021, 
       (B-A)/A*100 as percentage_chg
from (
	(select count(distinct(product_code)) as A, fiscal_year from fact_sales_monthly where fiscal_year = 2020) X,
    (select count(distinct(product_code)) as B from fact_sales_monthly where fiscal_year = 2021) y
);
