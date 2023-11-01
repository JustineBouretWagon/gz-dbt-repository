SELECT *
,(revenue - quantity)  * purchase_price AS margin
,quantity* purchase_price AS purchase_cost
,{{margin_percent("revenue","quantity*purchase_price")}}

FROM {{ ref("stg_raw__sales")}}
INNER JOIN {{ ref("stg_raw__product")}} 
USING (products_id)