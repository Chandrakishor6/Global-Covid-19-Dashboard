
/**Data Cleaning**/

--Updating Data type of columns

select COLUMN_NAME, DATA_TYPE from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='CovidDeaths';

alter table CovidDeaths
alter column country nvarchar(250);

alter table CovidDeaths
alter column continent nvarchar(250);

alter table CovidVaccinations
alter column country nvarchar(250);

--Removing country with zero population

delete from CovidDeaths
where population=0;

--Removing records with null continent

delete from CovidDeaths
where continent is null

delete from CovidVaccinations
where continent is null

/**Data Analysis**/


/** 1. Infection Rate **/

-- Severly infected country
select top 10 country as severly_infected_country, max(total_cases) as Total_Cases,
cast((max(total_cases)*1.0/nullif(population,0))*100 as decimal(12, 4))  as infection_rate
from CovidDeaths
group by country, population
order by infection_rate desc;

-- TO know the infection rate for a particular country for a given time period
select country, date,total_cases,
cast((total_cases*1.0/nullif(population,0))*100 as decimal(12, 4))  as infection_rate
from CovidDeaths
where country = 'India' and date = '2021-01-01'
order by country, date;

/** Cases Per Million Population **/

select top 5 country, max(total_cases) as Tota_Cases, max(total_cases_per_million) as Total_Cases_Per_Million
from CovidDeaths
group by country
order by Total_Cases_Per_Million desc;

/** Deaths Per Million Population **/

select top 5 country, max(total_deaths) as Total_Deaths, max(total_deaths_per_million) as Deaths_per_million
from CovidDeaths
group by country
order by Deaths_per_million desc;

/** Top country with heighest cases **/
select top 10 country, max(total_cases) as Total_cases from CovidDeaths 
group by country
order by Total_cases desc;

/** Top country with heighest Deaths **/
select top 10 country, max(total_deaths) as Total_deaths from CovidDeaths 
group by country
order by Total_deaths desc;

/** Mortality Rate**/

-- Countries with heighest mortality rate

select top 10 country, max(total_cases)as TotalCases, max(total_deaths) as TotalDeaths,
cast(max(total_deaths)*1.0/nullif(max(total_cases), 0)*100 as decimal(10,2)) as mortality_Rate
from CovidDeaths
group by country
order by mortality_Rate desc;

--Countries with lowest mortality rate
select top 10 country, max(total_cases)as TotalCases, max(total_deaths) as TotalDeaths,
cast(max(total_deaths)*1.0/nullif(max(total_cases), 0)*100 as decimal(10,2)) as mortality_Rate
from CovidDeaths
group by country
having max(total_cases)>0 and max(total_cases) is not null
order by mortality_Rate;

/** Countries with highest death count per population **/

select country,population, max( total_deaths) as toal_deaths,
cast(max((total_deaths*1.0/nullif(population,0))*100) as decimal(10, 2))  as deathRate
from CovidDeaths
group by country, population
order by deathRate desc;

--Total deaths by continent

select continent, sum(new_deaths) as TotalDeathCount
from CovidDeaths
group by continent
order by TotalDeathCount desc;

--Death count in continents per population

select continent,
sum(new_deaths) as total_deaths, 
sum(distinct(population)) as TotalPopulation,
cast(sum(new_deaths)*1.0/sum(distinct(population))*100 as decimal(12,4)) as DeathRate
from CovidDeaths
group by continent
order by DeathRate desc;

--Global Numbers

select date, sum(new_cases) as GlobalCases,
sum(new_deaths) as GlobalDeaths,
cast(sum(new_deaths)*1.0/nullif(sum(new_cases),0)*100 as decimal(12,4)) as GlobalDeathRate
from CovidDeaths
group by date
order by date;

--Total vaccination

select d.date, d.country, d.population, v.new_vaccinations,
sum(v.new_vaccinations) over(partition by d.country order by d.country, d.date) as totalVac
from CovidDeaths as d
join CovidVaccinations as v on 
v.country=d.country and v.date=d.date
order by d.country, d.date;

--percent of population vaccinated

with covidVac as (
select v.*, d.population from CovidDeaths as d
join CovidVaccinations as v on 
v.country=d.country and v.date=d.date
)
select top 10 country, max(people_vaccinated) as TotalPeopleVaccinated,
cast(max(people_vaccinated)*1.0/max(population)*100 as decimal(10,2)) as vaccination_Percent
from covidVac
group by country
order by vaccination_percent desc;

--percent of population fully vaccinated

with covidVac as (
select v.*, d.population from CovidDeaths as d
join CovidVaccinations as v on 
v.country=d.country and v.date=d.date
)
select top 10 country, max(people_fully_vaccinated) as TotalPeopleVaccinated,
cast(max(people_vaccinated)*1.0/max(population)*100 as decimal(10,2)) as vaccination_Percent
from covidVac
group by country
order by vaccination_percent desc;

--Country with least vaccinated population

with covidVac as (
select v.*, d.population from CovidDeaths as d
join CovidVaccinations as v on 
v.country=d.country and v.date=d.date
)
select top 5 country, max(people_vaccinated) as TotalPeopleVaccinated,
cast(max(people_vaccinated)*1.0/max(population)*100 as decimal(10,2)) as vaccination_Percent
from covidVac
group by country
having max(people_vaccinated) is not null
order by vaccination_percent;