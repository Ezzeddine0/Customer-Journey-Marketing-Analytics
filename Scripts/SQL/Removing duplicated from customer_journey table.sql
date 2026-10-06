-- Cleaning removing duplicates from the customer_journey table

WITH Duplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action
               ORDER BY JourneyID
           ) AS rn,
           AVG(Duration) OVER (PARTITION BY VisitDate) AS avg_duration
    FROM customer_journey
)
SELECT 
JourneyID,
CustomerID,
ProductID,
VisitDate,
lOWER(Stage) AS Stage,
Action,
COALESCE(Duration,avg_duration) AS Duration --If duration is null take the one in avg_duration
FROM Duplicates
WHERE rn = 1 
ORDER BY CustomerID


