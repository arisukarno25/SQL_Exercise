SELECT items.name AS "Nama Item",
       items.price - items.cost AS "Keuntungan Per Item",
       1.0 * (items.price - items.cost) / (items.price)*100 AS "Presentase Keuntungan Per Item",
       COUNT(*)*(items.price - items.cost) AS "Keuntungan Total Per Item"
FROM sales_records
JOIN items ON sales_records.item_id=items.id
GROUP BY "Nama Item", "Keuntungan Per Item", "Presentase Keuntungan Per Item"
ORDER BY COUNT(*)*"Keuntungan Per Item" DESC
LIMIT 5;