TRUNCATE `roles`;
INSERT INTO `roles` (`id`, `is_superadmin`, `created_by`, `role`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Super Admin', 1,  NULL, NULL),
(2, 0, 1, 'Agent', 1, NULL, NULL);

TRUNCATE `admins`;
INSERT INTO `admins` (`id`, `agent_id`, `name`, `username`, `type`, `mobile`, `email`, `password`, `image`, `status`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, null, 'Super Admin', NULL, 1, '01800000000', 'admin@gmail.com', '$2y$10$72mM6bhPWEoFlgJKq1WaueJN1g7vMISry0HMa1c5THjRYa7HTISV2', 'admin-1725091483.jpeg', 1, '2024-08-31 01:03:44', '2024-12-31 23:48:55', 'Um2Jcvw02yBR23NOaES9QUhOnRaRZJYH72qYnfoan5KjcDkCGPv1vb7f1Hx7');



UPDATE `accounts` SET `balance`=0.00 WHERE 1;
TRUNCATE `account_ledgers`;
TRUNCATE `fund_transfer_histories`;


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

-- Medical
INSERT INTO `status_lists`(`item_id`, `srl`, `name`, `color_code`, `status_state`, `status`)
VALUES
(1,1,'Pending','#dc3545',0,1),
(1,2,'Medical Completed','#17a2b8',1,1),
(1,3,'Waiting For Medical Result','#17a2b8',1,1),
(1,4,'Unfit & Processing For Refund','#17a2b8',1,1),
(27,1,5,'Refund Received','#17a2b8',1,1),
(1,6,'Refund Completed','#17a2b8',2,1),
(1,7,'Result Published','#28a745',2,1);

-- Settlement
INSERT INTO `status_lists`(`item_id`, `srl`, `name`, `color_code`, `status_state`, `status`)
VALUES
(2,1,'Pending','#dc3545',0,1),
(2,2,'Requested For Settlement','#17a2b8',1,1),
(2,3,'Settlement Processing','#17a2b8',1,1),
(2,4,'Settlement Completed','#17a2b8',2,1);

-- Slip
INSERT INTO `status_lists`(`item_id`, `srl`, `name`, `color_code`, `status_state`, `status`)
VALUES
(3,1,'Pending','#dc3545',0,1),
(3,2,'Requested For Slip','#17a2b8',1,1),
(3,3,'Processing','#17a2b8',1,1),
(3,4,'Slip Received','#17a2b8',1,1),
(3,5,'Slip Submission Done','#17a2b8',1,1),
(3,6,'Online Fit On WAFID','#28a745',2,1);

-- MOFA
INSERT INTO `status_lists`(`item_id`, `srl`, `name`, `color_code`, `status_state`, `status`)
VALUES
(4,1,'Pending','#dc3545',0,1),
(4,2,'Requested For MOFA','#17a2b8',1,1),
(4,3,'MOFA Received','#17a2b8',1,1),
(4,4,'MOFA Processing','#17a2b8',1,1),
(4,5,'MOFA Updated','#17a2b8',2,1);

-- Fit Card
INSERT INTO `status_lists`(`item_id`, `srl`, `name`, `color_code`, `status_state`, `status`)
VALUES
(5,1,'Pending','#dc3545',0,1),
(5,2,'Requested For Fit Card','#17a2b8',1,1),
(5,3,'Fit Card Processing','#17a2b8',1,1),
(5,4,'Fit Card Ready For Delivery','#17a2b8',1,1),
(5,5,'Delivery Done','#17a2b8',2,1);

TRUNCATE `medical_centers`;
INSERT INTO `medical_centers`(`name`, `code`, `status`)
VALUES
('Center-1','c-1',1),
('Center-2','c-2',1),
('Center-3','c-3',1),
('Center-4','c-4',1),
('Center-5','c-5',1);
('Center-6','c-6',1);
('Center-7','c-7',1);
('Center-8','c-8',1);
('Center-9','c-9',1);
('Center-10','c-10',1);