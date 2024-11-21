-- View for shipping and fulfillment metrics
CREATE VIEW vw_ShippingMetrics
AS
SELECT 
    soh.sales_order_id,
    soh.ship_to_address_id,
    a.city,
    a.state_province,
    a.country_region,
    DATEDIFF(day, soh.order_date, soh.ship_date) AS shipping_days,
    soh.freight AS shipping_cost
FROM
    dbo.SalesOrderHeader AS soh
JOIN
    dbo.Address AS a ON soh.ship_to_address_id = a.address_id;
GO