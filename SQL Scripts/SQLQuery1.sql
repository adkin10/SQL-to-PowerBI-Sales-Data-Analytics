/*==================================================
  DIM_DateTable
  Oryginalny SELECT AdventureWorksDW2022.DimDate
  z moimi modyfikacjami (zakomentowania p�l).
==================================================*/
SELECT
    [DateKey]                               -- klucz g��wny
   ,[FullDateAlternateKey]      AS [Date]   -- zamienione na alias 'Date'
   --,[DayNumberOfWeek]                    -- ukryte: niepotrzebne w raportach
   ,[EnglishDayNameOfWeek]      AS [DAY]    -- pozostawione: nazwa dnia
   --,[SpanishDayNameOfWeek]               -- ukryte
   --,[FrenchDayNameOfWeek]                -- ukryte
   --,[DayNumberOfMonth]                   -- ukryte
   --,[DayNumberOfYear]                    -- ukryte
   ,[WeekNumberOfYear]          AS [WeekNr] -- pozostawione
   ,[EnglishMonthName]          AS [Month]  -- pe�na nazwa miesi�ca
   ,LEFT([EnglishMonthName], 3) AS [MonthShort] -- nowy alias, skr�cona nazwa
   --,[SpanishMonthName]                   -- ukryte
   --,[FrenchMonthName]                    -- ukryte
   ,[MonthNumberOfYear]         AS [MonthNo]   -- numer miesi�ca
   ,[CalendarQuarter]           AS [Quarter]   -- kwarta�
   ,[CalendarYear]              AS [Year]      -- rok
   --,[CalendarSemester]                   -- ukryte
   --,[FiscalQuarter]                      -- ukryte
   --,[FiscalYear]                         -- ukryte
   --,[FiscalSemester]                     -- ukryte
FROM [AdventureWorksDW2022].[dbo].[DimDate]
WHERE [CalendarYear] >= 2023;
