-- View for product category and description
CREATE  VIEW vw_ProductCategoryDescription
AS
SELECT 
    pc.product_category_id,
    pc.name AS category_name,
    pd.product_description_id,
    pd.description
FROM
    dbo.ProductCategory AS pc
JOIN
    dbo.ProductModelProductDescription AS pmpd ON pc.product_category_id = pmpd.product_model_id
JOIN
    dbo.ProductDescription AS pd ON pmpd.product_description_id = pd.product_description_id;
GO