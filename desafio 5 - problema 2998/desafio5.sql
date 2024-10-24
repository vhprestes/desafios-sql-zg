WITH
    cumulative_profits AS (
        SELECT
            c.id AS client_id,
            c.name,
            c.investment,
            o.month,
            SUM(o.profit) OVER (
                PARTITION BY
                    o.client_id
                ORDER BY o.month
            ) AS cumulative_profit
        FROM clients c
            JOIN operations o ON c.id = o.client_id
    ),
    payback_data AS (
        SELECT
            client_id,
            name,
            investment,
            month,
            cumulative_profit - investment AS return_value,
            ROW_NUMBER() OVER (
                PARTITION BY
                    client_id
                ORDER BY month
            ) AS rn
        FROM cumulative_profits
        WHERE
            cumulative_profit >= investment
    )
SELECT
    name,
    investment,
    month AS month_of_payback,
    return_value AS "return"
FROM payback_data
WHERE
    rn = 1
ORDER BY return_value DESC;