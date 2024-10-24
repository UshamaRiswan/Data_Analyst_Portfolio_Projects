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
WHERE location='Jamaica'

