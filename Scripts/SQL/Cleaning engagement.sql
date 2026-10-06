-- Cleaning engagements data
SELECT 
EngagementID,
ContentID,
LOWER(REPLACE(ContentType,'Socialmedia','Social Media')) AS ContentType,
EngagementDate,
CampaignID,
ProductID,
Likes,
LEFT(ViewsClicksCombined,CHARINDEX('-',VIewsClicksCombined) - 1) AS Views, 
RIGHT(VIewsClicksCombined,LEN(VIewsClicksCombined) - CHARINDEX('-', VIewsClicksCombined)) AS Clicks
FROM engagement_data
WHERE ContentType != 'newsletter' -- not relevant for our analysis

