-- Query 1: How many transactions and how much purchase volume?
SELECT COUNT(*) AS purchase_count, ROUND(SUM(amount),2) AS purchase_volume
FROM transactions WHERE transaction_type = 'Purchase';

-- YOUR TASK 2: Find fraud rate and flagged transaction amount by merchant category.
-- Join transactions to merchants. Filter to Purchase transactions.
-- Group by merchant category and sort highest fraud rate first.
-- Use fraud_flag = 1 as the simulated confirmed fraud label.

-- YOUR TASK 3: Measure rule precision and recall.
-- True positive = rule_alert = 1 AND fraud_flag = 1.
-- False positive = rule_alert = 1 AND fraud_flag = 0.
-- False negative = rule_alert = 0 AND fraud_flag = 1.
