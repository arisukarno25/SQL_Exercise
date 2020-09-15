-- search the income, profit and percentage of profit PROGATEID website
SELECT SUM(items.price) AS "Total Pendapatan", 
       SUM(items.price-items.cost) AS "Laba", 
       1.0 * SUM(items.price-items.cost)/SUM(items.price)*100 AS "Presentase Laba"
FROM sales_records
JOIN items
ON sales_records.item_id=items.id;