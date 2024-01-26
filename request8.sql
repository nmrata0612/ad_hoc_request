-- question 8
-- in which quarter of 2020, got the maximum total_sold_quantity?
-- the final output contains these field sorted by the total_sold_quantity.
-- Quarter
-- total_sold_quantity

select 
case
when date between '2019-09-01' AND '2019-11-30' then 1
when date between '2019-12-01' AND '2020-02-29' then 2
when date between '2020-03-01' AND '2020-05-30' then 3
when date between '2020-06-01' AND '2020-08-31' then 4
end as Quarter
, sum(sold_quantity) as total_sold_quantity from fact_sales_monthly
where fiscal_year = "2020"
group by Quarter
order by total_sold_quantity desc;