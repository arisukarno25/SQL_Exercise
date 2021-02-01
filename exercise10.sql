SELECT users.name AS name_buyer,
       COUNT(*) AS number_of_purchases
FROM sales_records
JOIN users ON sales_records.user_id=users.id
GROUP BY users.name
HAVING number_of_purchases >= (
       SELECT 1.0 * COUNT(*) / COUNT(DISTINCT(sales_records.user_id)) AS rata_jumlah_pembelian
       FROM sales_records
)
ORDER BY number_of_purchases DESC