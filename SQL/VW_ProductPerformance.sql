-- View to analyze product performance
CREATE VIEW vw_ProductPerformance
AS
SELECT 
    p.product_id,
    p.name AS product_name,
    COUNT(sod.sales_order_detail_id) AS total_sales,
    SUM(sod.line_total) AS total_revenue,
    AVG(sod.unit_price_discount) AS avg_discount
FROM
    dbo.Product AS p
JOIN
    dbo.SalesOrderDetail AS sod ON p.product_id = sod.product_id
GROUP BY
    p.product_id, p.name;
GO