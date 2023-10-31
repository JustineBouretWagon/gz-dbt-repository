SELECT date_date
,COUNT(orders_id) AS nb_of_transactions

,SUM(operational_margin) AS operational_margin
FROM {{ref("int_orders_operational_margin")}}
GROUP BY date_date