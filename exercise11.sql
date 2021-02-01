SELECT COUNT(user_id) AS jumlah_pengguna,
       1.0 * 100 * COUNT(user_id) / (SELECT COUNT(DISTINCT(sales_records.user_id)) FROM sales_records) AS presentase
FROM (
  SELECT user_id,
         SUM(price) AS total_pengeluaran
  FROM sales_records
  JOIN items ON sales_records.item_id=items.id
  
  GROUP BY user_id
  HAVING total_pengeluaran >= (
       SELECT 1.0 * SUM(price) / COUNT(DISTINCT(sales_records.user_id)) AS rata_jumlah_pembelian
       FROM items
       JOIN sales_records ON items.id=item_id
    )
)
