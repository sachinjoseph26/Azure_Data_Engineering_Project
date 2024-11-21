-- View to analyze customer purchase behavior
CREATE VIEW vw_CustomerPurchaseBehavior
AS
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(soh.sales_order_id) AS total_orders,
    SUM(soh.total_due) AS total_spent,
    AVG(soh.total_due) AS avg_spent_per_order,
    MIN(soh.order_date) AS first_purchase_date,
    MAX(soh.order_date) AS last_purchase_date
FROM
    dbo.Customer AS c
LEFT JOIN
    dbo.SalesOrderHeader AS soh ON c.customer_id = soh.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name;
GO