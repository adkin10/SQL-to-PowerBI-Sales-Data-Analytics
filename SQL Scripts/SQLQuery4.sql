/*====================================================
  FACT_InternetSales 
  Zmiany wzgl�dem oryginalnego generatora:
  � ukryte nieu�ywane kolumny (wszystkie pozosta�e --)
  � zachowano tylko klucze faktu i SalesAmount
  � filtr: ostatnie 2 pe�ne lata (LEFT(OrderDateKey,4) >= YEAR(GETDATE())-2)
  � ORDER BY OrderDateKey ASC
====================================================*/

SELECT
    [ProductKey]
   ,[OrderDateKey]
   ,[DueDateKey]
   ,[ShipDateKey]
   ,[CustomerKey]
   --,[PromotionKey]
   --,[CurrencyKey]
   --,[SalesTerritoryKey]
   ,[SalesOrderNumber]
   --,[SalesOrderLineNumber]
   --,[RevisionNumber]
   --,[OrderQuantity]
   --,[UnitPrice]
   --,[ExtendedAmount]
   --,[UnitPriceDiscountPct]
   --,[DiscountAmount]
   --,[ProductStandardCost]
   --,[TotalProductCost]
   ,[SalesAmount]
   --,[TaxAmt]
   --,[Freight]
   --,[CarrierTrackingNumber]
   --,[CustomerPONumber]
   --,[OrderDate]
   --,[DueDate]
   --,[ShipDate]
FROM dbo.[FactInternetSales]
WHERE LEFT(OrderDateKey, 4) >= YEAR(GETDATE()) - 2
ORDER BY
    OrderDateKey ASC;
