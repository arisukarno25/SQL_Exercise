SELECT items.name AS "Nama Item",
       items.price - items.cost AS "Keuntungan Per Item",
       1.0 * (items.price - items.cost) / (items.price)*100 AS "Presentase Keuntungan Per Item",
       COUNT(*)*(items.price - items.cost) AS "Keuntungan Total Per Item"
FROM sales_records
JOIN items ON sales_records.item_id=items.id
WHERE items.id = 23 OR items.id = 30 OR items.id=3 OR items.id = 17 OR items.id = 1
GROUP BY "Nama Item", "Keuntungan Per Item", "Presentase Keuntungan Per Item"
ORDER BY COUNT(*)*items.price DESC;