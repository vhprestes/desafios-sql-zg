SELECT ca.name as name, SUM(amount) as sum
FROM products as pr
    JOIN categories as ca ON ca.id = pr.id_categories
GROUP BY
    ca.name
ORDER BY ca.name ASC