SELECT COUNT (DISTINCT(sales_records.user_id)) AS "Pengguna",
       1.0 * 100 * COUNT(DISTINCT(sales_records.user_id)) / (SELECT COUNT(*) FROM users) AS "Presentase Pengguna Aktif"
FROM sales_records