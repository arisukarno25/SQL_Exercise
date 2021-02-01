SELECT 1.0 * COUNT(*) / COUNT(DISTINCT(sales_records.user_id)) AS "Frekuensi Rata-Rata Pembelian",
       1.0 * SUM(items.price) / COUNT(DISTINCT(sales_records.user_id)) AS "Pengeluaran Rata-Rata",
       (1.0 * SUM(items.price) / COUNT(DISTINCT(sales_records.user_id))) / (1.0 * COUNT(*) / COUNT(DISTINCT(sales_records.user_id))) AS "Pengeluaran Rata-Rata per Pembelian"
FROM sales_records
JOIN items ON sales_records.item_id=items.id
