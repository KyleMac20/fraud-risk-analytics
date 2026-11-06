# Fraud & Payments Risk Analytics

## Project Overview

This project explores fraud and payment risk using a simulated financial transaction dataset.

The objective is to identify patterns in suspicious transactions, compare fraud rates across transaction types and merchant categories, and develop data-driven recommendations for improving transaction monitoring.

## Dataset

The project uses synthetic financial transaction data, including:

- 10,000 transactions
- 500 customers
- Merchant information and categories
- Transaction amounts and types
- Simulated fraud indicators

**All data is synthetic and does not represent actual customer activity or confirmed financial losses.**

## Tools

- **SQLite:** Data exploration, SQL queries, and fraud analysis
- **DB Browser for SQLite:** Database management and query execution

**Planned additions:** Power BI dashboard and Python analysis.

## Initial Findings

Preliminary analysis of the simulated dataset found:

| Metric | Result |
|---|---|
| Total transactions | 10,000 |
| Flagged transactions | 312 |
| Overall flagged fraud rate | 3.12% |
| Purchase flagged fraud rate | 3.04% |
| Refund flagged fraud rate | 4.43% |

Refund transactions had a higher flagged fraud rate than purchases, while purchases accounted for most flagged transactions due to substantially higher transaction volume.

These findings are preliminary and do not establish actual fraud losses or the effectiveness of existing fraud controls.

### Merchant Category Risk Analysis

Electronics had the highest flagged fraud rate (5.53%), followed by Digital Goods (5.38%) and Travel (5.12%).

Digital Goods had the highest flagged transaction dollar volume ($4,497.79), followed by Electronics ($4,251.54) and Travel ($3,361.58).

These three categories represented approximately 65.4% of flagged transactions and 66.9% of flagged dollar volume.

**Preliminary recommendation:** Prioritize further investigation of these categories to identify suspicious transaction patterns and evaluate whether additional risk controls are warranted. These results do not establish confirmed losses.

## Project Roadmap

- [x] Create and publish the simulated dataset
- [x] Calculate baseline fraud metrics
- [x] Compare fraud rates by transaction type
- [x] Analyze fraud by merchant category
- [ ] Identify high-risk customer transaction patterns
- [ ] Develop a Power BI dashboard
- [ ] Document risk recommendations

## About This Project

This independent portfolio project demonstrates the application of SQL and analytical reasoning to fraud monitoring, payments risk, and financial transaction analysis.
