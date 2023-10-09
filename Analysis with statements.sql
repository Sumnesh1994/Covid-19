--1) Total State-wise Confirmed cases till date--
SELECT  State,
		MAX(Confirmed) AS TotalCases 
FROM covid_19_india12 
GROUP BY State 
ORDER BY TotalCases DESC

--Output : : Most Corona Cases have appeared in Maharashtra and least in Andaman&Nicobar till date 

--2) State-Wise Maximum Active Cases in a day--
WITH cte AS (
    SELECT 
        Date,
        State,
        MONTHNAME(Date) AS Month,
        MAX(Active) OVER (PARTITION BY State) AS MaxActiveCasesInDay,
        DENSE_RANK() OVER (PARTITION BY State ORDER BY Active DESC) AS HighestActive
    FROM covid_19_india12
)
SELECT 
    State, 
    Date, 
    Month, 
    MaxActiveCasesInDay 
FROM cte 
WHERE HighestActive = 1 
ORDER BY MaxActiveCasesInDay DESC;

--Output : :The count of highest Active cases at any time for most states appeared in May 2021, except for Maharashtra & Delhi where peak occurred early in April 2021.

--3) Maximum Per-Day Confirmed case per State--
SELECT State, MaxPerDayConfirmed, Date
FROM
    (SELECT Date, State, MAX(PerDayConfirmed) OVER (PARTITION BY State) AS MaxPerDayConfirmed,
    DENSE_RANK() OVER (PARTITION BY State ORDER BY PerDayConfirmed DESC) AS HighestConfirmed
    FROM covid_19_india12) cte
WHERE HighestConfirmed = 1 
ORDER BY MaxPerDayConfirmed DESC

--Output : : Maharashtra(68631) recorded the highest number of cases in a single day on 19th April,2021 followed by Karnataka(50112) on 6th May,2021 and Kerala(43529) on 13th May,2021
--while Andaman&Nicobar(149) recorded the minimum number of per day Max confirmed cases on 15th Aug, 2020

--4) Maximum Per-Day Deaths case per State
SELECT  State,
		MaxPerDayDeaths,
		Date
FROM
(SELECT  Date,
		 State,
		 MAX(PerDayDeaths) OVER (PARTITION BY State) AS MaxPerDayDeaths,
		 DENSE_RANK() OVER (PARTITION BY State ORDER BY PerDayDeaths desc) AS HighestDeaths
FROM covid_19_india12) cte
WHERE HighestDeaths = 1 
ORDER BY MaxPerDayDeaths DESC;

Output : : --Bihar(3971) registered most number of Deaths in any single day on 10th June,2021 followed by Maharashtra(3656) on 21st July, 2021,Madhya Paresh (1481) on 13th July,2021 and Karnataka(624) on 24th May, 2021.


 
