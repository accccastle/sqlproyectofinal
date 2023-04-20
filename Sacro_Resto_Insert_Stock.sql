USE sacro_resto;

-- Insert Stock
INSERT INTO Stock (ID_PRODUCT,NAME_PRODUCT)
SELECT ID_PRODUCT, NAME_PRODUCT
FROM PRODUCTS
WHERE ID_PRODUCT >0;

-- Update Stock = 0

UPDATE STOCK
SET STOCK = 0
WHERE ID_STOCK >0;

-- Update Stock, segun la tabla de compras

UPDATE Stock,
    (SELECT id_product, sum(add_stock) AS sum_stock
    FROM purchase
    GROUP BY id_product) AS purch
SET stock.stock = purch.sum_stock
WHERE stock.id_product = purch.id_product;
