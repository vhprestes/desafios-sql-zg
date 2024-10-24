SELECT ca.name, round(
        (
            sc.math * 2 + sc.specific * 3 + sc.project_plan * 5
        ) / 10, 2
    ) AS avg
FROM candidate AS ca
    JOIN score AS sc ON ca.id = sc.candidate_id
ORDER BY avg DESC;