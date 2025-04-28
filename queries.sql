TRUNCATE `roles`;
INSERT INTO `roles` (`id`, `is_superadmin`, `created_by`, `role`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Super Admin', 1,  NULL, NULL),
(2, 0, 1, 'Agent', 1, NULL, NULL);

TRUNCATE `admins`;
INSERT INTO `admins` (`id`, `agent_id`, `name`, `username`, `type`, `mobile`, `email`, `password`, `image`, `status`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 1, 'Super Admin', NULL, 1, '01800000000', 'admin@gmail.com', '$2y$10$72mM6bhPWEoFlgJKq1WaueJN1g7vMISry0HMa1c5THjRYa7HTISV2', 'admin-1725091483.jpeg', 1, '2024-08-31 01:03:44', '2024-12-31 23:48:55', 'Um2Jcvw02yBR23NOaES9QUhOnRaRZJYH72qYnfoan5KjcDkCGPv1vb7f1Hx7'),
(2, 1, 'Agent', NULL, 2, '62', 'agent@gmail.com', '$2y$10$.VcBTFGCDXfpv27VF7c32uIaDnGbmd2cJCZONPbN0P6Blysqu9j.i', NULL, 1, '2025-04-16 10:20:15', '2025-04-16 10:22:57', 'u44VNRpJKqnWwkkZZcIochNAGfOemImrMusKOcwBLDO2tEIGia8WQAYNtq2M');

TRUNCATE `agents`;
UPDATE `agents` SET `balance`=0.00 WHERE 1;
INSERT INTO `agents` (`id`, `name`, `email`, `contact`, `address`, `dob`, `nid`, `balance`, `is_self`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES (1, 'Investor', 'investor@gmail.com', '62', '', '1982-08-26', 98, 0.00, 0, 1, 1, 1, '2025-04-16 10:20:15', '2025-04-23 09:48:51');
TRUNCATE `investor_transactions`;

UPDATE `accounts` SET `balance`=0.00 WHERE 1;
TRUNCATE `account_ledgers`;
TRUNCATE `fund_transfer_histories`;

TRUNCATE `bike_purchases`;
TRUNCATE `bike_sales`;
TRUNCATE `bike_service_records`;
TRUNCATE `bike_service_record_details`;
TRUNCATE `bike_profits`;
TRUNCATE `bike_profit_share_records`;
TRUNCATE `sellers`;
TRUNCATE `buyers`;
TRUNCATE `bikes`;


-- Expenses
TRUNCATE `expenses`;
TRUNCATE `expense_details`;

-- Inventory Clear
UPDATE `items` SET `sold_qty`='0',`current_stock`='0' WHERE 1;
-- TRUNCATE `items`;
TRUNCATE `purchases`;
TRUNCATE `purchase_details`;
UPDATE `suppliers` SET `opening_payable`='0.00',`opening_receivable`='0.00',`current_balance`='0.00' WHERE 1;
TRUNCATE `suppliers`;
TRUNCATE `supplier_ledgers`;
TRUNCATE `supplier_payments`;

UPDATE `customers` SET `current_balance`='0.00' WHERE 1;
TRUNCATE `customers`;
INSERT INTO `customers`(`name`,`customer_type`, `status`) VALUES ('Walk-in Customer',1,1);

TRUNCATE `sales`;
TRUNCATE `sale_details`;
TRUNCATE `customer_ledgers`;
TRUNCATE `customer_payments`;

TRUNCATE `stock_histories`;


-- Loan Module
TRUNCATE TABLE `party_ledgers`;
TRUNCATE TABLE `party_loans`;
UPDATE `parties` SET `current_balance`='0' WHERE 1;
TRUNCATE TABLE `party_payments`;