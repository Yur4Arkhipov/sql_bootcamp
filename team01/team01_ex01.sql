insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    currency.name AS currency_name,
    b.money * COALESCE(
        (
            SELECT currency.rate_to_usd
            FROM currency currency
            WHERE currency.id = b.currency_id
                AND currency.updated <= b.updated + interval '1 day'
            ORDER BY b.updated + interval '1 day' - currency.updated ASC
            LIMIT 1
        ),
        (
            SELECT currency.rate_to_usd
            FROM currency
            WHERE currency.id = b.currency_id
                AND currency.updated > b.updated + interval '1 day'
            ORDER BY currency.updated - (b.updated + interval '1 day') ASC
            LIMIT 1
        )
    ) AS currency_in_usd
FROM balance b
JOIN currency ON currency.id = b.currency_id
LEFT JOIN "user" u ON b.user_id = u.id
GROUP BY b.user_id, u.name, u.lastname, b.money, b.currency_id, b.updated, currency.name
ORDER BY name DESC, lastname ASC, currency_name ASC;




























SELECT
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    tcur.name AS currency_name,
    tcur.money * COALESCE(tcur.rate_min, tcur.rate_max) AS currency_in_usd
FROM
    (
        SELECT
                balance.user_id,
                currency.id,
                currency.name,
                balance.money,
                (SELECT currency.rate_to_usd FROM currency
                            WHERE currency.id = balance.currency_id
                              AND currency.updated < balance.updated
                            ORDER BY rate_to_usd LIMIT 1
                            ) AS rate_min,
                (SELECT currency.rate_to_usd FROM currency
                            WHERE currency.id = balance.currency_id
                              AND currency.updated > balance.updated
                            ORDER BY rate_to_usd LIMIT 1
                            ) AS rate_max
        FROM currency
        JOIN balance ON currency.id = balance.currency_id
        GROUP BY
            balance.money,
            currency.name,
            currency.id,
            balance.updated,
            balance.currency_id,
            balance.user_id
        ORDER BY rate_min DESC, rate_max
    ) AS tcur
LEFT JOIN "user" ON tcur.user_id = "user".id
ORDER BY name DESC, lastname, currency_name;
