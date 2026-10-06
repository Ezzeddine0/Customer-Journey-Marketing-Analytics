
--Customer Data
SELECT 
c.CustomerID,
c.CustomerName,
c.Email,
c.Age,
c.Gender,
g.Country,
g.City,
CASE WHEN Age < 20 THEN 'Below 20'
	 WHEN Age BETWEEN 20 AND 29 THEN '20-29'
	 WHEN Age Between 30 AND 39 THEN '30-39'
	 WHEN AGE BETWEEN 40 AND 49 THEN '40-49'
	 ELSE 'Above 50'
END AS age_group
FROM customers as c
LEFT JOIN geography as g
ON g.GeographyID = c.GeographyID
