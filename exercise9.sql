SELECT 1.0 * COUNT(*) / COUNT(DISTINCT(sales_records.user_id)) AS "rata_jumlah_pembelian",
       1.0 * SUM(items.price) / COUNT(DISTINCT(sales_records.user_id)) AS "rata_pengeluaran",
       (1.0 * SUM(items.price) / COUNT(DISTINCT(sales_records.user_id))) / (1.0 * COUNT(*) / COUNT(DISTINCT(sales_records.user_id))) AS "rata_pengeluaran_per_belanjaan"
FROM sales_records
JOIN items ON sales_records.item_id=items.id

--OR
SELECT rata_jumlah_pembelian,
       rata_pengeluaran,
       1.0 * rata_pengeluaran / rata_jumlah_pembelian AS rata_pengeluaran_per_belanjaan
FROM (
    SELECT 1.0 * COUNT(*) / COUNT(DISTINCT(sales_records.user_id)) AS rata_jumlah_pembelian,
    1.0 * SUM(items.price) / COUNT(DISTINCT(sales_records.user_id)) AS rata_pengeluaran
FROM sales_records
JOIN items ON sales_records.item_id=items.id
)
