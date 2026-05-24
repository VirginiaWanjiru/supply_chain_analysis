WITH vendor_performance AS (
    SELECT 
        v.vendor_id,
        v.vendor_name,
        v.reliability_score,
        v.avg_delivery_days,
        COUNT(s.shipment_id) AS total_shipments,
        ROUND(AVG(CAST(DATE_DIFF(s.delivery_date, s.shipment_date, DAY) AS FLOAT64)), 1) AS actual_delivery_days,
        ROUND(SUM(s.cost), 2) AS total_cost
    FROM supply_chain.vendors v
    LEFT JOIN supply_chain.shipments s ON v.vendor_id = s.vendor_id
    GROUP BY v.vendor_id, v.vendor_name, v.reliability_score, v.avg_delivery_days
)
SELECT 
    vendor_name,
    reliability_score,
    total_shipments,
    actual_delivery_days,
    ROW_NUMBER() OVER (ORDER BY reliability_score DESC) AS reliability_rank,
    RANK() OVER (ORDER BY total_shipments DESC) AS shipment_volume_rank
FROM vendor_performance
ORDER BY reliability_rank;