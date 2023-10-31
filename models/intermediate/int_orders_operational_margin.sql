WITH join_t AS (SELECT margin.orders_id
,margin.date_date
,(margin.margin + ship_t.shipping_fee - ship_t.logcost  - ship_t.ship_cost ) AS operational_margin
FROM {{ ref("int_sales_margin")}} AS margin
INNER JOIN {{ref("stg_raw__ship")}} AS ship_t
USING(orders_id))
SELECT orders_id
,date_date
,SUM(operational_margin)
FROM join_t
GROUP BY orders_id, date_date
ORDER BY orders_id DESC, date_date

