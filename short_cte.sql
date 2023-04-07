WITH table_with_count_products AS (
  SELECT transaction_id
        , month
        , count(product_id) AS count_products
  FROM transactions
  GROUP BY transaction_id, month 
)
SELECT month
       , avg(count_products) AS average_product_count
FROM table_with_count_products
GROUP BY month
