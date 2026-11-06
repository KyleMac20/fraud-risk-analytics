-- Fraud & Payments Risk Analytics
-- Dataset: Synthetic financial transactions
-- Analysis 1: Baseline fraud metrics

SELECT
    COUNT(*) AS total_transactions,
    SUM(fraud_flag) AS flagged_transactions,
    ROUND(
        100.0 * SUM(fraud_flag) / COUNT(*),
        2
    ) AS fraud_rate_pct
FROM transactions;


-- Analysis 2: Fraud rates by transaction type

SELECT
    transaction_type,
    COUNT(*) AS total_transactions,
    SUM(fraud_flag) AS fraud_transactions,
    ROUND(
        100.0 * SUM(fraud_flag) / COUNT(*),
        2
    ) AS fraud_rate_pct
FROM transactions
GROUP BY transaction_type
ORDER BY fraud_rate_pct DESC;


-- Analysis 3: Flagged transaction dollar volume

SELECT
    transaction_type,
    COUNT(*) AS fraud_transactions,
    ROUND(SUM(amount), 2) AS flagged_amount
FROM transactions
WHERE fraud_flag = 1
GROUP BY transaction_type
ORDER BY flagged_amount DESC;


-- Analysis 4: Flagged fraud rate by merchant category
-- Compare transaction volume and flagged activity across categories.

SELECT
    m.category,
    COUNT(*) AS total_transactions,
    SUM(t.fraud_flag) AS fraud_transactions,
    ROUND(
        100.0 * SUM(t.fraud_flag) / COUNT(*),
        2
    ) AS fraud_rate_pct
FROM transactions AS t
INNER JOIN merchants AS m
    ON t.merchant_id = m.merchant_id
GROUP BY m.category
ORDER BY fraud_rate_pct DESC;


-- Analysis 5: Flagged dollar volume by merchant category
-- Identify categories with the greatest potential financial exposure.

SELECT
    m.category,
    COUNT(*) AS fraud_transactions,
    ROUND(SUM(t.amount), 2) AS fraud_amount,
    ROUND(AVG(t.amount), 2) AS avg_fraud_amount
FROM transactions AS t
INNER JOIN merchants AS m
    ON t.merchant_id = m.merchant_id
WHERE t.fraud_flag = 1
GROUP BY m.category
ORDER BY fraud_amount DESC;


-- Analysis 6: Customers with Multiple Flagged Transactions
-- Identify accounts with repeated flags and their potential dollar exposure.

SELECT
    c.customer_id,
    COUNT(*) AS fraud_transactions,
    ROUND(SUM(t.amount), 2) AS flagged_amount
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.fraud_flag = 1
GROUP BY c.customer_id
HAVING COUNT(*) >= 2
ORDER BY fraud_transactions DESC, flagged_amount DESC;
