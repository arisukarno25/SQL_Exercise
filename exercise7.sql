SELECT items.gender AS "Jenis Kelamin",
       SUM(items.price - items.cost) AS "Total Laba",
       1.0 * SUM(items.price - items.cost) / SUM(items.price) * 100 AS "Presentase Laba"
FROM sales_records
JOIN items ON sales_records.item_id=items.id
GROUP BY "Jenis Kelamin";