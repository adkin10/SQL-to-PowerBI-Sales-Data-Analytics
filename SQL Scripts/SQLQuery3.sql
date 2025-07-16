/*====================================================
  DIM_Product
  Zmiany względem oryginalnego generatora:
  • ukryte nieużywane kolumny (wszystkie pozostałe --)
  • dodane czytelne aliasy ze spacją: [Product Name], [Sub Category] itd.
  • utworzone hierarchie: Product → Sub Category → Product Category
  • Status zabezpieczony ISNULL: 'Outdated' gdy NULL
  • ORDER BY ProductKey ASC
====================================================*/

SELECT
    p.[ProductKey]                              AS ProductKey
    ,p.[ProductAlternateKey]                    AS ProductItemCode
    --,[ProductSubcategoryKey]
    --,[WeightUnitMeasureCode]
    --,[SizeUnitMeasureCode]
    ,p.[EnglishProductName]                     AS [Product Name]
    ,ps.[EnglishProductSubcategoryName]         AS [Sub Category]
    ,pc.[EnglishProductCategoryName]            AS [Product Category]
    --,[SpanishProductName]
    --,[FrenchProductName]
    --,[StandardCost]
    --,[FinishedGoodsFlag]
    ,p.[Color]                                  AS [Product Color]
    --,[SafetyStockLevel]
    --,[ReorderPoint]
    --,[ListPrice]
    ,p.[Size]                                   AS [Product Size]
    --,[SizeRange]
    --,[Weight]
    --,[DaysToManufacture]
    ,p.[ProductLine]                            AS [Product Line]
    --,[DealerPrice]
    --,[Class]
    --,[Style]
    ,p.[ModelName]                              AS [Product Model Name]
    --,[LargePhoto]
    ,p.[EnglishDescription]                     AS [Product Description]
    --,[FrenchDescription]
    --,[ChineseDescription]
    --,[ArabicDescription]
    --,[HebrewDescription]
    --,[ThaiDescription]
    --,[GermanDescription]
    --,[JapaneseDescription]
    --,[TurkishDescription]
    --,[StartDate]
    --,[EndDate]
    ,ISNULL(p.[Status], 'Outdated')             AS [Product Status]
FROM dbo.[DimProduct]               AS p
LEFT JOIN dbo.[DimProductSubcategory] AS ps
       ON ps.[ProductSubcategoryKey] = p.[ProductSubcategoryKey]
LEFT JOIN dbo.[DimProductCategory]    AS pc
       ON pc.[ProductCategoryKey]   = ps.[ProductCategoryKey]
ORDER BY
    p.[ProductKey] ASC;
