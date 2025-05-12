WITH cte_last_rates AS (
    SELECT 
        currency.id,
        currency.name AS currency_name,
        currency.rate_to_usd AS rate_to_usd,
        ROW_NUMBER() OVER (PARTITION BY currency.id ORDER BY currency.updated DESC) AS rn
    FROM currency
)
SELECT 
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    balance.type,
    SUM(balance.money) AS volume,
    COALESCE(lr.currency_name, 'not defined') AS currency_name,
    COALESCE(lr.rate_to_usd, 1) AS last_rate_to_usd,
    SUM(balance.money) * COALESCE(lr.rate_to_usd, 1) AS total_volume_in_usd
FROM balance
LEFT JOIN "user" ON balance.user_id = "user".id
LEFT JOIN cte_last_rates lr ON balance.currency_id = lr.id AND lr.rn = 1
GROUP BY 
    "user".name, 
    "user".lastname, 
    balance.type, 
    lr.currency_name, 
    lr.rate_to_usd
ORDER BY name DESC, lastname, type;