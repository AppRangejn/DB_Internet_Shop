-- ім’я покупця, який купив найдорожчу рiчь.
SELECT c.name, i.price
FROM customers c
JOIN orders o ON c.id = o.customer
JOIN item_order io ON o.id = io.order_id
JOIN items i ON io.item_id = i.id
ORDER BY i.price DESC
FETCH FIRST 1 ROWS WITH TIES;
