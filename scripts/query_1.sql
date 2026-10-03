-- кількість моделей кожного бренду;
SELECT b.title, COUNT(*) AS summ
FROM brands b
JOIN models m ON b.id = m.brand_id
GROUP BY b.title
ORDER BY summ DESC;
