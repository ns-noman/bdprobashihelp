TRUNCATE `roles`;
INSERT INTO `roles` (`id`, `is_superadmin`, `created_by`, `role`, `is_default`) VALUES
(1, 1, 1, 'Super Admin', 1),
(2, 0, 1, 'Agent', 1);

TRUNCATE `admins`;
INSERT INTO `admins` (`id`, `agent_id`, `name`, `username`, `type`, `mobile`, `email`, `password`, `image`, `status`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, null, 'Super Admin', NULL, 1, '01800000000', 'admin@gmail.com', '$2y$10$72mM6bhPWEoFlgJKq1WaueJN1g7vMISry0HMa1c5THjRYa7HTISV2', 'admin-1725091483.jpeg', 1, '2024-08-31 01:03:44', '2024-12-31 23:48:55', 'Um2Jcvw02yBR23NOaES9QUhOnRaRZJYH72qYnfoan5KjcDkCGPv1vb7f1Hx7');


TRUNCATE `customers`;

TRUNCATE TABLE `party_payments`;


TRUNCATE `status_lists`;
INSERT INTO `status_lists` (`id`, `item_id`, `srl`, `name`, `name_for_agent`, `color_code`, `status_state`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Pending', NULL, '#dc3545', 0, 1, NULL, NULL),
(2, 1, 2, 'Medical Completed', NULL, '#17a2b8', 1, 1, NULL, NULL),
(3, 1, 3, 'Waiting For Medical Result', NULL, '#17a2b8', 1, 1, NULL, NULL),
(4, 1, 4, 'Unfit & Processing For Refund', NULL, '#17a2b8', 1, 1, NULL, NULL),
(5, 1, 6, 'Refund Completed', NULL, '#212529', 2, 1, NULL, NULL),
(6, 1, 7, 'Result Published', NULL, '#28a745', 2, 1, NULL, NULL),
(7, 2, 1, 'Pending', NULL, '#dc3545', 0, 1, NULL, NULL),
(8, 2, 2, 'Requested For Settlement', 'Request For Settlement', '#b8860b', 1, 1, NULL, NULL),
(9, 2, 3, 'Settlement Processing', NULL, '#17a2b8', 1, 1, NULL, NULL),
(10, 2, 4, 'Settlement Completed', NULL, '#28a745', 2, 1, NULL, NULL),
(11, 3, 1, 'Pending', NULL, '#dc3545', 0, 1, NULL, NULL),
(12, 3, 2, 'Requested For Slip', 'Request For Slip', '#b8860b', 1, 1, NULL, NULL),
(13, 3, 3, 'Processing', NULL, '#17a2b8', 1, 1, NULL, NULL),
(14, 3, 4, 'Slip Received', NULL, '#17a2b8', 1, 1, NULL, NULL),
(15, 3, 5, 'Slip Submission Done', NULL, '#17a2b8', 1, 1, NULL, NULL),
(16, 3, 6, 'Online Fit On WAFID', NULL, '#28a745', 2, 1, NULL, NULL),
(17, 4, 1, 'Pending', NULL, '#dc3545', 0, 1, NULL, NULL),
(18, 4, 2, 'Requested For MOFA', 'Request For MOFA', '#b8860b', 1, 1, NULL, NULL),
(19, 4, 3, 'MOFA Received', NULL, '#17a2b8', 1, 1, NULL, NULL),
(20, 4, 4, 'MOFA Processing', NULL, '#17a2b8', 1, 1, NULL, NULL),
(21, 4, 5, 'MOFA Updated On Visa Platform', NULL, '#28a745', 2, 1, NULL, NULL),
(22, 5, 1, 'Pending', NULL, '#dc3545', 0, 1, NULL, NULL),
(23, 5, 2, 'Requested For Fit Card', 'Request For Fit Card', '#b8860b', 1, 1, NULL, NULL),
(24, 5, 3, 'Fit Card Processing', NULL, '#17a2b8', 1, 1, NULL, NULL),
(25, 5, 4, 'Fit Card Ready For Delivery', NULL, '#17a2b8', 1, 1, NULL, NULL),
(26, 5, 5, 'Delivery Done', NULL, '#28a745', 2, 1, NULL, NULL),
(27, 1, 5, 'Refund Received', NULL, '#17a2b8', 1, 1, NULL, NULL);


TRUNCATE `medical_centers`;
INSERT INTO `medical_centers`(`name`, `code`, `status`)
VALUES
('Center-1','c-1',1),
('Center-2','c-2',1),
('Center-3','c-3',1),
('Center-4','c-4',1),
('Center-5','c-5',1),
('Center-6','c-6',1),
('Center-7','c-7',1),
('Center-8','c-8',1),
('Center-9','c-9',1),
('Center-10','c-10',1);

TRUNCATE `items`;
INSERT INTO `items` (`id`, `item_type`, `package_id`, `package_item_id`, `srl`, `name`, `description`, `purchase_price`, `sale_price`, `next_item_id`, `vat`, `is_saleable`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, NULL, 1, 'Pre Medical', NULL, 7000.00, 7000.00, 2, 0.00, 1, 1, '2025-05-05 03:25:44', '2025-05-25 06:19:12'),
(2, 0, NULL, NULL, 2, 'Settlement', NULL, 2000.00, 2100.00, 3, 0.00, 1, 1, '2025-05-05 03:26:53', '2025-05-05 03:26:53'),
(3, 0, NULL, NULL, 3, 'Slip Proccess', NULL, 2000.00, 2100.00, 4, 0.00, 1, 1, '2025-05-05 03:27:42', '2025-05-05 03:27:42'),
(4, 0, NULL, NULL, 4, 'MOFA', NULL, 0.00, 0.00, 5, 0.00, 0, 1, '2025-05-05 03:28:02', '2025-05-05 03:28:02'),
(5, 0, NULL, NULL, 5, 'Fit Card', NULL, 0.00, 0.00, 0, 0.00, 0, 1, '2025-05-05 04:41:34', '2025-05-05 04:41:34');

TRUNCATE TABLE `party_payments`;
TRUNCATE TABLE `expense_heads`;
TRUNCATE TABLE `expense_categories`;

TRUNCATE TABLE `accounts`;
INSERT INTO `accounts` (`id`, `payment_method_id`, `account_no`, `holder_name`, `balance`, `status`, `created_by_id`, `updated_by_id`) VALUES
(1, 1, 'Hand Cash', 'Self', '0.00', 1, 1, 1),
(2, 2, 'Investment Capital', 'Self', '0.00', 1, 1, NULL);

TRUNCATE `payment_methods`;
INSERT INTO `payment_methods` (`id`, `name`, `is_virtual`, `status`) VALUES
(1, 'Cash', 0, 1),
(2, 'Investment Capital', 1, 1);