----Data Cleaning (Spelling Errors in State Column and removal of null values and empty spaces) ----
**Errors were identified using excel 
DELETE FROM covid_19_india12 WHERE State = 'Cases being reassigned to states';
DELETE FROM covid_19_india12 WHERE State = 'Daman & Diu';
DELETE FROM covid_19_india12 WHERE State = 'Unassigned';

UPDATE covid_19_india12 
	SET State = 'Dadra and Nagar Haveli and Daman and Diu' 
  WHERE State = 'Dadra and Nagar Haveli';
UPDATE covid_19_india12
	SET State = 'Bihar' 
  WHERE State = 'Bihar****';
UPDATE covid_19_india12 
	SET State = 'Telangana' 
  WHERE State = 'Telengana';
  UPDATE covid_19_india12 
	SET State = 'Madhya Pradesh' 
  WHERE State = 'Madhya Pradesh***';
UPDATE covid_19_india12 
	SET State = 'Himachal Pradesh' 
  WHERE State = 'Himanchal Pradesh';
  UPDATE covid_19_india12 
	SET State = 'Maharashtra' 
  WHERE State = 'Maharashtra***';
    UPDATE covid_19_india12 
	SET State = 'Karnataka' 
  WHERE State = 'Karanataka';
  
SELECT * FROM covid_19_india12 
WHERE Date IS NULL OR Time IS NULL OR State IS NULL OR ConfirmedIndianNational IS NULL OR ConfirmedForeignNational IS NULL OR Cured IS NULL OR Deaths IS NULL OR Confirmed IS NULL;
DELETE FROM covid_19_india12 
WHERE Date IS NULL OR Time IS NULL OR State IS NULL OR ConfirmedIndianNational IS NULL OR ConfirmedForeignNational IS NULL OR Cured IS NULL OR Deaths IS NULL OR Confirmed IS NULL;

UPDATE covid_19_india12
SET PerDayConfirmed = IFNULL(PerDayConfirmed, 0),
    PerDayCured = IFNULL(PerDayCured, 0),
    PerDayDeaths = IFNULL(PerDayDeaths, 0);

Select* FROM covid_19_india12


