SELECT
date_date
,operational_margin - campaigns_day.ads_cost AS ads_margin
,average_basket
,operational_margin
FROM  {{ref("finance_days")}} 
INNER JOIN {{ref("int_campaigns_day")}} AS campaigns_day
USING (date_date)
ORDER BY date_date DESC