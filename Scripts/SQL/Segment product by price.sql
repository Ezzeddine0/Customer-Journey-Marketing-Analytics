-- Segment the products by their prices
SELECT 
*,
CASE WHEN price < 50 THEN 'Low'
	 WHEN price between 50 AND 199 THEN 'Medium' 
	 Else 'High'
END AS price_segment
FROM products
