--Creating New Column for Active Covid Cases--
ALTER TABLE covid_19_india12
	ADD Active int;
UPDATE covid_19_india12
	SET Active = (Confirmed-Deaths-Cured);

--Creating New Column for State-wise per day Confirmed Cases--
ALTER TABLE covid_19_india12
	ADD PerDayConfirmed int;
WITH v_confirmed AS
(
    SELECT Confirmed - LAG(Confirmed,1) OVER (PARTITION BY State ORDER BY Date) AS perDayCase, 
           Date, 
           State 
    FROM covid_19_india12
)
UPDATE covid_19_india12
JOIN v_confirmed
ON covid_19_india12.Date = v_confirmed.Date AND covid_19_india12.State = v_confirmed.State
SET covid_19_india12.PerDayConfirmed = v_confirmed.perDayCase;

--Creating New Column for State-wise per day Cured Cases--
ALTER TABLE covid_19_india12
	ADD PerDayCured int;
WITH v_cured AS
(
    SELECT Cured - LAG(Cured, 1) OVER (PARTITION BY State ORDER BY Date) AS perDayCase, 
           Date, 
           State 
    FROM covid_19_india12
)
UPDATE covid_19_india12
JOIN v_cured
ON covid_19_india12.Date = v_cured.Date AND covid_19_india12.State = v_cured.State
SET covid_19_india12.PerDayCured = v_cured.perDayCase;

--Creating New Column for State-wise per day Deaths Cases--
ALTER TABLE covid_19_india12
	ADD PerDayDeaths int;
WITH v_deaths AS
(
    SELECT Deaths - LAG(Deaths, 1) OVER (PARTITION BY State ORDER BY Date) AS perDayCase, 
           Date, 
           State
    FROM covid_19_india12
)
UPDATE covid_19_india12
JOIN v_deaths
ON covid_19_india12.Date = v_deaths.Date AND covid_19_india12.State = v_deaths.State
SET covid_19_india12.PerDayDeaths = v_deaths.perDayCase;

select* 
from covid_19_india12




    