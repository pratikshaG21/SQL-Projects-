# Zepto SQL Analysis Project

This project includes SQL queries for analyzing product and inventory data inspired by Zepto's business model.

## 📊 Topics Covered

- Table creation and schema
- Data cleaning and null checks
- Discount and MRP analysis
- Out-of-stock product detection
- Revenue estimation per category
- Best value products (₹/gram)
- Product weight classification (Low / Medium / Bulk)

## 🧪 Sample Query

```sql
SELECT category, SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM Zepto
GROUP BY category
ORDER BY total_revenue DESC;

