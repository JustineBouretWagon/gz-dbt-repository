SELECT *
,CAST(sales_b.revenue AS FLOAT64) - (CAST(sales_b.quantity AS FLOAT64) * CAST(pdt.purchase_price AS FLOAT64)) AS margin
,CAST(sales_b.quantity AS FLOAT64) * CAST(pdt.purchase_price AS FLOAT64) AS purchase_cost
FROM {{ ref("stg_raw__sales")}} AS sales_b
INNER JOIN {{ ref("stg_raw__product")}} AS pdt
USING (products_id)