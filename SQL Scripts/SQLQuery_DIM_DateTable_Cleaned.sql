/*==================================================
  DIM_DateTable
  Oryginalny SELECT AdventureWorksDW2022.DimDate
  z moimi modyfikacjami (zakomentowania pól).
==================================================*/
SELECT
    [DateKey]                               -- klucz g³ówny
   ,[FullDateAlternateKey]      AS [Date]   -- zamienione na alias 'Date'
   --,[DayNumberOfWeek]                    -- ukryte: niepotrzebne w raportach
   ,[EnglishDayNameOfWeek]      AS [DAY]    -- pozostawione: nazwa dnia
   --,[SpanishDayNameOfWeek]               -- ukryte
   --,[FrenchDayNameOfWeek]                -- ukryte
   --,[DayNumberOfMonth]                   -- ukryte
   --,[DayNumberOfYear]                    -- ukryte
   ,[WeekNumberOfYear]          AS [WeekNr] -- pozostawione
   ,[EnglishMonthName]          AS [Month]  -- pe³na nazwa miesi¹ca
   ,LEFT([EnglishMonthName], 3) AS [MonthShort] -- nowy alias, skrócona nazwa
   --,[SpanishMonthName]                   -- ukryte
   --,[FrenchMonthName]                    -- ukryte
   ,[MonthNumberOfYear]         AS [MonthNo]   -- numer miesi¹ca
   ,[CalendarQuarter]           AS [Quarter]   -- kwarta³
   ,[CalendarYear]              AS [Year]      -- rok
   --,[CalendarSemester]                   -- ukryte
   --,[FiscalQuarter]                      -- ukryte
   --,[FiscalYear]                         -- ukryte
   --,[FiscalSemester]                     -- ukryte
FROM [AdventureWorksDW2022].[dbo].[DimDate]
WHERE [CalendarYear] >= 2023;
