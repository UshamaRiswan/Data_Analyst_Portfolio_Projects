/*
Covid 19 Data Exploration

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

*/

-- Selecting Data that we are going to start with

SELECT *
FROM Data_Analyst_Projects.worldometer_data
WHERE continent is not NULL
ORDER BY 3,4

-- Selecting Data that we are going to start with

SELECT location, data, total_cases, new_cases, total_deaths, population
FROM Data_Analyst_Projects.worldometer
WHERE continent is not NULL
ORDER BY 1,2

-- Looking at Total Cases vs Total Deaths
-- Shows the likelihood of dying if you contact covid in my country

SELECT location, date, total_cases, total_death, ROUND((total_deaths/total_cases)*100, 2) AS DeathPercentage
FROM Data_Analyst_Projects.worldometer
WHERE location='Jamaica'
ORDER BY 1,2

-- Total Cases vs Population
-- Shows what percentage of the population got Covid

SELECT location,data, total_cases, population, ROUND((total_cases/population)*100, 5) AS CasesbyPopulation
FROM Data_Analyst_Projects.worldometer
WHERE location='Jamaica'
ORDER BY 1,2

-- Countries with Highest Infection Rate compared to Population

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, Round(MAX((total_cases/population))*100,2) AS PercentPopulationInfected
FROM Data_Analyst_Projects.worldometer
WHERE location='Jamaica'
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC

-- Countries with Highest Death Count per Population

SELECT location, MAX(CAST(total_deaths AS int)) AS TotalDeathCount
FROM Data_Analyst_Projects.worldometer
WHERE continent is not NULL
Group BY location
ORDER BY TotalDeathCount DESC

-- Global Numbers by date

SELECT date, SUM(new_cases) AS TotalCases, SUM(cast(new_deaths AS int)) AS TotalDeaths, ROUND(SUM(cast(new_cases))*100, 2) AS DeathPercentage
FROM Data_Analyst_Projects.worldometer
WHERE continent is NOT NULL
GROUP BY date 
ORDER BY 1,2

-- Globals Numbers overall

SELECT SUM(new_cases) AS TotalCases, SUM(cast(new_deaths AS int)) AS TotalDeaths, ROUND((SUM(cast(new_deaths AS int))/SUM(new_cases))*100, 2) AS DeathPercentage
FROM Data_Analyst_Projects.worldometer
WHERE continent is NOT NULL
Group BY date
ORDER BY 1,2


