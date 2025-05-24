TRUNCATE `sales`;
TRUNCATE `sale_details`;
TRUNCATE `job_service_records`;

UPDATE `customers` SET `current_balance`='0.00' WHERE 1;
TRUNCATE `customer_ledgers`;
TRUNCATE `customer_payments`;