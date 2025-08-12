SELECT * FROM online_sales;

 --REVENUE AS PER PRODUCT ID
SELECT  
    product_id,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY product_id
ORDER BY total_revenue DESC;


--TOTAL REVENUE
SELECT SUM(AMOUNT)  AS TOTAL_REVENUE FROM online_sales;

--FOR VOLUME
SELECT
COUNT(DISTINCT order_id) AS order_volume FROM online_sales;

--monthly sales trend 

SELECT
    YEAR(order_date) AS order_year,
    DATENAME(MONTH, order_date) AS order_month_name,
    COUNT(DISTINCT order_id) AS order_volume,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY YEAR(order_date), DATENAME(MONTH, order_date), MONTH(order_date)
ORDER BY order_year, MONTH(order_date);


--product_id with the highest number of orders

SELECT TOP 1
    product_id,
    COUNT(*) AS order_count
FROM online_sales
GROUP BY product_id
ORDER BY order_count DESC;

--Top 3 orders with the highest amount value:

SELECT TOP 3
    order_id,
    product_id,
    amount,
    order_date
FROM online_sales
ORDER BY amount DESC;
