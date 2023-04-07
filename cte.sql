WITH all_products AS ( -- count all products per transaction
    SELECT transaction_id
          , month
          , count(product_id) AS count_all_products
    FROM transactions
    GROUP BY transaction_id, month
)
, electronic_products AS ( -- count phones, computers and monitors per transaction
    SELECT t.transaction_id
          , count(t.product_id) AS count_electronic_products
    FROM transactions t 
    JOIN category c ON t.category_id = c.category_id
    WHERE c.category_name = 'PHONE' 
        OR c.category_name = 'COMPUTER'
        OR c.category_name = 'MONITOR'
    GROUP BY t.transaction_id
)
, ratio_electronic_to_all AS ( -- calculate ratio of electronic to all products per transaction
    SELECT ap.transaction_id
          , NVL(ep.count_electronic_products, 0) / ap.count_all_products AS ratio
          /* NVL used as if there was no electronic product.
             If ep.count_electronic_products is NULL, it will be replaced with 0 */
    FROM all_products ap
    LEFT JOIN electronic_products ep ON ap.transaction_id = ep.transaction_id
)
SELECT -- at the end calculate averages per month, add number of days
       ap.month
      , avg(ap.count_all_products)        AS average_product_count
      , avg(ep.count_electronic_products) AS average_eletronic_product_count
      , avg(reta.ratio)                   AS average_ratio_electronic_to_al
      , count(c.date)                     AS count_days
FROM all_products ap
LEFT JOIN electronic_products ep       ON ap.transaction_id = ep.transaction_id
LEFT JOIN ratio_electronic_to_all reta ON ap.transaction_id = reta.transaction_id
JOIN calendar c                        ON ap.month = c.month
GROUP BY ap.month
