SELECT margin.orders_id
,margin.date_date

,ROUND(SUM(margin.margin) + SUM(CAST(ship_t.shipping_fee AS FLOAT64)) - SUM(CAST(ship_t.logcost AS FLOAT64)) - SUM(CAST(ship_t.ship_cost AS FLOAT64)),2) AS operational_margin
FROM {{ ref("int_sales_margin")}} AS margin
INNER JOIN {{ref("stg_raw__ship")}} AS ship_t
USING(orders_id)
GROUP BY margin.orders_id, margin.date_date
ORDER BY margin.orders_id DESC , margin.date_date