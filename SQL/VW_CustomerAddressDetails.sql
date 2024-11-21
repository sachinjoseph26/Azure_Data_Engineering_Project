-- View for customer and address details
CREATE VIEW vw_CustomerAddressDetails
AS
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    a.city,
    a.state_province,
    a.country_region,
    a.postal_code
FROM
    dbo.Customer AS c
JOIN
    dbo.CustomerAddress AS ca ON c.customer_id = ca.customer_id
JOIN
    dbo.Address AS a ON ca.address_id = a.address_id;
GO