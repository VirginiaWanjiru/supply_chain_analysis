SELECT 
    inventory_id,
    product_id,
    warehouse_location,
    quantity_on_hand,
    last_updated,
    LAG(quantity_on_hand) OVER (
        PARTITION BY product_id 
        ORDER BY last_updated
    ) AS previous_quantity,
    quantity_on_hand - LAG(quantity_on_hand) OVER (
        PARTITION BY product_id 
        ORDER BY last_updated
    ) AS quantity_change,
    CASE 
        WHEN quantity_on_hand < LAG(quantity_on_hand) OVER (
            PARTITION BY product_id 
            ORDER BY last_updated
        ) THEN 'STOCK_DECREASED'
        WHEN quantity_on_hand > LAG(quantity_on_hand) OVER (
            PARTITION BY product_id 
            ORDER BY last_updated
        ) THEN 'STOCK_INCREASED'
        ELSE 'NO_CHANGE'
    END AS stock_trend
FROM supply_chain.inventory
ORDER BY product_id, last_updated;