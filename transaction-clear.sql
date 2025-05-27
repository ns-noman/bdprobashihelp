UPDATE `accounts` SET `balance`=0.00 WHERE 1;
TRUNCATE `account_ledgers`;
TRUNCATE `fund_transfer_histories`;

TRUNCATE `sales`;
TRUNCATE `sale_details`;
TRUNCATE `job_service_records`;

UPDATE `customers` SET `current_balance`='0.00' WHERE 1;
TRUNCATE `customer_ledgers`;
TRUNCATE `customer_payments`;


-- Loan Module
TRUNCATE TABLE `party_ledgers`;
TRUNCATE TABLE `party_loans`;
UPDATE `parties` SET `current_balance`='0' WHERE 1;

-- Expenses
TRUNCATE `expenses`;
TRUNCATE `expense_details`;