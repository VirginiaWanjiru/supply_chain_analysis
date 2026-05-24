CREATE TABLE supply_chain.vendors (
    vendor_id INT64,
    vendor_name STRING,
    country STRING,
    reliability_score FLOAT64,
    avg_delivery_days INT64
);

CREATE TABLE supply_chain.products (
    product_id INT64,
    product_name STRING,
    category STRING,
    unit_price FLOAT64
);

CREATE TABLE supply_chain.inventory (
    inventory_id INT64,
    product_id INT64,
    warehouse_location STRING,
    quantity_on_hand INT64,
    last_updated DATE
);

CREATE TABLE supply_chain.shipments (
    shipment_id INT64,
    vendor_id INT64,
    product_id INT64,
    shipment_date DATE,
    quantity_shipped INT64,
    delivery_date DATE,
    cost FLOAT64
);