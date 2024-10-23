SELECT id, name
FROM customers
WHERE
    customers.id NOT IN(
        SELECT id_customers
        from locations
    )
ORDER BY id;