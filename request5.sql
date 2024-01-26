-- question 5
-- get the product that have the higest and lowest manufacturing costs.
--  the final output should contain these fields,
-- product_code
-- product
-- manufacturing_cost.

select P.product_code, P.product, M.manufacturing_cost
from dim_product P
join fact_manufacturing_cost M
on P.product_code = M.product_code
where M.manufacturing_cost IN(
(select max(manufacturing_cost) from fact_manufacturing_cost)
union
(select min(manufacturing_cost) from fact_manufacturing_cost)
);
