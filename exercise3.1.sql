SELECT items.name AS "Nama Item",
       items.price - items.cost AS "Keuntungan Per Item",
       1.0 * (items.price - items.cost) / (items.price)*100 AS "Presentase Keuntungan Per Item",
       COUNT(*)*(items.price - items.cost) AS "Keuntungan Total Per Item"
FROM sales_records
JOIN items ON sales_records.item_id=items.id
WHERE items.id IN (
      SELECT items.id
      FROM sales_records
      JOIN items ON sales_records.item_id = items.id
      GROUP BY items.id 
      ORDER BY COUNT(*)* items.price DESC
      LIMIT 5
)
GROUP BY "Nama Item", "Keuntungan Per Item", "Presentase Keuntungan Per Item"
ORDER BY COUNT(*)*items.price DESC;