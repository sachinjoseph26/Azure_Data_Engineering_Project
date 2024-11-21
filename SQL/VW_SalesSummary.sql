-- View to summarize sales data by product category and month
CREATE OR ALTER VIEW vw_SalesSummary
AS
SELECT 
    p.product_category_id,
    pc.name AS category_name,
    YEAR(soh.order_date) AS year,
    MONTH(soh.order_date) AS month,
    SUM(soh.total_due) AS total_revenue,
    COUNT(soh.sales_order_id) AS total_orders,
    AVG(soh.total_due) AS avg_order_value
FROM
    dbo.SalesOrderHeader AS soh
JOIN 
    dbo.SalesOrderDetail AS sod ON soh.sales_order_id = sod.sales_order_id
JOIN
    dbo.Product AS p ON sod.product_id = p.product_id
JOIN 
    dbo.ProductCategory AS pc ON p.product_category_id = pc.product_category_id
GROUP BY
    p.product_category_id, pc.name, YEAR(soh.order_date), MONTH(soh.order_date);
GO
