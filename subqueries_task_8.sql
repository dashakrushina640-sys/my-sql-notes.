README.md
SELECT user_id,
 COUNT(*) AS orders_count,
 ROUND((SELECT AVG(orders_count_all) 
  FROM (SELECT user_id, COUNT(*) AS orders_count_all 
  FROM user_actions 
  WHERE action = 'order' 
  GROUP BY user_id) AS t), 2) AS orders_avg, 
 COUNT(*) - ROUND((SELECT AVG(orders_count_all) 
    FROM (SELECT user_id, COUNT(*) AS orders_count_all 
     FROM user_actions
     WHERE action = 'order' 
     GROUP BY user_id) AS t), 2) AS orders_diff 
FROM user_actions
WHERE action = 'order'
GROUP BY user_id 
ORDER BY user_id 
LIMIT 1000;
