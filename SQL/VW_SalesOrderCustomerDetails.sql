-- View for sales order and customer details
CREATE VIEW vw_SalesOrderCustomerDetails
AS
SELECT 
    soh.sales_order_id,
    soh.order_date,
    soh.total_due,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email_address,
    c.phone
FROM
    dbo.SalesOrderHeader AS soh
JOIN
    dbo.Customer AS c ON soh.customer_id = c.customer_id;
GO