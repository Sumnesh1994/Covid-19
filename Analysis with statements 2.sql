--5) Maximum Per-Day Cured case per State--
SELECT State,
    Date,
    CAST(MaxPerDayCure AS SIGNED) AS MaxPerDayCured    
 FROM
 (SELECT  State,
     Date,
     MAX(PerDayCured) OVER (PARTITION BY State) AS MaxPerDayCure,
     DENSE_RANK() OVER (PARTITION BY State ORDER BY PerDayDeaths DESC) AS HighestCured
 FROM covid_19_india12) cte
 WHERE HighestCured = 1 
 ORDER BY MaxPerDayCured DESC
 
 **NOTE : : (IN MYSQL WITH CAST WE USE SIGNED FOR INTEGER )
 
 Output : : --Highest number of cured cases per day was recorded in Kerala(99651) on 7th June, 2021 followed by Maharashtra(82266) and Karnataka(61766).
 
 --6) Calculating the State-wise Mortality Rate--
WITH cte AS
 (SELECT  State,
   Max(Deaths) as Deaths,
   Max(Confirmed) as CovidCases
 FROM covid_19_india12
 GROUP BY STATE)
 SELECT  State, 
   CONCAT(ROUND((Deaths/CovidCases)*100, 2), '%') AS DeathRate
 FROM cte
 ORDER BY DeathRate DESC;
 
 Output : : --This shows till now, Punjab(2.72%) has the highest Patient Mortality Rate in the country followed by Uttarakhand(2.15%) and Maharashtra(2.11%), while state of

--7) Calculating the State-wise Cured Ratio---
WITH cte AS
 (SELECT  State,
   Max(Cured) as Cured,
   Max(Confirmed) as CovidCases
 FROM covid_19_india12
 GROUP BY STATE)
 SELECT  State, 
   CONCAT(ROUND((Cured/CovidCases)*100, 2), '%') AS CuredRate
 FROM cte
 ORDER BY CuredRate DESC

Output : : --This shows till now, Dadra and Nagar Haveli and Daman and Diu(99.92%) has the highest Patient Cured ratio in the country followed by Lakshadweep(99.05%) and Rajasthan(99.04%),
--while Mizoram(72.80%) has the lowest









