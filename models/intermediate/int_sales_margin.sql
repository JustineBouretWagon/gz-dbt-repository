SELECT *
,(revenue - quantity)  * purchase_price AS margin
,quantity* purchase_price AS purchase_cost
,{{margin_percent("revenue","quantity*purchase_price")}} AS margin_percent_c

FROM {{ ref("stg_raw__sales")}}
INNER JOIN {{ ref("stg_raw__product")}} 
USING (products_id)