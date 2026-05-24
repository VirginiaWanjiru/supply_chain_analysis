INSERT INTO supply_chain.vendors VALUES
(1, 'FastShip Co', 'USA', 0.95, 3),
(2, 'Global Logistics', 'Singapore', 0.88, 7),
(3, 'EuroTransit', 'Germany', 0.92, 5),
(4, 'SlowDelivery Inc', 'India', 0.70, 14),
(5, 'PremiumExpress', 'USA', 0.99, 2);

INSERT INTO supply_chain.products VALUES
(101, 'Laptop', 'Electronics', 999.99),
(102, 'Mouse', 'Electronics', 25.99),
(103, 'Desk Chair', 'Furniture', 299.99),
(104, 'Monitor', 'Electronics', 399.99),
(105, 'Keyboard', 'Electronics', 89.99);

INSERT INTO supply_chain.inventory VALUES
(1, 101, 'Warehouse A', 50, '2024-05-20'),
(2, 102, 'Warehouse A', 200, '2024-05-20'),
(3, 103, 'Warehouse B', 30, '2024-05-20'),
(4, 104, 'Warehouse A', 45, '2024-05-20'),
(5, 105, 'Warehouse B', 150, '2024-05-20');

INSERT INTO supply_chain.shipments VALUES
(1001, 1, 101, '2024-04-01', 30, '2024-04-05', 15000.00),
(1002, 2, 102, '2024-04-05', 100, '2024-04-15', 1200.00),
(1003, 3, 103, '2024-04-10', 20, '2024-04-18', 4000.00),
(1004, 4, 104, '2024-04-15', 40, '2024-05-02', 12000.00),
(1005, 1, 105, '2024-05-01', 50, '2024-05-04', 3000.00),
(1006, 5, 101, '2024-05-05', 25, '2024-05-07', 12500.00),
(1007, 2, 104, '2024-05-10', 30, '2024-05-20', 9000.00),
(1008, 1, 102, '2024-05-15', 80, '2024-05-18', 950.00);