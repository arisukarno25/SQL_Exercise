-- search the items name, count of sale,price and total income of profit PROGATEID website
SELECT items.name AS "Nama Items",
       COUNT(*) AS "Jumlah Penjualan",
       items.price AS "Harga",
       COUNT(*)*items.price AS "Total Pemasukan"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.price, items.name
ORDER BY COUNT(*)*items.price DESC
LIMIT 5;