SELECT 
    s.shipment_id,
    v.vendor_name,
    s.shipment_date,
    s.cost,
    SUM(s.cost) OVER (
        PARTITION BY v.vendor_id 
        ORDER BY s.shipment_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_vendor_cost,
    SUM(s.cost) OVER (
        ORDER BY s.shipment_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_total_cost,
    ROW_NUMBER() OVER (
        PARTITION BY v.vendor_id 
        ORDER BY s.shipment_date
    ) AS shipment_number_for_vendor
FROM supply_chain.shipments s
JOIN supply_chain.vendors v ON s.vendor_id = v.vendor_id
ORDER BY s.shipment_date, v.vendor_name;