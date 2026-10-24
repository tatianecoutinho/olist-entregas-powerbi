CREATE VIEW delivery AS

SELECT
  o.order_id,
  c.customer_state,
  julianday(o.order_delivered_customer_date)
    - julianday(o.order_purchase_timestamp) AS delivery_days,
  julianday(o.order_delivered_customer_date)
    - julianday(o.order_estimated_delivery_date) AS delay_days,
  CASE WHEN o.order_delivered_customer_date
       > o.order_estimated_delivery_date THEN 1 ELSE 0 END AS is_late
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL;

-- atraso vs nota do cliente
  select d.is_late,
       round(avg(r.review_score), 2) as nota_media,
       count(*) as pedidos
from delivery d
join order_reviews r on r.order_id = d.order_id
group by d.is_late;

-- frete médio por estado
select d.customer_state,
       round(avg(i.freight_value), 2) as frete_medio
from delivery d
join order_items i on i.order_id = d.order_id
group by d.customer_state;

-- % de atraso e prazo médio por estado
select customer_state,
       count(*) as pedidos,
       round(100.0 * sum(is_late) / count(*), 1) as pct_atraso,
       round(avg(delivery_days), 1) as prazo_medio
from delivery
group by customer_state
order by pct_atraso desc;

--Vendedores por estado
select seller_state, count(*) as vendedores
from sellers
group by seller_state

-- Prazo medio do frete vendedor do mesmo estado
select case when s.seller_state = c.customer_state
            then 'mesmo estado' else 'outro estado' end as tipo,
       round(avg(i.freight_value), 2) as frete_medio,
       count(*) as itens
from order_items i
join sellers s on s.seller_id = i.seller_id
join orders o on o.order_id = i.order_id
join customers c on c.customer_id = o.customer_id
group by tipo;
