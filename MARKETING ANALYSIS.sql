SELECT * FROM MarketingData

---WHICH CAMPAIGN GENERATED THE HIGHEST NUMBER OF impressions, clicks, and conversions?
SELECT
Campaign,
SUM(Impressions) Total_Impressions,
SUM(Clicks) Total_Clicks,
SUM(Conversions) Total_Conversions
INTO Campaign_Performance
FROM
MarketingData
GROUP BY Campaign
ORDER BY Total_Impressions DESC

---What is the average cost-per-click (CPC)  and click-through rate (CTR) for each campaign?
SELECT
Campaign,
AVG(Daily_Average_CPC) TotalAverageCostPerClick,
AVG(CTR) AverageClickThroughRate
INTO AVG_CPC_CTR_PER_CAMPAIGN
FROM
Marketing_Data1
GROUP BY Campaign 
ORDER BY TotalAverageCostPerClick DESC

SELECT
Channel,
SUM(Spend_GBP) TotalCostPerAd,
SUM(Total_conversion_value_GBP) TotalRevenue,
((SUM(Total_conversion_value_GBP) - SUM(Spend_GBP) ) / SUM(Spend_GBP)) *100 AS ROI
FROM
Marketing_Data1
GROUP BY Channel
ORDER BY ROI DESC;


SELECT 
    Channel,
    SUM(Impressions) AS TotalImpressions,
    SUM(Clicks) AS TotalClicks,
    SUM(Conversions) AS TotalConversions
	INTO CHANNEL_PERFORMANCE_CORELLATION
FROM 
    MarketingData
GROUP BY 
    Channel
ORDER BY 
    TotalImpressions DESC;

SELECT
City_Location,
SUM(Likes_Reactions) TotalReactions,
SUM(Shares) TotalShares,
SUM(Comments) TotalComments,
(SUM(Likes_Reactions) + SUM(Shares) + SUM(Comments)) TotalEngagements
INTO CITIES_PERFORMANCE
FROM Marketing_Data1
GROUP BY City_Location
ORDER BY TotalEngagements DESC

SELECT 
    City_Location,
    SUM(Clicks) AS TotalClicks,
    SUM(Conversions) AS TotalConversions,
	(SUM(Conversions) + SUM(Clicks)) * 100 AS ConversionRate
	INTO CITIES_CONVERSION_RATES
FROM 
    MarketingData
GROUP BY 
    City_Location
ORDER BY
	ConversionRate DESC;

SELECT
Device,
Ad,
SUM(Likes_Reactions) TotalReactions,
SUM(Shares) TotalShares,
SUM(Comments) TotalComments,
(SUM(Likes_Reactions) + SUM(Shares) + SUM(Comments)) TotalEngagements
INTO AD_PERFORMANCE_PER_DEVICE
FROM Marketing_Data1
GROUP BY Device, Ad
ORDER BY TotalEngagements DESC

SELECT 
    Device,
    SUM(Clicks) AS TotalClicks,
    SUM(Conversions) AS TotalConversions,
	(SUM(Conversions) + SUM(Clicks)) * 100 AS ConversionRate
	INTO Conv_Rates_Per_Device
FROM 
    MarketingData
GROUP BY 
    Device
ORDER BY
	ConversionRate DESC;

SELECT
Ad,
(SUM(Conversions) + SUM(Clicks)) * 100 AS ConversionRate,
(SUM(Likes_Reactions) + SUM(Shares) + SUM(Comments)) TotalEngagements
INTO ADS_PERFORMANCE
FROM Marketing_Data1
GROUP BY Ad
ORDER BY TotalEngagements DESC

SELECT TOP 10
Ad,
Campaign,
City_Location,
Channel,
(SUM(Likes_Reactions) + SUM(Shares) + SUM(Comments)) TotalEngagements,
(SUM(Conversions) + SUM(Clicks)) * 100 AS ConversionRate
INTO TOP_PERFORMING_ADS
FROM Marketing_Data1
GROUP BY Ad,Campaign,City_Location,Channel
ORDER BY TotalEngagements

SELECT TOP 10
Campaign,
Channel,
Device,
(SUM(Total_conversion_value_GBP) - SUM(Spend_GBP) ) / SUM(Spend_GBP) *100 AS ROI
INTO RIO_PER_CAMPAIGN_CORRELATION
FROM Marketing_Data1
GROUP BY Campaign,Channel,Device
ORDER BY ROI DESC

SELECT
Campaign,
SUM(Spend_GBP) TotalSpent,
SUM(Total_conversion_value_GBP) TotalRev
INTO COST_CORELLATIONCAMPAIGN
FROM Marketing_Data1
GROUP BY Campaign
ORDER BY TotalSpent DESC

SELECT