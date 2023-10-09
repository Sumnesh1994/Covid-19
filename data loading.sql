--Table contains 9 columns -Sno, Date, Time, State,ConfirmedIndianNattional, ConfirmedForeignNational Cured, Deaths, Confirmed
--Table used for this analysis contains data from beginning of Pandemic till August, 2021.
--Cleaning of data is required as half of the dates were in 'Date' format and others were in 'Varchar' format.
--Handling the Date format data in Excel
--The SQL Queries are implemented 
----To Create table and Load Data in MySql
CREATE table covid_19_india12(
Sno serial primary key,
Date date,
Time time,
State text,
ConfirmedIndianNational integer,
ConfirmedForeignNational integer,
Cured integer,	
Deaths	integer,
Confirmed integer
)
select*
from covid_19_india12







 
