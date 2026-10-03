-- кількість товарів на кожному зі складів;
SELECT s.title, SUM(i.quantity) AS total
FROM stores s
JOIN items i ON s.id = i.store_id
GROUP BY s.title
ORDER BY total DESC;

