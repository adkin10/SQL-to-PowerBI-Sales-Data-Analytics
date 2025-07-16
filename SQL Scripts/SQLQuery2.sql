/*====================================================
  DIM_Customer 
  Zmiany wzglêdem oryginalnego generatora:
  • ukryte niepotrzebne kolumny (wszystkie pozosta³e --)
  • dodane aliasy z spacj¹: [First Name], [Last Name]
  • utworzone pole [Full Name] = First + Last
  • Gender przerobiony z 'M/F' na 'Male/Female' via CASE
  • dodane g.City jako [Customer City] z LEFT JOIN DimGeography
  • ORDER BY CustomerKey ASC
====================================================*/

SELECT
    c.CustomerKey                   AS CustomerKey
    --,[GeographyKey]
    --,[CustomerAlternateKey]
    --,[Title]
    ,c.FirstName                    AS [First Name]
    --,[MiddleName]
    ,c.LastName                     AS [Last Name]
    ,c.FirstName + ' ' + c.LastName AS [Full Name]
    --,[NameStyle]
    --,[BirthDate]
    --,[MaritalStatus]
    --,[Suffix]
    ,CASE c.Gender
        WHEN 'M' THEN 'Male'
        WHEN 'F' THEN 'Female'
     END                            AS Gender
    --,[EmailAddress]
    --,[YearlyIncome]
    --,[TotalChildren]
    --,[NumberChildrenAtHome]
    --,[EnglishEducation]
    --,[SpanishEducation]            <-- pozostaje zakomentowane
    --,[FrenchEducation]
    --,[EnglishOccupation]
    --,[SpanishOccupation]
    --,[FrenchOccupation]
    --,[HouseOwnerFlag]
    --,[NumberCarsOwned]
    --,[AddressLine1]
    --,[AddressLine2]
    --,[Phone]
    ,c.DateFirstPurchase            AS DateFirstPurchase
    --,[CommuteDistance]
    ,g.City                         AS [Customer City]
FROM dbo.DimCustomer      AS c
LEFT JOIN dbo.DimGeography AS g
       ON g.GeographyKey = c.GeographyKey
ORDER BY
    CustomerKey ASC;