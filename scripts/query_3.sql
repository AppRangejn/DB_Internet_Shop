-- Було два покупця з найбільшими покупками, тому вирішив додату ще одну
-- Перед використанням FETCH я фільтрував через LIMIT 1, але вирішив краще через FETCH у випадку якщо в базі буде більше 1 покупця який зробив найбільшу кількість покупок, тому що зіткнувся з цим
INSERT INTO orders (code, date, customer, amount, paid)
VALUES ('ORD-2026-10416', '2026-03-19 12:00:00', 7, 4999.00, TRUE);

-- ім’я покупця, який зробив найбільше покупок;
SELECT c.name, COUNT(*) AS buys
FROM customers c
JOIN orders o ON c.id = o.customer
GROUP BY c.name
ORDER BY buys DESC
FETCH FIRST 1 ROWS WITH TIES;
